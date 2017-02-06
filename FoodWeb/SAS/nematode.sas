FILENAME CSV "/home/sara.kammlade/2014ThesisData/nematode.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=nem DBMS=CSV REPLACE;
RUN;

Proc print data=nem;
run;

proc boxplot data=nem;
    plot rat*mgmt;
run;

proc sort data=nem out=sortnem;
    by clone;
run;

proc boxplot data=sortnem;
    plot rat*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=nem normal;
    var rat;
    histogram rat;
    qqplot rat;
run;

*Log transform total;

data nem;
    set nem;
    lograt=log(rat+.05);
run;

*Tests of normality on transformed total data;

proc univariate data=nem normal;
    var lograt;
    histogram lograt;
    qqplot lograt;
run;

*Two-way ANOVA totAL;

proc mixed data=nem method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model lograt=clone|mgmt /residual;
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
proc mixed data=nem method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model lograt=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=nem method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model lograt=clone|site /residual;
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
















proc boxplot data=sortnem;
    plot rootfeed*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=nem normal;
    var rootfeed;
    histogram rootfeed;
    qqplot rootfeed;
run;

*Log transform total;

data nem;
    set nem;
    logrootfeed=log(rootfeed)+1;
run;

*Tests of normality on transformed total data;

proc univariate data=nem normal;
    var logrootfeed;
    histogram logrootfeed;
    qqplot logrootfeed;
run;

*Two-way ANOVA totAL;

proc mixed data=nem method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logrootfeed=clone|mgmt /residual;
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






proc boxplot data=sortnem;
    plot good*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=nem normal;
    var good;
    histogram good;
    qqplot good;
run;

*Log transform total;

data nem;
    set nem;
    loggood=log(good);
run;

*Tests of normality on transformed total data;

proc univariate data=nem normal;
    var loggood;
    histogram loggood;
    qqplot loggood;
run;

*Two-way ANOVA totAL;

proc mixed data=nem method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model loggood=clone|mgmt /residual;
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