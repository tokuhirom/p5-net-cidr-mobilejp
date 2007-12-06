# -*- mode: cperl; -*-
use Test::Base;

plan tests => 2 * blocks;

run {
    my $block = shift;
    my $scraper = 'Net::CIDR::MobileJP::Scraper::Plugin::' . $block->name;
    use_ok( $scraper );
    my $result = $scraper->new->run;
    cmp_ok(@{ $result }, '>', 6, $block->name)
        or diag(join("\n", map { "- $_" } @{$result}));
};

__END__
=== AirHPhone
=== DoCoMo
=== EZweb
=== Vodafone
