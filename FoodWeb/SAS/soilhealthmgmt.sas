FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_haney.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=health DBMS=CSV REPLACE;
RUN;

Proc print data=health;
run;

proc boxplot data=health;
    plot solvita*mgmt;
run;

proc sort data=health out=sorthealth;
    by clone;
run;

proc boxplot data=sorthealth;
    plot solvita*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=health normal;
    var solvita;
    histogram solvita;
    qqplot solvita;
run;

*Log transform total;

data health;
    set health;
    logsolvita=log(solvita);
run;

*Tests of normality on transformed total data;

proc univariate data=health normal;
    var logsolvita;
    histogram logsolvita;
    qqplot logsolvita;
run;
*SAS lab email notes help;
proc mixed data=health method=type3;
class clone mgmt site;
model logsolvita=clone|mgmt;
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

proc mixed data=health method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logsolvita=clone|mgmt /residual;
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






proc boxplot data=sorthealth;
    plot orgC*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=health normal;
    var orgC;
    histogram orgC;
    qqplot orgC;
run;

*Log transform total;

data health;
    set health;
    logorgC=log(orgC);
run;

*Tests of normality on transformed total data;

proc univariate data=health normal;
    var logorgC;
    histogram logorgC;
    qqplot logorgC;
run;
*SAS lab email notes help;
proc mixed data=health method=type3;
class clone mgmt site;
model orgC=clone|mgmt;
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

proc mixed data=health method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model orgC=clone|mgmt /residual;
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






proc boxplot data=sorthealth;
    plot orgN*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=health normal;
    var orgN;
    histogram orgN;
    qqplot orgN;
run;

*Log transform total;

data health;
    set health;
    logorgN=log(orgN);
run;

*Tests of normality on transformed total data;

proc univariate data=health normal;
    var logorgN;
    histogram logorgN;
    qqplot logorgN;
run;
*SAS lab email notes help;
proc mixed data=health method=type3;
class clone mgmt site;
model orgN=clone|mgmt;
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

proc mixed data=health method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model orgN=clone|mgmt /residual;
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
