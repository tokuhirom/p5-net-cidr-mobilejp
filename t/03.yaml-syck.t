use strict;
use warnings;
use Test::More;
use Net::CIDR::MobileJP;
use t::Utils;

eval "use YAML::Syck";
plan skip_all => "missing YAML::Syck" if $@;
plan tests => 3;

ok $INC{'YAML/Syck.pm'};
ok !$INC{'YAML.pm'};
t::Utils->check();

