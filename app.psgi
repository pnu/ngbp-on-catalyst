use strict;
use warnings;
use lib './lib';
use Env::Heroku::Pg;
use WebApp;
use Plack::Builder;
use Plack::Response;
use Text::Xslate;

my $app = WebApp->apply_default_middlewares(WebApp->psgi_app);

my $spa = sub { my ($root,$base) = @_; builder {
    enable 'Head'; enable 'ConditionalGET'; enable 'HTTPExceptions';
    enable 'Static', path => sub{1}, root => $root, pass_through => 1;
    enable_if { $_[0]->{PATH_INFO} } sub { my $app = shift; sub { my $env = shift;
        my $tx = Text::Xslate->new( path => $root );
        my $res = Plack::Response->new( 200, [content_type => 'text/html;charset=utf-8'] );
        $res->body( $tx->render( 'index.html', { base => $base } ) );
        return $res->finalize;
    }};
    sub { [ 301, [ Location => $base ], [] ] };
}};

builder {
    enable 'ReverseProxy';
    enable 'ErrorDocument', 500 => 'root/assets/html/500.html';
    mount '/api' => $app;
    mount '/build' => $spa->('root/app/build','/build/');
    mount '/' => $spa->('root/app/bin','/');
}
