#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';
use FranticCom::SetCloudEnv ( $ENV{PLACK_ENV} || 'development' );
use WebApp;
use DBIx::Class::Migration::Script;

DBIx::Class::Migration::Script->run_with_options(
    schema => WebApp->model('DB')->schema,
    databases => ['PostgreSQL'],
    target_dir => WebApp->path_to('share')->stringify
);
