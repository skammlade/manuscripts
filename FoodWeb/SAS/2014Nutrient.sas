FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_servitechver.csv" TERMSTR=CR;
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

Proc Means data=Nutrient nway;
class clone site;
var Fe;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = Fe / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Nutrient method=type3;
class site clone;
model Fe = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;








*Two-way ANOVA Fe;
proc mixed data=Nutrient method=type3;
*by var after using proc transpose;
Class Clone Site;
model logFe = clone|site /residual;
lsmeans clone /pdiff adjust=tukey;
lsmeans site /pdiff adjust=tukey;
lsmeans clone*site;
*slice site*clone /sliceby=clone;
slice site*clone /sliceby=site pdiff adjust=tukey;
lsmestimate  clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
*lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
ods output lsmeans=lsmeans;
run;

*Plot site vs tuber Fe concentration;
title "Site vs Tuber Fe Concentration";
proc gplot data=lsmeans;
plot estimate*site=clone;
symbol1 value=dot color=red i=join l=1;
symbol2 value=dot color=blue i=join l=2;
symbol3 value=dot color=green i=join l=3;
symbol4 value=dot color=black i=join l=4;
symbol5 value=dot color=orange i=join l=5;
run;

*Plot clone vs tuber Fe concentration;
title "Clone vs Tuber Fe Concentration";
proc gplot data=lsmeans;
plot estimate*clone=site;
symbol1 value=dot color=red i=join l=1;
symbol2 value=dot color=blue i=join l=2;
symbol3 value=dot color=green i=join l=3;
symbol4 value=dot color=black i=join l=4;
symbol5 value=dot color=orange i=join l=5;
run;


*K data;
proc boxplot data=Nutrient;
plot K*site;
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

*Log transform K;
data Nutrient;
set Nutrient;
sqrtK=sqrt(K+1);
run;

*Tests of normality on transformed K data;
proc univariate data=Nutrient normal;
var sqrtK;
histogram sqrtK;
qqplot sqrtK;
run;




*Two-way ANOVA K;
proc mixed data=Nutrient method=type3;
Class Clone Site;
model logK = clone|site /residual;
lsmeans clone*site /pdiff;
slice site*clone /sliceby=clone;
slice site*clone /sliceby=site;
ods output lsmeans=lsmeans;
run;

*Plot site vs tuber K concentration;
title "Site vs Tuber K Concentration";
proc gplot data=lsmeans;
plot estimate*site=clone;
symbol1 value=dot color=red i=join l=1;
symbol2 value=dot color=blue i=join l=2;
symbol3 value=dot color=green i=join l=3;
symbol4 value=dot color=black i=join l=4;
symbol5 value=dot color=orange i=join l=5;
run;

*Plot clone vs tuber K concentration;
title "Clone vs Tuber K Concentration";
proc gplot data=lsmeans;
plot estimate*clone=site;
symbol1 value=dot color=red i=join l=1;
symbol2 value=dot color=blue i=join l=2;
symbol3 value=dot color=green i=join l=3;
symbol4 value=dot color=black i=join l=4;
symbol5 value=dot color=orange i=join l=5;
run;




*Plot site vs tuber Zn concentration;
title "Site vs Tuber Zn Concentration";
proc gplot data=lsmeans;
plot estimate*site=clone;
symbol i=join;
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

*Tests of normality on transformed Zn data;
proc univariate data=Nutrient normal;
var logZn;
histogram logZn;
qqplot logZn;
run;

*Two-way ANOVA Zn;
proc mixed data=Nutrient method=type3;
Class Clone Site;
model logZn = clone|site /residual;
lsmeans clone*site /pdiff;
slice site*clone /sliceby=clone;
slice site*clone /sliceby=site;
ods output lsmeans=lsmeans;
run;

*Plot site vs tuber Zn concentration;
title "Site vs Tuber Zn Concentration";
proc gplot data=lsmeans;
plot estimate*site=clone;
symbol1 value=dot color=red i=join l=1;
symbol2 value=dot color=blue i=join l=2;
symbol3 value=dot color=green i=join l=3;
symbol4 value=dot color=black i=join l=4;
symbol5 value=dot color=orange i=join l=5;
run;

*Plot clone vs tuber Zn concentration;
title "Clone vs Tuber Zn Concentration";
proc gplot data=lsmeans;
plot estimate*clone=site;
symbol1 value=dot color=red i=join l=1;
symbol2 value=dot color=blue i=join l=2;
symbol3 value=dot color=green i=join l=3;
symbol4 value=dot color=black i=join l=4;
symbol5 value=dot color=orange i=join l=5;
run;

*ZN data;
proc boxplot data=Nutrient;
plot Zn*site;
run;