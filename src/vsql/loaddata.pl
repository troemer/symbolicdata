##################################
#
# author: graebe
# createdAt: 2013-08-24

# purpose: load data into the local Virtuoso store
# usage: perl loaddata.pl | isql-vt 1111 dba <YourSecretPassword>

# all scripts are relative to this environment variable

my $SD = $ENV{'SD'}; # root dir of the symbolicdata repo clone
die "Environment variable SD not set" unless $SD;

my $RDFData="$SD/data/RDFData";
my $out;
$out.=createLoadCommand("Bibliography","Bibliography.ttl");
$out.=createLoadCommand("Bibliography","BIB-References.ttl");
$out.=createLoadCommand("FanoPolytopes","FanoPolytopes.ttl");
$out.=createLoadCommand("FreeAlgebras","FreeAlgebras.ttl");
$out.=createLoadCommand("GAlgebras","GAlgebras.ttl");
$out.=createLoadCommand("GeometryProblems","GeometryProblems.ttl");
$out.=createLoadCommand("People","People.ttl");
$out.=createLoadCommand("PolynomialSystems","PolynomialSystems.ttl");
$out.=createLoadCommand("Systems","Systems.ttl");
$out.=createLoadCommand("TestSets","TestSets.ttl");
print $out;

sub createLoadCommand {
  my ($graph,$file)=@_;
  return<<EOT;
DB.DBA.TTLP_MT (file_to_string_output('$RDFData/$file'),'http://symbolicdata.org/Data/$graph/'); \
EOT
}
