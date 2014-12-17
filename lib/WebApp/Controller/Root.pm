package WebApp::Controller::Root;
use utf8;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use Try::Tiny;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',
    namespace => '',
);

sub demo : Local ActionClass('REST') {
    my ( $self, $c ) = @_;
    if ( $c->req->header('Origin') ) {
        $c->res->header('Access-Control-Allow-Origin' => '*')
    }
};

sub demo_OPTIONS {
    my ( $self, $c, $id ) = @_;
    $c->res->header('Access-Control-Allow-Methods', 'GET');
    $self->status_no_content( $c );
};

sub demo_GET {
    my ( $self, $c, $id ) = @_;
    try {
        my $row = $c->model('DB::Demo')->find($id);
        my $entity = {
            id => $row->id,
            message => $row->message,
        };
        $self->status_ok( $c, entity => $entity );
    } catch {
        die $_ unless blessed $_ && $_->isa('WebApp::Error');
        $self->status_not_found( $c, message => $_->message );
    };
}

sub default : Path {
    my ( $self, $c ) = @_;
    $self->status_not_found( $c, message => 'no such api method' );
}

__PACKAGE__->meta->make_immutable;

1;
