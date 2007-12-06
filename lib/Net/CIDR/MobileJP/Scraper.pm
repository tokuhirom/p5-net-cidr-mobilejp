package Net::CIDR::MobileJP::Scraper;
use strict;
use warnings;
use Module::Pluggable::Fast name => 'plugins', search => [qw/Net::CIDR::MobileJP::Scraper::Plugin/];

sub new { bless {}, shift }

sub run {
    my ($self, ) = @_;

    my $result;
    for my $plugin ($self->plugins) {
        $result->{$plugin->carrier} = $plugin->run;
    }
    return $result;
}

1;
__END__

=head1 NAME

Net::CIDR::MobileJP::Scraper - scraping module for mobile ip address in Japan

=head1 SYNOPSIS

    my $data = Net::CIDR::MobileJP::Scraper->new->run;

=head1 DESCRIPTION

scraping module for mobile ip address in Japan.

=head1 AUTHORS

  Tokuhiro Matsuno  C<< <tokuhiro __at__ mobilefactory.jp> >>
  id:spiritloose

=cut

