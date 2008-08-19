use strict;
use warnings;
use Test::More;
use lib 't/testlib';
use Net::CIDR::MobileJP;
use t::Utils;

plan tests => 3;

is $INC{'YAML/Syck.pm'}, 't/testlib/YAML/Syck.pm';
ok $INC{'YAML.pm'};
t::Utils->check();

