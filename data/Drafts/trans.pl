undef $/;
open(FH,"a.txt") or die;
$_=<FH>;
s/,/ /gs;
s/</ /gs;
s/>/ /gs;
my $out;
while (m/(\S+@\S+)/gs) {
  $out.=processEmail($1);
}

print $out;

sub processEmail {
  local $_=shift;
  my ($a,$b)=split /@/;
  return <<EOT;
sdp:$a a foaf:Person;
 foaf:name "$a" ; 
 foaf:mbox "$_" .

EOT
}
