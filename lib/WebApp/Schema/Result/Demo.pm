package WebApp::Schema::Result::Demo;
use utf8;
use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("demo");

__PACKAGE__->add_columns(
    "id",
    { data_type => "integer", is_auto_increment => 1 },
    "message",
    { data_type => "varchar", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

1;

