use strict;
use warnings;
use lib qw(lib);
use inc::Module::Install;
use File::Spec;

sub GenYAML {
    eval "require YAML";
    if ($@) {
        print "YAML.pm not found. please run net-cidr-mobilejp-scraper.pl manualy\n";
        return;
    }

    open(my $fh, '>', File::Spec->catfile('share', 'cidr.yaml')) or die "can't open file";
    require Net::CIDR::MobileJP::Scraper;
    print $fh YAML::Dump(Net::CIDR::MobileJP::Scraper->new->run);
    close($fh);
}

name            'Net-CIDR-MobileJP';
all_from        'lib/Net/CIDR/MobileJP.pm';

requires 'HTTP::MobileAgent'    => 0;
requires 'Net::CIDR::Lite'      => 0;
requires 'YAML'                 => 0;
requires 'version'              => 0;
requires 'File::ShareDir'       => 0;

build_requires 'WWW::MobileCarrierJP' => 0.11;

install_share;

my $cwd = Cwd::cwd;
auto_install_now;
chdir $cwd;
WriteAll;

GenYAML;

