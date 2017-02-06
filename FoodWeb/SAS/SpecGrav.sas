FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_harvestmgmt.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=Harvest DBMS=CSV REPLACE;
RUN;

Proc print data=Harvest;
run;

proc boxplot data=Harvest;
    plot specgrav*mgmt;
run;

proc sort data=Harvest out=sortHarvest;
    by clone;
run;

proc boxplot data=sortHarvest;
    plot specgrav*clone;
run;

proc sort data=Harvest out=sortHarvest;
    by site;
run;

proc boxplot data=sortHarvest;
    plot specgrav*site;
run;

*Tests of normality on untransformed SpecGrav data;

proc univariate data=Harvest normal;
    var specgrav;
    histogram specgrav;
    qqplot specgrav;
run;

*Log transform SpecGrav;

data Harvest;
    set Harvest;
    logspecgrav=log(specgrav);
run;

*Tests of normality on transformed SpecGrav data;

proc univariate data=Harvest normal;
    var logspecgrav;
    histogram logspecgrav;
    qqplot logspecgrav;
run;
*Calculate simple means for plotting;

Proc Means data=Harvest nway;
class clone site;
var specgrav;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = specgrav / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Harvest method=type3;
class site clone;
model logspecgrav = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;

Proc Means data=Harvest nway;
class clone site;
var HolHrt;
output out=SumStats mean= ;
run;


