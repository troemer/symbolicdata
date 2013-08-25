##################################
#
# author: graebe
# createdAt: 2013-08-24
# lastModified: 2013-08-25

# purpose: load data into the local Virtuoso store
# usage: perl loaddata.pl | isql-vt 1111 dba <YourSecretPassword>

# The environment variable SD should point to the root dir of the symbolicdata
# repo clone. Note that isql-vt does not follow symlinks, hence set 
#   export SD=/local/home/symbolicdata/... 
# on symbolicdata.org 

die "Environment variable SD not set" unless $ENV{'SD'};

my $RDFData="$ENV{'SD'}/data/RDFData";
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

__END__


Some more useful vsql commands:

Clear Data from a given graph:
sparql clear graph <http://symbolicdata.org/Data/Bibliography/> ; 
sparql clear graph <http://symbolicdata.org/Data/FanoPolytopes/> ; 
sparql clear graph <http://symbolicdata.org/Data/FreeAlgebras/> ; 
sparql clear graph <http://symbolicdata.org/Data/GAlgebras/> ; 
sparql clear graph <http://symbolicdata.org/Data/GeometryProblems/> ; 
sparql clear graph <http://symbolicdata.org/Data/People/> ; 
sparql clear graph <http://symbolicdata.org/Data/PolynomialSystems/> ; 
sparql clear graph <http://symbolicdata.org/Data/Systems/> ; 
sparql clear graph <http://symbolicdata.org/Data/TestSets/> ; 

Graphs are not created automatically. If you have problems to display content
in Ontowiki, such a command may help to resolve the trouble

sparql create silent graph <http://symbolicdata.org/Data/Bibliography/> ; 
sparql create silent graph <http://symbolicdata.org/Data/FanoPolytopes/> ; 
sparql create silent graph <http://symbolicdata.org/Data/FreeAlgebras/> ; 
sparql create silent graph <http://symbolicdata.org/Data/GAlgebras/> ; 
sparql create silent graph <http://symbolicdata.org/Data/GeometryProblems/> ; 
sparql create silent graph <http://symbolicdata.org/Data/People/> ; 
sparql create silent graph <http://symbolicdata.org/Data/PolynomialSystems/> ; 
sparql create silent graph <http://symbolicdata.org/Data/Systems/> ; 
sparql create silent graph <http://symbolicdata.org/Data/TestSets/> ; 

