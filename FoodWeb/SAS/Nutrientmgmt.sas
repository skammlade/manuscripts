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
*SAS lab email notes help;
proc mixed data=Nutrient method=type3;
class clone mgmt site;
model logFe=clone|mgmt;
random site(mgmt)|clone*site(mgmt)/solution;
estimate 'F-S' | site(mgmt) 1 -1 0 0;
estimate 'F-N' | site(mgmt) 1 0 -1 0;
estimate 'F-R' | site(mgmt) 1 0 0 -1;
estimate 'S-N' | site(mgmt) 0 1 -1 0;
estimate 'S-R' | site(mgmt) 0 1 0 -1;
estimate 'N-R' | site(mgmt) 0 0 1 -1;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
*SAS lab email notes help;
proc mixed data=Nutrient method=type3;
class clone mgmt site;
model logfe=clone|mgmt;
random site(mgmt)|clone*site(mgmt)/solution;
estimate 'F-N' | site(mgmt) 1 -1 0 0;
estimate 'F-R' | site(mgmt) 1 0 -1 0;
estimate 'F-S' | site(mgmt) 1 0 0 -1;
estimate 'N-R' | site(mgmt) 0 1 -1 0;
estimate 'N-S' | site(mgmt) 0 1 0 -1;
estimate 'R-S' | site(mgmt) 0 0 1 -1;
run;





proc mixed data=Nutrient method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logFe=clone|mgmt /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    *slice site*clone /sliceby=clone;
    **slice site*clone /sliceby=site pdiff adjust=tukey;
    **lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;

proc mixed data=Nutrient method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logFe=clone|site /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans site /pdiff adjust=tukey;
    lsmeans clone*site;
    *slice site*clone /sliceby=clone;
    **slice site*clone /sliceby=site pdiff adjust=tukey;
    **lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;








proc boxplot data=Nutrient;
plot Zn*site;
run;

proc sort data=Nutrient out=sortnutrient;
by clone; 
run;
proc boxplot data=sortnutrient;

plot Zn*clone;
run;

*Tests of normality on untransformed Fe data;
proc univariate data=Nutrient normal;
var Zn;
histogram Zn;
qqplot Zn;
run;

*Log transform Fe;
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

*SAS lab email notes help;
proc mixed data=Nutrient method=type3;
class clone mgmt site;
model logZn=clone|mgmt;
random site(mgmt)|clone*site(mgmt)/solution;
estimate 'F-N' | site(mgmt) 1 -1 0 0;
estimate 'F-R' | site(mgmt) 1 0 -1 0;
estimate 'F-S' | site(mgmt) 1 0 0 -1;
estimate 'N-R' | site(mgmt) 0 1 -1 0;
estimate 'N-S' | site(mgmt) 0 1 0 -1;
estimate 'R-S' | site(mgmt) 0 0 1 -1;
lsmeans clone /pdiff adjust=tukey;
 	lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;


proc mixed data=Nutrient method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logZn=clone|mgmt /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    *slice site*clone /sliceby=clone;
    **slice site*clone /sliceby=site pdiff adjust=tukey;
    **lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;

proc mixed data=Nutrient method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logZn=clone|site /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans site /pdiff adjust=tukey;
    lsmeans clone*site;
    *slice site*clone /sliceby=clone;
    **slice site*clone /sliceby=site pdiff adjust=tukey;
    **lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;







proc boxplot data=Nutrient;
plot K*site;
run;

proc sort data=Nutrient out=sortnutrient;
by clone; 
run;
proc boxplot data=sortnutrient;

plot K*clone;
run;

*Tests of normality on untransformed Fe data;
proc univariate data=Nutrient normal;
var K;
histogram K;
qqplot K;
run;

*Log transform Fe;
data Nutrient;
set Nutrient;
logK=log(K);
run;

*Tests of normality on transformed Fe data;
proc univariate data=Nutrient normal;
var logK;
histogram logK;
qqplot logK;
run;
*SAS lab email notes help;
proc mixed data=Nutrient method=type3;
class clone mgmt site;
model logK=clone|mgmt;
random site(mgmt)|clone*site(mgmt)/solution;
estimate 'F-S' | site(mgmt) 1 -1 0 0;
estimate 'F-N' | site(mgmt) 1 0 -1 0;
estimate 'F-R' | site(mgmt) 1 0 0 -1;
estimate 'S-N' | site(mgmt) 0 1 -1 0;
estimate 'S-R' | site(mgmt) 0 1 0 -1;
estimate 'N-R' | site(mgmt) 0 0 1 -1;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;

proc mixed data=Nutrient method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logK=clone|mgmt /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    *slice site*clone /sliceby=clone;
    **slice site*clone /sliceby=site pdiff adjust=tukey;
    **lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;

proc mixed data=Nutrient method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logK=clone|site /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans site /pdiff adjust=tukey;
    lsmeans clone*site;
    *slice site*clone /sliceby=clone;
    **slice site*clone /sliceby=site pdiff adjust=tukey;
    **lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;


