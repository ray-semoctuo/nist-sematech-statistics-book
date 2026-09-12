/* 4/17/96: Example of PROC LIFEREG - Analysis for censored survival data with
  covariates - Nelson and Hahn motorette data

Data: Nelson and Hahn (1972), Motorette Failures, censored survival times
  with one stress covariate temperature
 
References
1. SAS manual PROC LIFEREG ex.1 p. 1014
2. Kalbfleisch & Prentice - "The Statistical Analysis of Failure Time Data" p.5
*/
%inc lib;
%gsfname(crack0);

title "Motorette Failures with Operating Temperature as a Covariate";
data pred;
temp = 130; time = .; control = 1; z = 1000/(273.2 + temp); output;
temp = 150; time = .; control = 1; z = 1000/(273.2 + temp); output;
run;

data motors0;
input time censor temp @@;
control = 0;
z = 1000/(273.2 + temp);
output;
cards;
8064 0 150 8064 0 150 8064 0 150 8064 0 150 8064 0 150 
8064 0 150 8064 0 150 8064 0 150 8064 0 150 8064 0 150 
1764 1 170 2772 1 170 3444 1 170 3542 1 170 3780 1 170
4860 1 170 5196 1 170 5448 0 170 5448 0 170 5448 0 170
 408 1 190  408 1 190 1344 1 190 1344 1 190 1440 1 190
1680 0 190 1680 0 190 1680 0 190 1680 0 190 1680 0 190 
 408 1 220  408 1 220  504 1 220  504 1 220  504 1 220
 528 0 220  528 0 220  528 0 220  528 0 220  528 0 220 
;
run;
data motors; set pred motors0(where = (temp ^= 150)); run;
proc print; run;

%macro plot;
%gslided;
proc gplot data=motors0;
plot time*temp=censor/&opt;
plot time*z=censor/&opt;
run;
proc gplot data=motors;
plot time*temp=censor/&opt;
plot time*z=censor/&opt;
run;
%m22t;
%mend plot;
*%plot;

options ls=132;
proc lifereg outest=models covout;
a: model time*censor(0)=z/dist=weibull;
b: model time*censor(0)=z/dist=lnormal;
* Predictions are for most recent model;
output out=out quantiles = 0.1 0.5 0.9 std=std p=predtime control=control;
run;

proc print data=models;
id _model_;
title "Fitted Models";
run;

data out1; set out;
ltime = log(predtime);
* sd for predicted time is std, sd for predicted log time is approximated 
   (POE) by the relative std;
stde = std/predtime;
upper=exp(ltime+1.64*stde);
lower=exp(ltime-1.64*stde);
run;

proc print;
id temp;
title "quantile estimates and confidence limits";
run;
