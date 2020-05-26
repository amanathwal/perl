use strict;
use warnings;


use Data::Dumper;

my $SendMail = {
  'Signoff Item' => {
    'overdue' => {
      'SCS-11042' => {
        'Cc' => 'amanpreet_singh3@apple.com',
        'PARENT_KEY' => 'SCS-10115',
        'To' => 'amanpreet_singh3@apple.com',
        'data' => {
          'date' => '2020-05-18',
          'date_type' => 'Signoff Item',
          'dear_person_OD' => 'amanpreet_singh3',
          'dear_person_name' => 'Aman Singh',
          'function' => 'CoreOS => Core Platform',
          'specname' => 'Ellis_ACC_Debug',
          'template' => 'signoff_overdue',
          'url' => 'https://cdb-dev.csg.apple.com/spec-review/AllSpecs?scsDataFilter={"specId":"SCS-10115", "projects":[{"label": "Staten","value":"Staten-A0"}]}',
          'url_words' => 'SCS Server'
        }
      },
      'SCS-11043' => {
        'Cc' => 'amanpreet_singh3@apple.com',
        'PARENT_KEY' => 'SCS-10155',
        'To' => 'amanpreet_singh3@apple.com',
        'data' => {
          'date' => '2020-05-18',
          'date_type' => 'Signoff Item',
          'dear_person_OD' => 'amanpreet_singh3',
          'dear_person_name' => 'Aman Singh',
          'function' => 'CoreOS => Core Platform',
          'specname' => 'Ellis_adsApAns',
          'template' => 'signoff_overdue',
          'url' => 'https://cdb-dev.csg.apple.com/spec-review/AllSpecs?scsDataFilter={"specId":"SCS-10155", "projects":[{"label": "Staten","value":"Staten-A0"}]}',
          'url_words' => 'SCS Server'
        }
      },
      'SCS-11045' => {
        'Cc' => 'shabeer@apple.com',
        'PARENT_KEY' => 'SCS-10155',
        'To' => 'shabeer@apple.com',
        'data' => {
          'date' => '2020-05-18',
          'date_type' => 'Signoff Item',
          'dear_person_OD' => 'amanpreet_singh3',
          'dear_person_name' => 'Aman Singh',
          'function' => 'CoreOS => Core Platform',
          'specname' => 'Ellis_adsApAns',
          'template' => 'signoff_overdue',
          'url' => 'https://cdb-dev.csg.apple.com/spec-review/AllSpecs?scsDataFilter={"specId":"SCS-10155", "projects":[{"label": "Staten","value":"Staten-A0"}]}',
          'url_words' => 'SCS Server'
        }
      },
      'SCS-11046' => {
        'Cc' => 'amanpreet_singh3@apple.com',
        'PARENT_KEY' => 'SCS-10155',
        'To' => 'shabeer@apple.com',
        'data' => {
          'date' => '2020-05-18',
          'date_type' => 'Signoff Item',
          'dear_person_OD' => 'amanpreet_singh3',
          'dear_person_name' => 'Aman Singh',
          'function' => 'CoreOS => Core Platform',
          'specname' => 'Ellis_adsApAns',
          'template' => 'signoff_overdue',
          'url' => 'https://cdb-dev.csg.apple.com/spec-review/AllSpecs?scsDataFilter={"specId":"SCS-10155", "projects":[{"label": "Staten","value":"Staten-A0"}]}',
          'url_words' => 'SCS Server'
        }
      }
    }
  }
};  

my %tempHash;

foreach my $area (sort keys %{$SendMail}) {
   if ($area eq 'Signoff Item') {
       foreach my $type (keys %{ $SendMail->{'Signoff Item'}}) {

         if ($type eq 'overdue') {
             foreach my $keystring (keys %{$SendMail->{$area}{$type}}) {

                if ($tempHash{$SendMail->{$area}{$type}{$keystring}{To}}) {

                     while (my ($key,$value) = each %{$tempHash{$SendMail->{$area}{$type}{$keystring}{To}}}) {
                          if ($key eq 'specs_overdue') {
                            push @{$value}, {
                              'PARENT_KEY' => $SendMail->{$area}{$type}{$keystring}{PARENT_KEY},
                              'SIGNOFF_ID' => $keystring,
                              'function' => $SendMail->{$area}{$type}{$keystring}{data}{function},
                              'specname' => $SendMail->{$area}{$type}{$keystring}{data}{specname},
                              'date' => $SendMail->{$area}{$type}{$keystring}{data}{date},
                              'url_words' => $SendMail->{$area}{$type}{$keystring}{data}{url_words},
                              'url' => $SendMail->{$area}{$type}{$keystring}{data}{url}}
                          }
                    }
                } else {
                

                    $tempHash{$SendMail->{$area}{$type}{$keystring}{To}} = {
                      'To' => $SendMail->{$area}{$type}{$keystring}{To},
                      'Cc' => $SendMail->{$area}{$type}{$keystring}{Cc},
                      'date_type' => $SendMail->{$area}{$type}{$keystring}{data}{date_type},
                      'template' => $SendMail->{$area}{$type}{$keystring}{data}{template},
                      'dear_person_name' => $SendMail->{$area}{$type}{$keystring}{data}{dear_person_name},
                      'dear_person_OD' => $SendMail->{$area}{$type}{$keystring}{data}{dear_person_OD},
                      'specs_overdue' => [{
                        'PARENT_KEY' => $SendMail->{$area}{$type}{$keystring}{PARENT_KEY},
                        'SIGNOFF_ID' => $keystring,
                        'function' => CleanMailChars($SendMail->{$area}{$type}{$keystring}{data}{function}),
                        'specname' => CleanMailChars($SendMail->{$area}{$type}{$keystring}{data}{specname}),
                        'date' => $SendMail->{$area}{$type}{$keystring}{data}{date},
                        'url_words' => $SendMail->{$area}{$type}{$keystring}{data}{url_words},
                        'url' => $SendMail->{$area}{$type}{$keystring}{data}{url},
                      }]
                    };
                }

            }
         }
       }
   }
}


