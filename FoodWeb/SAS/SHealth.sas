FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_haney1.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=SHealth DBMS=CSV REPLACE;
RUN;

Proc print data=SHealth;
run;

proc boxplot data=SHealth;
    plot solvita*mgmt;
run;

proc sort data=SHealth out=sortSHealth;
    by clone;
run;

proc boxplot data=sortSHealth;
    plot solvita*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=SHealth normal;
    var solvita;
    histogram solvita;
    qqplot solvita;
run;

*Log transform total;

data SHealth;
    set SHealth;
    logsolvita=log(solvita);
run;

*Tests of normality on transformed total data;

proc univariate data=SHealth normal;
    var logsolvita;
    histogram logsolvita;
    qqplot logsolvita;
run;

*Log transform total;

data SHealth;
    set Shealth;
    sqrtsolvita=sqrt(solvita);
run;

*Tests of normality on transformed total data;

proc univariate data=SHealth normal;
    var sqrtsolvita;
    histogram sqrtsolvita;
    qqplot sqrtsolvita;
run;

*Calculate simple means for plotting;

Proc Means data=SHealth nway;
class clone site;
var solvita;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = logsolvita / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=SHealth method=type3;
class site clone;
model logsolvita = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;





*Tests of normality on untransformed total data;

proc univariate data=SHealth normal;
    var orgC;
    histogram orgC;
    qqplot orgC;
run;

*Log transform total;

data SHealth;
    set SHealth;
    logorgC=log(orgC);
run;

*Tests of normality on transformed total data;

proc univariate data=SHealth normal;
    var logorgC;
    histogram logorgC;
    qqplot logorgC;
run;

*Log transform total;

data SHealth;
    set Shealth;
    sqrtsolvita=sqrt(solvita);
run;

*Tests of normality on transformed total data;

proc univariate data=SHealth normal;
    var sqrtsolvita;
    histogram sqrtsolvita;
    qqplot sqrtsolvita;
run;

*Calculate simple means for plotting;

Proc Means data=SHealth nway;
class clone site;
var orgC;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = orgC / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=SHealth method=type3;
class site clone;
model orgC = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;





*Tests of normality on untransformed total data;

proc univariate data=SHealth normal;
    var orgN;
    histogram orgN;
    qqplot orgN;
run;

*Log transform total;

data SHealth;
    set SHealth;
    logorgN=log(orgN);
run;

*Tests of normality on transformed total data;

proc univariate data=SHealth normal;
    var logorgN;
    histogram logorgN;
    qqplot logorgN;
run;



*Calculate simple means for plotting;

Proc Means data=SHealth nway;
class clone site;
var orgN;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = orgN / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=SHealth method=type3;
class site clone;
model orgN = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;



