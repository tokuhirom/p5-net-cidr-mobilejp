package Net::CIDR::MobileJP::Scraper::Plugin::EZweb;
use strict;
use warnings;
use base qw/Net::CIDR::MobileJP::Scraper::Plugin/;
use Jcode;

sub url { return 'http://www.au.kddi.com/ezfactory/tec/spec/ezsava_ip.html'; }

sub run {
    my ($self, ) = @_;

    my $url = $self->url;
    my $content = $self->get($url);
    my @result;
    while ($content =~ m!<td>\s*<div class="TableText">(.*?)</div>\s*</td>\s+<td>\s*<div class="TableText">(.*?)</div>\s*</td>!sg) {
        my $subnet = jcode($1.$2)->tr('бе', '.')->euc; # XXX
        push @result, $subnet;
    }
    return \@result;
}

1;
