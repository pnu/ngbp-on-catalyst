package Env::Heroku::Pg;
use strict;
use warnings;
use URI;

sub import {
    my ($self) = @_;

    my $dburl = $ENV{DATABASE_URL};
    if ( $dburl and $dburl =~ s/^postgres:// ) {
        my $pgurl = URI->new( $dburl, 'http' );
        $ENV{PGHOST} = $pgurl->host;
        $ENV{PGPORT} = $pgurl->port;
        $ENV{PGDATABASE} = substr $pgurl->path, 1;
        ($ENV{PGUSER},$ENV{PGPASSWORD}) = split ':', $pgurl->userinfo;

        $ENV{DBI_DRIVER} = 'Pg';
        $ENV{DBI_DSN}    = 'dbi:Pg:'.$ENV{PGDATABASE}.'@'.$ENV{PGHOST}.':'.$ENV{PGPORT};
        $ENV{DBI_USER}   = $ENV{PGUSER};
        $ENV{DBI_PASS}   = $ENV{PGPASSWORD};
    }

    return 1;
}

1;
