FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_yield.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=Yield DBMS=CSV REPLACE;
RUN;

Proc print data=Yield;
run;

proc boxplot data=Yield;
    plot total*site;
run;

proc sort data=Yield out=sortYield;
    by clone;
run;

proc boxplot data=sortYield;
    plot total*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=Yield normal;
    var total;
    histogram total;
    qqplot total;
run;

*Log transform total;

data Yield;
    set Yield;
    logtotal=log(total);
run;

*Tests of normality on transformed total data;

proc univariate data=Yield normal;
    var logtotal;
    histogram logtotal;
    qqplot logtotal;
run;

*Two-way ANOVA Fe;

proc mixed data=Yield method=type3;
    *by var after using proc transpose;
    Class Clone Site;
    model logtotal=clone|site /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans site /pdiff adjust=tukey;
    lsmeans clone*site;
    *slice site*clone /sliceby=clone;
    slice site*clone /sliceby=site pdiff adjust=tukey;
    lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;

proc boxplot data=Yield;
    plot <4oz*site;
run;

proc sort data=Yield out=sortYield;
    by clone;
run;

proc boxplot data=sortYield;
    plot total*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=Yield normal;
    var total;
    histogram total;
    qqplot total;
run;

*Log transform total;

data Yield;
    set Yield;
    logtotal=log(total);
run;

*Tests of normality on transformed total data;

proc univariate data=Yield normal;
    var logtotal;
    histogram logtotal;
    qqplot logtotal;
run;

*Two-way ANOVA Fe;

proc mixed data=Yield method=type3;
    *by var after using proc transpose;
    Class Clone Site;
    model logtotal=clone|site /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans site /pdiff adjust=tukey;
    lsmeans clone*site;
    *slice site*clone /sliceby=clone;
    slice site*clone /sliceby=site pdiff adjust=tukey;
    lsmestimate clone*site "Clone1: Conv v Org" 0.5 -0.5 -0.5 0.5 0;
    *lsmestimate "Clone2: Conv vs Org" clone*site 0 0 0 0 0
												0.5 -0.5 -0.5 0.5 0;
    ods output lsmeans=lsmeans;
run;