use strict;
use warnings;

$|=1; # this turns off output buffering

# function
sub main {
  my %months = (
      "Jan" => 1,
      "Feb" => 2,
      "Mar" => 3,
      "Dec" => 12,
      "Jun" => 6,
  );

  print $months{"Jan"} . "\n";


   my %days = (
      1 => "Mon",
      2 => "Tues",
      3 => "Wed",
      4 => "Thurs",
      5 => "Fri",
  );

  print $days{1} . "\n";

   #iterating over a hash
   my @months = keys %months;

   foreach my $month(sort @months) {
       my $value = $months{$month};
       print  "$month: $value" . "\n";
   }


   #using while loop to iterate
   while (my ($key,$value) = each %days) {
       print "$key: $value \n";
   }
}

main();