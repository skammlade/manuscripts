FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_nutrientmgmt.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV
		    OUT=Nutrient
		    DBMS=CSV
		    REPLACE;
RUN;

Proc print data=Nutrient;
run;

proc boxplot data=Nutrient;
plot Fe*site;
run;

proc sort data=Nutrient out=sortnutrient;
by clone; 
run;
proc boxplot data=sortnutrient;

plot Fe*clone;
run;

*Tests of normality on untransformed Fe data;
proc univariate data=Nutrient normal;
var Fe;
histogram Fe;
qqplot Fe;
run;

*Log transform Fe;
data Nutrient;
set Nutrient;
logFe=log(Fe);
run;

*Tests of normality on transformed Fe data;
proc univariate data=Nutrient normal;
var logFe;
histogram logFe;
qqplot logFe;
run;

*Calculate simple means for plotting;

Proc Means data=nutrient nway;
class clone site;
var Fe;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = Fe / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=nutrient method=type3;
class site clone;
model logFe = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;






*Tests of normality on untransformed Zn data;
proc univariate data=Nutrient normal;
var Zn;
histogram Zn;
qqplot Zn;
run;

*Log transform Zn;
data Nutrient;
set Nutrient;
logZn=log(Zn);
run;

*Tests of normality on transformed Fe data;
proc univariate data=Nutrient normal;
var logZn;
histogram logZn;
qqplot logZn;
run;

*Calculate simple means for plotting;

Proc Means data=nutrient nway;
class clone site;
var Zn;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = Zn / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=nutrient method=type3;
class site clone;
model logZn = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;





*Tests of normality on untransformed K data;
proc univariate data=Nutrient normal;
var K;
histogram K;
qqplot K;
run;

*Log transform K;
data Nutrient;
set Nutrient;
logK=log(K);
run;

*Tests of normality on transformed K data;
proc univariate data=Nutrient normal;
var logK;
histogram logK;
qqplot logK;
run;

*Calculate simple means for plotting;

Proc Means data=nutrient nway;
class clone site;
var K;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = K / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=nutrient method=type3;
class site clone;
model logK = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;