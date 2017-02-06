FILENAME CSV "/home/sara.kammlade/2014ThesisData/Health.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=Health DBMS=CSV REPLACE;
RUN;

Proc print data=Health;
run;

proc boxplot data=Health;
    plot HealthScore*Location;
run;

proc sort data=Health out=Health;
    by Location;
run;

proc boxplot data=Health;
    plot HealthScore*Location;
run;

proc univariate data=Health normal;
    var HealthScore;
    histogram HealthScore;
    qqplot HealthScore;
run;

#logtransform
data Health;
    set Health;
    logHealthScore=log(HealthScore);
run;

*Tests of normality on transformed total data;

proc univariate data=Health normal;
    var logHealthScore;
    histogram logHealthScore;
    qqplot logHealthScore;
run;

