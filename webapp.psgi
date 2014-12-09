use strict;
use warnings;

use WebApp;

my $app = WebApp->apply_default_middlewares(WebApp->psgi_app);
$app;

