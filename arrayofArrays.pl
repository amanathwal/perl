use strict;
use warnings;

use Data::Dumper;

$|=1; # this turns off output buffering

my @animals = ('dog', 'cat', 'rabbit');
my @birds = ('parrot', 'sparrow');

my @values;

push @values, \@animals;  # this \ is a required, it means using the reference, scalar values otherwise it flattens out the array
push @values, \@birds;

#print $values[0][0]; #to access values
print Dumper(@values); 

# now if you have a reference to an array and you wanna access it 
foreach my $item(@values) {
    #print Dumper($item);
    print $item->[0]."\n";  # first dereference the array
}