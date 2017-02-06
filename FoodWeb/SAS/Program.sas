FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_earthfort_out.csv" TERMSTR=CR;
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

proc univariate data=Earthfort normal;
var TotalBact;
histogram TotalBact;
qqplot TotalBact;
run;

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