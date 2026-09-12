/* 9/3/96: MOD: Compare.  Set up macro to do one plot at a time.

Search on  
** START here
*/
%inc lib;
%gsfname(compare1);
&s1; symbol2 &s5n;

* Generate exp1 and exp2 macro var., f and k  or  o and s; 
%macro genvar;
data _null_;
call symput('exp1',substr("&exp",1,1));
call symput('exp2',substr("&exp",2,1));
run;
%mend genvar;

%macro axis1;
axis offset=(1,1);
%mend axis1;

%macro axis2;
axis offset=(1,1) order=(&&&exp.&y);
%mend axis2;

%macro blk(exp,y,n,c,outlabel);
%axis&n;
proc gplot;
&c.note h=1 j=c "Raw Data &outlabel" box=2 blank=yes bspace = 0.5 pct;
plot &y*mixnum=exp/&opt nolegend vaxis=axis;
run;
%mend blk;

%macro mblk(exp,y,n,c,outlabel);
%axis&n;
proc sort out=temp; by mixnum exp; run;
proc means noprint; var &y; by mixnum exp; output out=out mean=m&y;
run;
proc gplot;
&c.note h=1 j=c "Mean response &outlabel" box=2 blank=yes bspace = 0.5 pct;
plot m&y*mixnum=exp/&opt nolegend vaxis=axis;
run;
options _last_=temp;
%mend mblk;


** START here
     1. Define multiplot macro &y for arranging block plots.
     2. Define &exp.
     3. 1st time: Define mv n = 1 for default y-axis limits
     4. 2nd time, if desired: Set mv n = 2 and define mv &&&exp.&y in 
                  lib.sas to be y-axis limits, see eg mv fkdc
;

%macro dc(exp);
%*let n = 1;
%let n = 2;
%let y = dc;
%genvar;
title "&title, &&&exp.title"; 
title2 h=1.5 "&&&y" "     " "&exp1 is x, &exp2 is o";
%gslided;
%blk(&exp,&y,&n);
%mblk(&exp,&y,&n);
%m12t;
%mend dc;

%macro shr(exp);
%let n = 1;
%*let n = 2;
data noutlier; set &&&exp; where mix ^in &ooshr4d; run;
%genvar;
%macro raw;
title "&title, &&&exp.title"; 
title2 h=1.5 "Shrinkage (%) - raw data" "     " "&exp1 is x, &exp2 is o";
%gslided;
options _last_ = &&&exp;
%blk(&exp,shr4d,&n,*);
%blk(&exp,shr1w,&n,*);
%blk(&exp,shr2w,&n,*);
%blk(&exp,shr4w,&n,*);
%blk(&exp,shr8w,&n,*);
%blk(&exp,shr16w,&n,*);
%blk(&exp,shr44w,&n,*);
%blk(&exp,shr64w,&n,*);
%if "&exp" = "os" %then %do;
   options _last_ = noutlier;
   %blk(&exp,shr4d,&n,,Mix 5OB is deleted.);
%end;
%m33t;
%mend raw;
%macro mean;
title "&title, &&&exp.title"; 
title2 h=1.5 "Mean Shrinkage (%)" "     " "&exp1 is x, &exp2 is o";
%gslided;
options _last_ = &&&exp;
%mblk(&exp,shr4d,&n,*);
%mblk(&exp,shr1w,&n,*);
%mblk(&exp,shr2w,&n,*);
%mblk(&exp,shr4w,&n,*);
%mblk(&exp,shr8w,&n,*);
%mblk(&exp,shr16w,&n,*);
%mblk(&exp,shr44w,&n,*);
%mblk(&exp,shr64w,&n,*);
%if "&exp" = "os" %then %do;
   options _last_ = noutlier;
   %mblk(&exp,shr4d,&n,,Mix 5OB is deleted.);
%end;
%m33t;
%mend mean;
%raw;
%mean;
%mend shr;

%macro mod(exp);
%let n = 1;
%*let n = 2;
%genvar;
title "&title, &&&exp.title"; 
title2 h=1.5 "28 and 90-day Modulus (10**4 psi) " "     " "&exp1 is x, &exp2 is o";
%gslided;
%blk(&exp,mod28,&n);
%blk(&exp,mod90,&n);
%mblk(&exp,mod28,&n);
%mblk(&exp,mod90,&n);
%m22t;
%mend mod;

*%let exp = fk;
%let exp = os;

*%dc(&exp);
%shr(&exp);
*%mod(&exp);
