package Net::CIDR::MobileJP::Scraper::Plugin;
use strict;
use warnings;
use UNIVERSAL::require;
use LWP::UserAgent;
use Carp;
use HTTP::MobileAgent;

sub new {
    my ($class, ) = @_;
    bless {}, $class;
}

sub url {
    my ($self, ) = @_;
    croak "this method is abstract : $self";
}

sub run {
    my ($self, ) = @_;

    die "this method is abstract : $self";
}

sub carrier {
    my ($self, ) = @_;

    my $proto = ref $self || $self;
    $proto =~ s/.+:://;
    my $mobileagent = "HTTP::MobileAgent::$proto";
    $mobileagent->use or die $@;
    return $mobileagent->carrier;
}

sub get {
    my ($self, $url) = @_;

    my $ua = LWP::UserAgent->new(timeout => 3);
    my $res = $ua->get($url);
    if ($res->is_success) {
        return $res->content;
    }
    else {
        carp $res->status_line;
    }
}

1;
