package Net::CIDR::MobileJP::Scraper::Plugin::AirHPhone;
use strict;
use warnings;
use base qw/Net::CIDR::MobileJP::Scraper::Plugin/;

sub url { return 'http://www.willcom-inc.com/ja/service/contents_service/club_air_edge/for_phone/ip/'; }

sub run {
    my ($self, ) = @_;

    my $url = $self->url;
    my $content = $self->get($url);
    my @result;
    while ($content =~ m!<font size="2">(\d+\.\d+\.\d+\.\d+/\d+)</font>!g) {
        push @result, $1;
    }
    return \@result;
}

1;
