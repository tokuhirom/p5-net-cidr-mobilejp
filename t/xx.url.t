# -*- mode: cperl; -*-
use Test::Base;
use UNIVERSAL::require;

plan tests => 1 * blocks;

run {
    my $block = shift;
    my $scraper = 'Net::CIDR::MobileJP::Scraper::Plugin::' . $block->name;
    $scraper->use;
    is($scraper->new->url, $block->expected, $block->name);
};

__END__
=== AirHPhone
--- expected: http://www.willcom-inc.com/ja/service/contents_service/club_air_edge/for_phone/ip/

=== DoCoMo
--- expected: http://www.nttdocomo.co.jp/service/imode/make/content/ip/

=== EZweb
--- expected: http://www.au.kddi.com/ezfactory/tec/spec/ezsava_ip.html

=== Vodafone
--- expected: http://developers.softbankmobile.co.jp/dp/tech_svc/web/ip.php
