package Env::Heroku::Rediscloud;
use strict;
use warnings;
use URI;

sub import {
    my ($self) = @_;

    my $redisurl = $ENV{REDISCLOUD_URL} || 'redis://localhost:6379/';
    if ( $redisurl and $redisurl =~ s/^redis:// ) {
        my $url = URI->new( $redisurl, 'http' );
        $ENV{REDISHOST} = $url->host;
        $ENV{REDISPORT} = $url->port;
        (undef,$ENV{REDISPASSWORD}) = split ':', $url->userinfo
            if $url->userinfo;
    }

    return 1;
}

1;
