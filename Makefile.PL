use strict;
use warnings;
use lib qw(lib);
use inc::Module::Install;
use File::Spec;

name            'Net-CIDR-MobileJP';
all_from        'lib/Net/CIDR/MobileJP.pm';

requires 'Net::CIDR::Lite'      => 0.20;
requires 'YAML'                 => 0;
requires 'File::ShareDir'       => 1.00;

build_requires 'WWW::MobileCarrierJP' => '0.19';

install_share;
author_tests('xt');

my $cwd = Cwd::cwd;
auto_install_now;
chdir $cwd;
WriteAll;

