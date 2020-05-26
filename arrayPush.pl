use strict;
use warnings;


$|=1; # this turns off output buffering

my @lines;

push(@lines, 'This is first item');
push(@lines, 'This is second item');

foreach my $line(@lines) {
    print("$line\n");
}
