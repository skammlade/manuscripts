FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_nutrientmgmt.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV OUT=Nutrient DBMS=CSV REPLACE;
RUN;

FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_yieldmgmt.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV OUT=Yield DBMS=CSV REPLACE;
RUN;

FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_harvestmgmt_pct.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV OUT=Quality DBMS=CSV REPLACE;
RUN;

FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_haney1.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV OUT=SHealth DBMS=CSV REPLACE;
RUN;

FILENAME CSV "/home/sara.kammlade/2014ThesisData/2014_SAS_earthfort.csv" TERMSTR=CR;
PROC IMPORT DATAFILE=CSV OUT=Foodweb DBMS=CSV REPLACE;
RUN;

proc sort data=Nutrient out=sortNutrient;
    by site mgmt clone rep;
run;

proc sort data=Yield out=sortYield;
    by site mgmt clone rep;
run;

proc sort data=Quality out=sortQuality;
    by site mgmt clone rep;
run;

proc sort data=SHealth out=sortSHealth;
   by site mgmt clone rep;
run;

proc sort data=Foodweb out=sortFoodweb;
    by site mgmt clone rep;
run;

Data combined;
merge sortNutrient sortYield sortQuality sortSHealth sortFoodweb;
by site mgmt clone rep;
run;

proc print data=Combined;
run;

proc corr data=Combined;
var K--bad;
run;

proc corr data=Combined;
var K, Fe, Zn, TotalBact, TotalFung, Protozoa, Amoeba, Ciliates, Nematode, Solvita, OrgC, OrgN;
run;


























