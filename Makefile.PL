use inc::Module::Install;

name            'Net-CIDR-MobileJP';
all_from        'lib/Net/CIDR/MobileJP.pm';

requires 'Net::CIDR::Lite'      => 0.20;
requires 'YAML'                 => 0;
requires 'File::ShareDir'       => 1.00;

build_requires 'WWW::MobileCarrierJP' => '0.23';

install_share;
author_tests('xt');

auto_set_repository;
WriteAll;

