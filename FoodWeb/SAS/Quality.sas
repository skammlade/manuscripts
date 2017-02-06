FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_harvestmgmt_pct.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=Quality DBMS=CSV REPLACE;
RUN;
proc sort data=Quality out=Qualitysort;
by clone;
run;

proc boxplot data=Quality;
    plot specgrav*mgmt;
run;

proc sort data=Quality out=sortQuality;
    by clone;
run;

proc boxplot data=sortQuality;
    plot specgrav*clone;
run;

proc sort data=Quality out=sortQuality;
    by site;
run;

proc boxplot data=sortQuality;
    plot specgrav*site;
run;

*Tests of normality on untransformed SpecGrav data;

proc univariate data=Quality normal;
    var specgrav;
    histogram specgrav;
    qqplot specgrav;
run;

*Log transform SpecGrav;

data Quality;
    set Quality;
    logspecgrav=log(specgrav);
run;

*Tests of normality on transformed SpecGrav data;

proc univariate data=Quality normal;
    var logspecgrav;
    histogram logspecgrav;
    qqplot logspecgrav;
run;
*Calculate simple means for plotting;

Proc Means data=Quality nway;
class clone site;
var specgrav;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = specgrav / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Quality method=type3;
class site clone;
model logspecgrav = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;



Proc Means data=Quality nway;
class clone site;
var HolHrt;
output out=SumStats mean= ;
run;
Proc Means data=Quality nway;
class clone site;
var BrnCen;
output out=SumStats mean= ;
run;
Proc Means data=Quality nway;
class clone site;
var GrCrk;
output out=SumStats mean= ;
run;
Proc Means data=Quality nway;
class clone site;
var Knobs;
output out=SumStats mean= ;
run;
Proc Means data=Quality nway;
class clone site;
var Misshapes;
output out=SumStats mean= ;
run;



proc npar1way data=Qualitysort wilcoxon;
by clone;
class site;
var HolHrt;
exact wilcoxon;
run;

proc npar1way data=Qualitysort wilcoxon;
by clone;
class site;
var BrnCen;
exact wilcoxon;
run;

proc npar1way data=Qualitysort wilcoxon;
by clone;
class site;
var GrCrk;
exact wilcoxon;
run;

proc npar1way data=Qualitysort wilcoxon;
by clone;
class site;
var Knobs;
exact wilcoxon;
run;

proc npar1way data=Qualitysort wilcoxon;
by clone;
class site;
var Misshapes;
exact wilcoxon;
run;