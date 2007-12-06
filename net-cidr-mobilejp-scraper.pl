#!/usr/bin/perl -w
use strict;
use warnings;
use Getopt::Long;
use UNIVERSAL::require;
use Pod::Usage;
use YAML;

my $module = 'Net::CIDR::MobileJP::Scraper';
GetOptions(
    'module=s'     => \$module,
) or pod2usage(2);
$module->use or die $@;

print YAML::Dump($module->new->run);

__END__

=head1 SYNOPSIS

    $ net-cidr-mobilejp-scraper.pl

    Options:
        --module=Net::CIDR::MobileJP::Scraper::Plugin::EZweb

=head2 DESCRIPTION

scraping script for Net::CIDR::MobileJP.

