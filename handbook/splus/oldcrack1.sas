/* 4/18/96: Model censored cracking data as a function of silica fume and
  w/c using PROC LIFEREG
*/
 %inc lib;
%gsfname(crack1);

%let exp = &f;

%let quantile = 0.1 0.5 0.9;
%let quantile = 0.5;

data life; set &exp;
keep mix mixnum x1 x2 sf wc crack censor;
if crack ^= .;
run;

options ls=132;
proc lifereg outest=models covout;
a: model crack*censor(1)=x1 x2/dist=weibull;
b: model crack*censor(1)=x1 x2/dist=lnormal;
* Predictions are for most recent model;
output out=out quantiles = &quantile std=std p=predtime;
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
upper=exp(ltime+1.645*stde);
lower=exp(ltime-1.645*stde);
run;

proc print;
id mixnum sf wc x1 x2;
by mixnum sf wc x1 x2;
title "quantile estimates and confidence limits";
run;