if (%tempHash) {
  $SendMail->{'Signoff Item'}{overdue} = \%tempHash;
}

my $OVERALL_EPM_EMAIL   = 'nmaniar@apple.com';
my $CC_EPM_EMAILS       = 'nmaniar@apple.com';
my $DEVELOPER_EMAIL     = 'shabeer@apple.com, amanpreet_singh3@apple.com';
my $MAIL_TEMPLATES_ROOT = "/org/seg/tools/eda/apple/cdb_server";

foreach my $area (sort keys %{ $SendMail }) {
        print "Area | $area\n";
        foreach my $type (sort keys %{ $SendMail->{$area} }) {
            print "Type | $type\n";
            foreach my $keystring (sort keys %{ $SendMail->{$area}{$type} }) {
                print "Key  | $keystring\n";

                      my $to  = $SendMail->{$area}{$type}{$keystring}{To};
                      my $cc  = $SendMail->{$area}{$type}{$keystring}{Cc};

                
                            #if ($G{DEBUG}) {DumpIt("branch part of SendMail for $keystring",$SendMail->{$area}{$type}{$keystring})}
                      my $dear_person_name;
                      my $dear_person_OD;

                      if ($type eq 'overdue') {
                          $dear_person_name = $SendMail->{$area}{$type}{$keystring}{dear_person_name};
                          $dear_person_OD   = $SendMail->{$area}{$type}{$keystring}{dear_person_OD};  
                      } else {
                         $dear_person_name = $SendMail->{$area}{$type}{$keystring}{data}{dear_person_name};
                         $dear_person_OD   = $SendMail->{$area}{$type}{$keystring}{data}{dear_person_OD};
                      }
      

                #$to="$OVERALL_EPM_EMAIL"; # hack
                #$cc="$CC_EPM_EMAILS,$DEVELOPER_EMAIL";    # hack

                my $cc_add = "$OVERALL_EPM_EMAIL,$CC_EPM_EMAILS,$DEVELOPER_EMAIL";
                if ($cc eq "") {$cc  =   $cc_add}
                else           {$cc .= ",$cc_add"}

                my $data = {
                    "template" => [ $MAIL_TEMPLATES_ROOT, "mail_templates", $SendMail->{$area}{$type}{$keystring}{data}{template} ],
                    "message" => {
                        "from"=>   "SEG SCS <$OVERALL_EPM_EMAIL>",
                        "to"  =>   $to,
                        "cc"  =>   $cc,
                    },
                };

               if ($type eq 'overdue') {
                if ($SendMail->{$area}{$type}{$keystring}{specs_overdue})          {$data->{locals}{specs_overdue}   =$SendMail->{$area}{$type}{$keystring}{specs_overdue}}
                if ($dear_person_name)                                             {$data->{locals}{dear_person_name}= $dear_person_name}
                if ($SendMail->{$area}{$type}{$keystring}{data}{date_type})        {$data->{locals}{date_type}       =$SendMail->{$area}{$type}{$keystring}{date_type}}

               } else {
                if ($SendMail->{$area}{$type}{$keystring}{data}{url})              {$data->{locals}{url}             =$SendMail->{$area}{$type}{$keystring}{data}{url}}
                if ($SendMail->{$area}{$type}{$keystring}{data}{url_words})        {$data->{locals}{url_words}       =$SendMail->{$area}{$type}{$keystring}{data}{url_words}}
                if ($SendMail->{$area}{$type}{$keystring}{data}{dear_person_name}) {$data->{locals}{dear_person_name}=$SendMail->{$area}{$type}{$keystring}{data}{dear_person_name}}
                if ($SendMail->{$area}{$type}{$keystring}{data}{project})          {$data->{locals}{project}         =$SendMail->{$area}{$type}{$keystring}{data}{project}}
                if ($SendMail->{$area}{$type}{$keystring}{data}{date})             {$data->{locals}{date}            =$SendMail->{$area}{$type}{$keystring}{data}{date}}
                if ($SendMail->{$area}{$type}{$keystring}{data}{date_type})        {$data->{locals}{date_type}       =$SendMail->{$area}{$type}{$keystring}{data}{date_type}}
                if ($SendMail->{$area}{$type}{$keystring}{data}{specname})         {$data->{locals}{specname}        =$SendMail->{$area}{$type}{$keystring}{data}{specname};
                                                                                    $data->{locals}{specname_clean}  =CleanMailChars($SendMail->{$area}{$type}{$keystring}{data}{specname})}
                if ($SendMail->{$area}{$type}{$keystring}{data}{function})         {$data->{locals}{function}        =$SendMail->{$area}{$type}{$keystring}{data}{function};
                                                                                    $data->{locals}{function_clean}  =CleanMailChars($SendMail->{$area}{$type}{$keystring}{data}{function})}
               }

                DumpIt("data",$data);
                print "FInal Data";
                <STDIN>;

            }
        }
      }


