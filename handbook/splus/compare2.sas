/* 3/1/96: ANOVA and CIs

** START here

 DEX: RCBD w/ 2 trt x 4 mixes ("blocks") x b batches (nested) --> 8b obs,
  where b = 2 or 3; primary factor is trt

Source        df

trt           1
mix           3
trt*mix       3
error         8(b-1)   batch(trt*mix)
              --
              8b-1

Components of "error" include batch to batch variability, measurement error, ...

GOAL:
  Construct "appropriate" ci's for the trt effect (K - F or O - S).
  "Appropriate" in the sense that if trt effects differ across mixes, i.e.
  a trt*mix interaction is present, we construct intervals separately for
  each mix.  If no interaction is present, construct one overall CI for
  the mean trt effect over mixes.

NOTE:
1. Check for ROUND effect by including ROUND(EXP) in model, since
  round for F or O is weeks and for K or S is days and most importantly run
  at different times, so nested
Q: If ROUND is significant, what to do?  Refer to 3/1/96 notes, p. 2, should
  incorporate it as random effect; can write variance formula for balanced
 data case, but complicated for unbalanced, perhaps PROC NESTED would help 
 here. For now, ignore, no ROUND effect for F - K where diff
  is sig.; there is a ROUND effect for O - S but difference is not sig anyway.
*/

%inc lib;
%gsfname(compare2);
&s1; symbol2 &s5n;

%macro anova(exp,y,outliers);
data ds; set &&&exp; &outliers; run;

data;
call symput('exp1',substr("&exp",1,1));
call symput('exp2',substr("&exp",2,1));
run;

%macro estimate;
lsmeans exp mixnum*exp;
means exp mixnum*exp;
estimate "Overall &exp1 - &exp2" exp -1 1;
estimate "&exp1 - &exp2 for mix &&&exp.mix1" exp -1 1 mixnum*exp -1 1  0 0  0 0  0 0;
estimate "&exp1 - &exp2 for mix &&&exp.mix2" exp -1 1 mixnum*exp 0 0  -1 1  0 0  0 0;
estimate "&exp1 - &exp2 for mix &&&exp.mix3" exp -1 1 mixnum*exp 0 0  0 0  -1 1  0 0;
estimate "&exp1 - &exp2 for mix &&&exp.mix4" exp -1 1 mixnum*exp 0 0  0 0   0 0  -1 1;
%mend estimate;

%macro estprint;
%let alpha = 0.05;
proc sort data=ds out=sort; by mixnum exp; run;
proc means noprint; var &y; by mixnum exp;
output out=sum n=n mean=mean;
run;
data sum; set sum; invn = 1/n; run;

proc sort data=sum; by exp; run;
proc means noprint; var mean invn; by exp;
output out=sum1 n=nmix sum=junk suminvn mean = mean;
run;
data overall; set sum1; if _n_ = 1 then set rootmse;
drop _type_ _freq_ junk mean suminvn exp nmix;
mean&exp2 = mean; suminvn&exp2 = suminvn;
mean&exp1 = lag(mean); suminvn&exp1 = lag(suminvn);
sdtrteff = rootmse*sqrt(suminvn&exp1 + suminvn&exp2)/nmix;
t = tinv(1-&alpha/2,df);
trteff = mean&exp2 - mean&exp1;
u = t*sdtrteff;
if exp = "&exp2";
run;

options nodate;
proc print label noobs;
title "95% CI for true mean (over mixes) &exp1 - &exp2 for &&&y &outliers";
format suminvn&exp1 suminvn&exp2 t 4.2 rootmse mean&exp1 mean&exp2 trteff sdtrteff u &format;
label rootmse = 's'
      df = 'df'
      mean&exp1 = "&exp1"
      mean&exp2 = "&exp2"
      suminvn&exp1 = "sum 1/n_&exp1"
      suminvn&exp2 = "sum 1/n_&exp2"
      trteff = "&exp2 - &exp1"
      sdtrteff = "sd(&exp2-&exp1)"
      t = 't'
      u = '+/- U'
;
run;

proc sort data=sum; by mixnum exp; run;
data bymix; set sum; if _n_ = 1 then set rootmse;
drop _type_ _freq_ mean invn exp n;
mean&exp2 = mean; invn&exp2 = invn;
mean&exp1 = lag(mean); invn&exp1 = lag(invn);
sdtrteff = rootmse*sqrt(invn&exp1 + invn&exp2);
t = tinv(1-&alpha/2,df);
trteff = mean&exp2 - mean&exp1;
u = t*sdtrteff;
if exp = "&exp2";
run;
title ' '; title2 ' ';
title3 "95% CI's for true mean &exp1 - &exp2 for &&&y for each mix";
proc print label noobs;
format invn&exp1 invn&exp2 t 4.2 rootmse mean&exp1 mean&exp2 trteff sdtrteff u &format;
label mixnum = 'Mix'
      rootmse = 's'
      df = 'df'
      mean&exp1 = "&exp1"
      mean&exp2 = "&exp2"
      invn&exp1 = "1/n_&exp1"
      invn&exp2 = "1/n_&exp2"
      trteff = "&exp2 - &exp1"
      sdtrteff = "sd(&exp2-&exp1)"
      t = 't'
      u = '+/- U'
;
run;

%mend estprint;

options _last_ = ds;
%*let model = mixnum exp mixnum*exp round(exp);
%let model = mixnum exp mixnum*exp;
proc glm outstat=outstat;
class mixnum exp round;
model &y = &model/ss3;
title "&title, &&&exp.title &outliers";
* USE lsmeans for appropriate overall comparison of K and F for unbalanced data;
* i.e. we want to estimate overall K - F using mean of cell means;
output out=out r=res p=pred;
*%estimate;
run;
data rootmse; set outstat; where _source_ = 'ERROR'; keep rootmse df;
rootmse = sqrt(ss/df);
run;

%estprint;

%macro respt;
options _last_ = out;
title "&title, &&&exp.title &outliers";
title2 h=1.5 "model &y = &model   &exp1 is x, &exp2 is o";
%gslided;
%let optres = &opt &v;
proc gplot;
plot &y*mixnum=exp/&opt nolegend;
plot res*pred/&optres;
plot res*mixnum=exp/&optres nolegend;
plot res*exp/&optres;
plot res*round=exp/&optres nolegend;
run;
%normaln(res);
%m33t;
%mend respt;
%respt;

%mend anova;

** START here

   1. Define mv EXP.
   2. Run ANOVA macro
;

*%let exp = FK;
%let exp = OS;

%let format = &f_str;

options nodate nonumber;

*%anova(&exp,str7);
*%anova(&exp,str28);
*%anova(&exp,str56);
*%anova(&exp,str90);

%let format = &f_dc;
*%anova(&exp,dc);

%let format = &f_logdc;
*%anova(&exp,logdc);

%let format = 8.5;
%anova(&exp,shr4d);
%anova(&exp,shr1w);
%anova(&exp,shr2w);
%anova(&exp,shr4w);
%anova(&exp,shr8w);
%anova(&exp,shr16w);
%anova(&exp,shr44w);
%anova(&exp,shr64w);
%anova(&exp,shr4d,where mix ^in &ooshr4d);

%let format = 8.2;
*%anova(&exp,mod28);
*%anova(&exp,mod90);
