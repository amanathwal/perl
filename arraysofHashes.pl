use strict;
use warnings;

use Data::Dumper;

$|=1; # this turns off output buffering

sub main {
    my %hash1 = (
        "cat" => "meat",
        "dogs" => "milk",
        "fish" => "worms"
    );
    
    my @test;

    # this generates a single array of all the keys plus values
    #push(@test, %hash1);
    #print Dumper(@test);

    push(@test, \%hash1);
    print Dumper(@test);

    #get values of the hash
    print $test[0]{"fish"}."\n";
}

main();