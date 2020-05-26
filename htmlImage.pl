use strict;
use warnings;

use LWP::Simple;

sub main {
    print "Downloading... \n";

    # print get('https://www.shutterfly.com');

    my $code = getstore("https://www.yahoo.com/", "shutterfly.html");

    if ($code == 200) {
        print "Success \n";
    } else {
        print "Fail";
    }
}

main();