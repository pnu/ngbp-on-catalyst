requires 'Catalyst::Runtime' => '5.90077';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
requires 'DBIx::Class::Migration';
requires 'DBD::Pg';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Controller::REST';
requires 'Catalyst::View::Xslate';
requires 'LWP';
requires 'LWP::Protocol::https';
requires 'Plack::Response';
requires 'Plack::Middleware::DirIndex';
requires 'Plack::Middleware::CrossOrigin';
requires 'Throwable';
requires 'Try::Tiny';
