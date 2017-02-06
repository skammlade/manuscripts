FILENAME CSV "/home/sara.kammlade/beanfiber/gxefiber.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=fiber DBMS=CSV REPLACE;
RUN;

Proc print data=fiber;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model Raff = Origin|Entry / residual;
random Rep(Origin);
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model Stach = Origin | Entry / residual;
random Rep(Origin);
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model Verb = Origin |Entry / residual;
random Rep(Origin) ;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model TOligos = Origin |Entry / residual;
random Rep(Origin) ;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model IDF = Origin |Entry / residual;
random Rep(Origin) ;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model SDF = Origin |Entry / residual;
random Rep(Origin) ;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=fiber method=type3;
class Origin Entry Rep;
model TDF = Origin |Entry / residual;
random Rep(Origin) ;
run;