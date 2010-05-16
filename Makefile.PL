use inc::Module::Install;

name            'Net-CIDR-MobileJP';
all_from        'lib/Net/CIDR/MobileJP.pm';

requires 'Net::CIDR::Lite'      => 0.20;
requires 'YAML'                 => 0;
requires 'File::ShareDir'       => 1.02;
requires 'WWW::MobileCarrierJP' => 0.37;
configure_requires 'File::ShareDir'       => 1.00;

eval {
    print "generating cidr.yaml\n";
    my $x = `$^X net-cidr-mobilejp-scraper.pl`;
    open my $fh, '>', 'share/cidr.yaml' or die $!;
    print $fh $x;
    close $fh;
    print "success: cidr.yaml\n";
};
if ($@) {
    print "failed to generate cidr.yaml: $@\n";
}

# this is just a optional thing.
# build_requires 'WWW::MobileCarrierJP' => '0.23';

install_share;
author_tests('xt');

readme_markdown_from 'lib/Net/CIDR/MobileJP.pm';
auto_set_repository;
WriteAll;

