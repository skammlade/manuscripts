FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_yieldmgmt.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=CSV OUT=Yield DBMS=CSV REPLACE;
RUN;

Proc print data=Yield;
run;

proc boxplot data=Yield;
    plot total*mgmt;
run;

proc sort data=Yield out=sortYield;
    by clone;
run;

proc boxplot data=sortYield;
    plot total*clone;
run;
proc sort data=Yield out=sortYield;
    by site;
run;

proc boxplot data=sortYield;
    plot total*site;
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

*Calculate simple means for plotting;

Proc Means data=Yield nway;
class clone site;
var total;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = total / group= site;
run;

Proc Sgplot data=SumStats;
series X = site Y = total / group= clone;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Yield method=type3;
class site clone;
model logtotal = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;





*Tests of normality on untransformed lessfour data;
proc univariate data=Yield normal;
var lessfour;
histogram lessfour;
qqplot lessfour;
run;

*Log transform total;
data Yield;
set Yield;
loglessfour=log(lessfour);
run;

*Tests of normality on transformed total data;
proc univariate data=Yield normal;
var loglessfour;
histogram loglessfour;
qqplot loglessfour;
run;

*Calculate simple means for plotting;

Proc Means data=Yield nway;
class clone site;
var lessfour;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = lessfour / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Yield method=type3;
class site clone;
model loglessfour = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;





*Tests of normality on untransformed greatfour data;
proc univariate data=Yield normal;
var greatfour;
histogram greatfour;
qqplot greatfour;
run;

*Log transform greatfour;
data Yield;
set Yield;
loggreatfour=log(greatfour);
run;

*Tests of normality on transformed greatfour data;
proc univariate data=Yield normal;
var loggreatfour;
histogram loggreatfour;
qqplot loggreatfour;
run;

*Calculate simple means for plotting;

Proc Means data=Yield nway;
class clone site;
var greatfour;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = greatfour / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Yield method=type3;
class site clone;
model loggreatfour = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;









*Tests of normality on untransformed greatsix data;
proc univariate data=Yield normal;
var greatsix;
histogram greatsix;
qqplot greatsix;
run;

*Log transform greatsix;
data Yield;
set Yield;
loggreatsix=log(greatsix+1);
run;

*Tests of normality on transformed greatsix data;
proc univariate data=Yield normal;
var loggreatsix;
histogram loggreatsix;
qqplot loggreatsix;
run;

*Calculate simple means for plotting;

Proc Means data=Yield nway;
class clone site;
var greatsix;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = greatsix / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Yield method=type3;
class site clone;
model loggreatsix = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;








*Tests of normality on untransformed greatten data;
proc univariate data=Yield normal;
var greatten;
histogram greatten;
qqplot greatten;
run;

*Log transform greatten;
data Yield;
set Yield;
loggreatten=log(greatten+10);
run;

*Tests of normality on transformed greatten data;
proc univariate data=Yield normal;
var loggreatten;
histogram loggreatten;
qqplot loggreatten;
run;

*Calculate simple means for plotting;

Proc Means data=Yield nway;
class clone site;
var greatten;
output out=SumStats mean= ;
run;

Proc Sgplot data=SumStats;
series X = clone Y = greatten / group= site;
run;

*Treating Sites as Fixed and using lsmestimate;
Proc Mixed data=Yield method=type3;
class site clone;
model loggreatten = site | clone / residual;
lsmestimate site "CONV vs ORG"  0.5 -0.5 -0.5 0.5;
lsmeans site clone / pdiff adjust=tukey;
run;
