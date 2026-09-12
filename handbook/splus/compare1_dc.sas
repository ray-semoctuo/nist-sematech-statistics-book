/* 2/29/96: BLOCK PLOT: Comparison of Full-depth (F) and Type K (K) for common
 mixes (1,4,6,9) or comparison of overlay (O) and slurry (S) for common mixes
(5,7,8,9).

 DEX: RCBD w/ 2 trt x 4 mixes ("blocks") x 3 batches (nested) --> 24 obs,
  primary factor is trt
*/
%inc lib;
%gsfname(compare1_str);
&s1; symbol2 &s5n;

%macro genvar;
data;
call symput('exp1',substr("&exp",1,1));
call symput('exp2',substr("&exp",2,1));
run;
%mend genvar;

%macro blk(exp,y);
%genvar;
options _last_ = &&&exp;
title "&title, &&&exp.title"; 
title2 h=1.5 "&&&y";
title3 "&exp1 is x, &exp2 is o";
%gslided;
proc gplot;
note h=1 j=c "Raw Data" box=2 blank=yes bspace = 0.5 pct;
plot (&y)*mixnum=exp/&opt nolegend &vaxis;
run;
proc sort out=temp; by mixnum exp; run;
proc means noprint; var &y; by mixnum exp; output out=out mean=m&y;
run;
proc gplot;
note h=1 j=c "Mean response over batches" box=2 blank=yes bspace = 0.5 pct;
plot m&y*mixnum=exp/&opt nolegend &vaxis;
run;
%m12t;
%mend blk;

*%let exp = fk;
%let exp = os;

%let y = dc;
%let fk_dc = vaxis = 0 to 60 by 10;
%let os_dc = vaxis = 5 to 16 by 1;

*%let y = logdc;
%let fk_logdc = vaxis = 0.9 to 1.8 by 0.1;
%let os_logdc = vaxis = 0.70 to 1.20 by 0.10;

%let vaxis = ;
%let vaxis = &&&exp._&y;
%blk(&exp,&y);
