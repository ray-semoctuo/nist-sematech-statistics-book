/* 3/6/97: EDA for cracking data

** Start here;

* TO DO: Do block plots for with cell means, examine log(crack);

*/
%inc lib;
%gsfname(crack1);
title "&title";

%let ds = &crack;
options _last_=&ds;

%macro scatter;
%gslided;
symbol v=x i=hiloj;
proc gplot;
plot &y*(wc sf cu round)/&opt;
run;
%m22t;
%mend scatter;

%macro blk;

*%blockpt(4,&ds,&y,sf,cu,round,wc);
*%blockpt(4,&ds,&y,sf,wc,round,cu);
%blockpt(4,&ds,&y,cu,wc,round,sf);

%mend blk;

%macro mblk;

%gslided;
%blockpt(3,&ds,&y,sf,wc,cu);
%blockpt(3,&ds,&y,cu,wc,sf);
%blockpt(3,&ds,&y,cu,sf,wc);
%m22t;

%mend mblk;

%macro int;
%gslided;
%intplot(&ds,&y,sf,cu);
%intplot(&ds,&y,cu,sf);
%m12t;
%mend int;

%macro mean;

proc format;
value facfmt 1 = 'wc' 2 = 'sf' 3 = 'Cure' 4 = 'Round' other = ' ';

%let facfmt=facfmt;

title2 h=1.5 "Means Plots      &crackfac";
%let p = 4;
%effp2(&p,&ds,&y,x1,x2,x3,x4);

%mend mean;

%macro multmean;

%macro mean2;

proc format;
value facfmt 1 = 'wc' 2 = 'sf' 3 = 'Cure' 4 = 'Round' other = ' ';
%let facfmt=facfmt;
%let p = 4; %effp2(&p,&ds,&y,x1,x2,x3,x4);

%mend mean2;

title2 h=1.5 "Means Plots      &crackfac";

%gslided;
%let t = ; 
%let y = &t&var; %let ylabel = &t Days to Cracking; %mean2;
%let t = log; 
%let y = &t&var; %let ylabel = &t Days to Cracking; %mean2;
%m12t;

%mend multmean;

** Start here;

%let var = crack;

%let t = ;
%let t = Log;

%let y = &t&var;

%let ylabel = &t Days to Cracking;

*%scatter;

*%blk;

*%mblk;

*%int;

*%mean;

%multmean;
