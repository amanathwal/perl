use strict;
use warnings;

$|=1;

sub main{


     my $output = 'output.txt';

    # > sign means create the file
     open(OUTPUT, '>'.$output) or die("Can't create $output.\n");

     # write to this file, print it to the output file
     print OUTPUT "Hello\n";

     close(OUTPUT);
}

main();

