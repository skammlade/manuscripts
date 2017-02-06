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

*Tests of normality on untransformed total data;

proc univariate data=Harvest normal;
    var specgrav;
    histogram specgrav;
    qqplot specgrav;
run;

*Log transform total;

data Harvest;
    set Harvest;
    logspecgrav=log(specgrav);
run;

*Tests of normality on transformed total data;

proc univariate data=Harvest normal;
    var logspecgrav;
    histogram logspecgrav;
    qqplot logspecgrav;
run;
*SAS lab email notes help;
proc mixed data=Harvest method=type3;
class clone mgmt site;
model logspecgrav=clone|mgmt;
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
*Two-way ANOVA totAL;

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logspecgrav=clone|mgmt /residual;
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

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logspecgrav=clone|site /residual;
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



proc boxplot data=Harvest;
    plot holhrt*mgmt;
run;

proc sort data=Harvest out=sortHarvest;
    by clone;
run;

proc boxplot data=sortHarvest;
    plot holhrt*clone;
run;
proc sort data=Harvest out=sortHarvest;
    by site;
run;

proc boxplot data=sortHarvest;
    plot holhrt*site;
run;

*Tests of normality on untransformed total data;

proc univariate data=Harvest normal;
    var holhrt;
    histogram holhrt;
    qqplot holhrt;
run;

*Log transform total;

data Harvest;
    set Harvest;
    logholhrt=log(holhrt+.001);
run;

*Tests of normality on transformed total data;

proc univariate data=Harvest normal;
    var logholhrt;
    histogram logholhrt;
    qqplot logholhrt;
run;
*SAS lab email notes help;
proc mixed data=Harvest method=type3;
class clone mgmt site;
model logholhrt=clone|mgmt;
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
*Two-way ANOVA totAL;

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logholhrt=clone|mgmt /residual;
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

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logholhrt=clone|site /residual;
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






proc boxplot data=Harvest;
    plot brncen*mgmt;
run;

proc sort data=Harvest out=sortHarvest;
    by clone;
run;

proc boxplot data=sortHarvest;
    plot brncen*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=Harvest normal;
    var brncen;
    histogram brncen;
    qqplot brncen;
run;

*Log transform total;

data Harvest;
    set Harvest;
    logbrncen=log(brncen+.01);
run;

*Tests of normality on transformed total data;

proc univariate data=Harvest normal;
    var logbrncen;
    histogram logbrncen;
    qqplot logbrncen;
run;
*SAS lab email notes help;
proc mixed data=Harvest method=type3;
class clone mgmt site;
model logbrncen=clone|mgmt;
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
*Two-way ANOVA totAL;

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logbrncen=clone|mgmt /residual;
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







proc boxplot data=Harvest;
    plot grcrk*mgmt;
run;

proc sort data=Harvest out=sortHarvest;
    by clone;
run;

proc boxplot data=sortHarvest;
    plot grcrk*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=Harvest normal;
    var grcrk;
    histogram grcrk;
    qqplot grcrk;
run;

*Log transform total;

data Harvest;
    set Harvest;
    loggrcrk=log(grcrk+.001);
run;

*Tests of normality on transformed total data;

proc univariate data=Harvest normal;
    var loggrcrk;
    histogram loggrcrk;
    qqplot loggrcrk;
run;
*SAS lab email notes help;
proc mixed data=Harvest method=type3;
class clone mgmt site;
model loggrcrk=clone|mgmt;
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
*Two-way ANOVA totAL;

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model loggrcrk=clone|mgmt /residual;
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

proc mixed data=Harvest method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model loggrcrk=clone|site /residual;
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





proc boxplot data=Harvest;
    plot knobs*mgmt;
run;

proc sort data=Harvest out=sortHarvest;
    by clone;
run;

proc boxplot data=sortHarvest;
    plot knobs*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=Harvest normal;
    var knobs;
    histogram knobs;
    qqplot knobs;
run;

*Log transform total;

data Harvest;
    set Harvest;
    logknobs=log(knobs+.01);
run;

*Tests of normality on transformed total data;

proc univariate data=Harvest normal;
    var logknobs;
    histogram logknobs;
    qqplot logknobs;
run;
*SAS lab email notes help;
proc mixed data=Harvest method=type3;
class clone mgmt site;
model logknobs=clone|mgmt;
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
*Two-way ANOVA totAL;





proc boxplot data=Harvest;
    plot Misshapes*mgmt;
run;

proc sort data=Harvest out=sortHarvest;
    by clone;
run;

proc boxplot data=sortHarvest;
    plot Misshapes*clone;
run;

proc sort data=Harvest out=sortHarvest;
    by site;
run;

proc boxplot data=sortHarvest;
    plot Misshapes*site;
run;

*Tests of normality on untransformed total data;

proc univariate data=Harvest normal;
    var Misshapes;
    histogram Misshapes;
    qqplot Misshapes;
run;

*Log transform total;

data Harvest;
    set Harvest;
    logMisshapes=log(Misshapes+.001);
run;

*Tests of normality on transformed total data;

proc univariate data=Harvest normal;
    var logMisshapes;
    histogram logMisshapes;
    qqplot logMisshapes;
run;
*SAS lab email notes help;
proc mixed data=Harvest method=type3;
class clone mgmt site;
model logMisshapes=clone|mgmt;
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