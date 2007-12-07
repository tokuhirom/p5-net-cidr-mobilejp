# -*- mode: cperl; -*-
use strict;
use warnings;
use Test::More tests => 4;
use Net::CIDR::MobileJP::Scraper;

my $result = Net::CIDR::MobileJP::Scraper->new->run;
for my $carrier (qw/I E V H/) {
    cmp_ok(scalar(@{ $result->{$carrier} }), '>', 6, $carrier);
}
