package Net::CIDR::MobileJP::Scraper;
use strict;
use warnings;
use UNIVERSAL::require;
use WWW::MobileCarrierJP::DoCoMo::CIDR;

my $short_name_for = +{
    DoCoMo     => 'I',
    EZWeb      => 'E',
    AirHPhone  => 'H',
    ThirdForce => 'V',
};

sub new { bless {}, shift }

sub run {
    my ($self, ) = @_;

    my $result;
    for my $carrier (qw/DoCoMo EZWeb AirHPhone ThirdForce/) {
        my $class = "WWW::MobileCarrierJP::${carrier}::CIDR";
        $class->use or die $@;
        my $dat = $class->scrape;
        $result->{$short_name_for->{$carrier}} = [map { "$_->{ip}$_->{subnetmask}" } @$dat];
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

