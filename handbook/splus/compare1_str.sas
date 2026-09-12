/* 2/29/96: BLOCK PLOT: Comparison of Full-depth (F) and Type K (K) for common
 mixes (1,4,6,9) or comparison of overlay (O) and slurry (S) for common mixes
(5,7,8,9).

 DEX: RCBD w/ 2 trt x 4 mixes ("blocks") x 3 batches (nested) --> 24 obs,
  primary factor is trt
*/
%inc lib;
%gsfname(compare1);
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
title "&title, &&&exp.title"; title2 "&exp1 is x, &exp2 is o";
%gslided;
proc gplot;
plot (&y)*mixnum=exp/&opt nolegend;
run;
%m22t;
%mend blk;

%macro mblk(exp,y,my);
%genvar;
options _last_ = &&&exp;
title "&title, &&&exp.title";
title2 "Mean response over batches   &exp1 is x, &exp2 is o";
proc sort out=temp; by mixnum exp; run;
proc means noprint; var &y; by mixnum exp; output out=out mean=&my;
run;
%gslided;
proc gplot;
plot (&my)*mixnum=exp/&opt nolegend;
run;
%m22t;
%mend mblk;

%macro blkstr(exp,y);
%genvar;
options _last_ = &&&exp;
title "&title, &&&exp.title"; title2 "&exp1 is x, &exp2 is o";
%gslided;
proc gplot;
plot str7*mixnum=exp/&opt nolegend &&&exp._str7;
plot (str28 str56 str90)*mixnum=exp/&opt nolegend;
run;
%m22t;
%mend blkstr;

%macro mblkstr(exp,y,my);
%genvar;
options _last_ = &&&exp;
title "&title, &&&exp.title";
title2 "Mean response over batches   &exp1 is x, &exp2 is o";
proc sort out=temp; by mixnum exp; run;
proc means noprint; var &y; by mixnum exp; output out=out mean=&my;
run;
%gslided;
proc gplot;
plot mstr7*mixnum=exp/&opt nolegend &&&exp._mstr7;
plot (mstr28 mstr56 mstr90)*mixnum=exp/&opt nolegend;
run;
%m22t;
%mend mblkstr;

%let y = str7 str28 str56 str90;
%let my = mstr7 mstr28 mstr56 mstr90;
%blk(fk,&y);
%let fk_str7=vaxis=3000 to 8000 by 1000;
%let fk_mstr7=vaxis=3000 to 8000 by 1000;
*%blkstr(fk,&y);
*%mblkstr(fk,&y,&my);

%let os_str7=vaxis=4000 to 10000 by 1000;
%let os_mstr7=vaxis=5000 to 9000 by 1000;
*%blkstr(os,&y);
*%mblkstr(os,&y,&my);
