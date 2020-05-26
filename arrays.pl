use strict;
use warnings;

$|=1; # this turns off output buffering

sub main {
    #my $file = '/Users/amsingh/Documents/git/perl/test.pl';

    # array of files 
    my @files = (
        '/Users/amsingh/Documents/git/perl/test.pl',
        '/Users/amsingh/Documents/git/perl/helloworld1.pl',
        '/Users/amsingh/Documents/git/perl/helloworld.pl',  # this last comma is optional
    );

    foreach my $file(@files) {
        # check if the file exists 
        # double quotes in print will interpret variables vs single quotes
        if (-f $file) {
            print "Found file $file\n";
        } else {
            print "File not found $file\n";
        }
    }

    
}

main();