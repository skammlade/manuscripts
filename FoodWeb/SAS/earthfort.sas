FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_earthfort.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV
		    OUT=Earthfort
		    DBMS=CSV
		    REPLACE;
RUN;

Proc print data=Earthfort;
run;

*Distribution of TotalBact by Site;
Proc boxplot;
plot TotalBact*Site;
run;

Proc boxplot;
plot TotalBact*Clone;
run;

*Tests of normality on untransformed TotalBact data;
proc univariate data=Earthfort normal;
var TotalBact;
histogram TotalBact;
qqplot TotalBact;
run;

*Log transform TotalBact;
data Earthfort;
set Earthfort;
logTotalBact=log(TotalBact);
run;

*Tests of normality on transformed TotalBact data;
proc univariate data=Earthfort normal;
var logTotalBact;
histogram logTotalBact;
qqplot logTotalBact;
run;
*NO NEED TO TRANSFORM! OBS #14 MAY BE OUTLIER;

proc mixed method=type3;
class Site;
model TotalBact=Site / residual;
lsmeans Site / pdiff adjust=tukey;
run;

*Two-way ANOVA TotalBact;
proc mixed data=Earthfort method=type3;
Class Clone Site;
model TotalBact = Clone|Site /residual;
lsmeans Clone*Site /pdiff;
lsmeans Site/pdiff;
slice Site*Clone /sliceby=Clone;
slice Site*Clone /sliceby=Site;
ods output lsmeans=lsmeans;
run;