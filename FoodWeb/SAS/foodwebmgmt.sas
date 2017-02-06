FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_earthfort.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=web DBMS=CSV REPLACE;
RUN;

Proc print data=web;
run;

proc boxplot data=web;
    plot totalbact*mgmt;
run;

proc sort data=web out=sortweb;
    by clone;
run;

proc boxplot data=sortweb;
    plot totalbact*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=web normal;
    var totalbact;
    histogram totalbact;
    qqplot totalbact;
run;

*Log transform total;

data web;
    set web;
    logtotalbact=log(totalbact);
run;

*Tests of normality on transformed total data;

proc univariate data=web normal;
    var logtotalbact;
    histogram logtotalbact;
    qqplot logtotalbact;
run;
*SAS lab email notes help;
proc mixed data=web method=type3;
class clone mgmt site;
model totalbact=clone|mgmt;
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
proc mixed data=web method=type3;
class clone mgmt site;
model totalbact=clone|mgmt;
random site(mgmt)|clone*site(mgmt)/solution;
estimate 'F-S' | site(mgmt) 1 -1 0 0;
estimate 'F-N' | site(mgmt) 1 0 -1 0;
estimate 'F-R' | site(mgmt) 1 0 0 -1;
estimate 'S-N' | site(mgmt) 0 1 -1 0;
estimate 'S-R' | site(mgmt) 0 1 0 -1;
estimate 'N-R' | site(mgmt) 0 0 1 -1;
run;







*Two-way ANOVA totAL;
*sas lab help notes;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model totalbact=clone|mgmt /residual;
    random site(mgmt)|clone*site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
run;



proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model totalbact=clone|mgmt|site(mgmt) /residual;
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
run;




proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model totalbact=clone|mgmt /residual;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model totalbact=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model totalbact=clone|site /residual;
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







proc boxplot data=web;
    plot totalfung*mgmt;
run;

proc sort data=web out=sortweb;
    by clone;
run;

proc boxplot data=sortweb;
    plot totalfung*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=web normal;
    var totalfung;
    histogram totalfung;
    qqplot totalfung;
run;

*Log transform total;

data web;
    set web;
    logtotalfung=log(totalfung);
run;

*Tests of normality on transformed total data;

proc univariate data=web normal;
    var logtotalfung;
    histogram logtotalfung;
    qqplot logtotalfung;
run;
*SAS lab email notes help;
proc mixed data=web method=type3;
class clone mgmt site;
model logtotalfung=clone|mgmt;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logtotalfung=clone|mgmt /residual;
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
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model logtotalfung=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logtotalfung=clone|site /residual;
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















proc boxplot data=web;
    plot Flagellates*mgmt;
run;

proc sort data=web out=sortweb;
    by clone;
run;

proc boxplot data=sortweb;
    plot Flagellates*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=web normal;
    var Flagellates;
    histogram Flagellates;
    qqplot Flagellates;
run;

*Log transform total;

data web;
    set web;
    logFlagellates=log(Flagellates);
run;

*Tests of normality on transformed total data;

proc univariate data=web normal;
    var logFlagellates;
    histogram logFlagellates;
    qqplot logFlagellates;
run;
proc mixed data=web method=type3;
class clone mgmt site;
model logFlagellates=clone|mgmt;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logFlagellates=clone|mgmt /residual;
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
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model logFlagellates=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logFlagellates=clone|site /residual;
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









proc boxplot data=web;
    plot amoeba*mgmt;
run;

proc sort data=web out=sortweb;
    by clone;
run;

proc boxplot data=sortweb;
    plot amoeba*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=web normal;
    var amoeba;
    histogram amoeba;
    qqplot amoeba;
run;

*Log transform total;

data web;
    set web;
    logamoeba=log(amoeba);
run;

*Tests of normality on transformed total data;

proc univariate data=web normal;
    var logamoeba;
    histogram logamoeba;
    qqplot logamoeba;
run;
proc mixed data=web method=type3;
class clone mgmt site;
model logamoeba=clone|mgmt;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logamoeba=clone|mgmt /residual;
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
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model logamoeba=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logamoeba=clone|site /residual;
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














proc boxplot data=web;
    plot ciliates*mgmt;
run;

proc sort data=web out=sortweb;
    by clone;
run;

proc boxplot data=sortweb;
    plot ciliates*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=web normal;
    var ciliates;
    histogram ciliates;
    qqplot ciliates;
run;

*Log transform total;

data web;
    set web;
    logciliates=log(ciliates+3);
run;

*Tests of normality on transformed total data;

proc univariate data=web normal;
    var logciliates;
    histogram logciliates;
    qqplot logciliates;
run;
proc mixed data=web method=type3;
class clone mgmt site;
model logciliates=clone|mgmt;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model logciliates=clone|mgmt /residual;
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
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logciliates=clone|site /residual;
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
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model logciliates=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model logciliates=clone|site /residual;
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














proc boxplot data=web;
    plot nematode*mgmt;
run;

proc sort data=web out=sortweb;
    by clone;
run;

proc boxplot data=sortweb;
    plot nematode*clone;
run;

*Tests of normality on untransformed total data;

proc univariate data=web normal;
    var nematode;
    histogram nematode;
    qqplot nematode;
run;

*Log transform total;

data web;
    set web;
    lognematode=log(nematode);
run;

*Tests of normality on transformed total data;

proc univariate data=web normal;
    var lognematode;
    histogram lognematode;
    qqplot lognematode;
run;
proc mixed data=web method=type3;
class clone mgmt site;
model lognematode=clone|mgmt;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt;
    model lognematode=clone|mgmt /residual;
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

proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone mgmt site;
    model lognematode=clone|mgmt /residual;
    random site(mgmt);
    lsmeans clone /pdiff adjust=tukey;
    lsmeans mgmt /pdiff adjust=tukey;
    lsmeans clone*mgmt;
    ods output lsmeans=lsmeans;
run;
proc mixed data=web method=type3;
    *by var after using proc transpose;
    Class Clone site;
    model lognematode=clone|site /residual;
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