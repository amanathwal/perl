use strict;
use warnings;

$|=1;

sub main{
     my $file = '/Users/amsingh/Documents/git/perl/readingfile.txt';
     
     # INPUT is file handle  # program stops when it sees die statement
     open(INPUT, $file) or die("INPUT FILE  $file not found. \n");
         
     # returns one line at a time    
     while(my $line = <INPUT>) {
         #print "$line";

         if($line =~ /egg/) { # if the line contains egg
             print $line
         }
     }

     close(INPUT)
}

main();