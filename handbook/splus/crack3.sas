/* 3/7/97: EDA for cracking data for single cure

** Start here;

*/
%inc lib;
%gsfname(crack3);

%macro scatter(cu);
options _last_ = &&crack&cu;
%gslided;
symbol v=x i=hiloj;
proc gplot;
plot &y*(wc sf round)/&opt;
run;
%m22t;
%mend scatter;

%macro blk(cu);
options _last_ = &&crack&cu;

title2 h=1.5 "Block Plots";
%gslided;
%blockpt(3,&ds,&y,wc,round,sf);
%blockpt(3,&ds,&y,sf,round,wc);
%blockpt(3,&ds,&y,sf,wc,round);
%m22t;

%mend blk;

%macro mean(cu);
proc format;
value facfmt 1 = 'wc' 2 = 'sf' 3 = 'Round' other = ' ';

%let facfmt=facfmt;

title2 h=1.5 "Means Plots     wc 0.35 0.40 0.45   sf 0 6 9 %   Round A B C D E";
%let p = 3;
%effp2(&p,&&crack&cu,&y,x1,x2,x4);

%mend mean;

%macro multmean;

%macro mean2(cu);
proc format; value facfmt 1 = 'wc' 2 = 'sf' 3 = 'Round' other = ' ';
%let facfmt=facfmt;
%effp2(3,&&crack&cu,&y,x1,x2,x4);

%mend mean2;

title "&title";
title2 h=1.5 "Means Plots     wc 0.35 0.40 0.45   sf 0 6 9 %   Round A B C D E";
%gslided;
%let t = log; %let cu = 1;
title h=1 "&cu Day Cure";
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%mean2(&cu);
%let t = log; %let cu = 7;
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%mean2(&cu);
%let t = ; %let cu = 1;
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%mean2(&cu);
%let t = ; %let cu = 7;
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%mean2(&cu);
%m22t;

%mend multmean;

%macro mulmean2;

%macro mean2(cu);
proc format; value facfmt 1 = 'wc' 2 = 'sf' 3 = 'Round' other = ' ';
%let facfmt=facfmt;
%effp2(3,&&crack&cu,&y,x1,x2,x4);

%mend mean2;

title "&title";
title2 h=1.5 "Means Plots     wc 0.35 0.40 0.45   sf 0 6 9 %   Round A B C D E";
%gslided;
%let t = log; %let cu = 1;
title h=1 "&cu Day Cure";
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%let vaxis = vaxis = 2.7 to 3.4 by 0.1;
%mean2(&cu);
%let t = log; %let cu = 7;
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%let vaxis = vaxis = 3.2 to 3.9 by 0.1;
%mean2(&cu);
%let vaxis = ;
%let t = ; %let cu = 1;
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%mean2(&cu);
%let t = ; %let cu = 7;
%let y = &t&var; %let ylabel = &t Days to Cracking; title h=1 "&cu Day Cure";
%mean2(&cu);
%m22t;

%mend mulmean2;

** Start here;

%let cu = 1;
*%let cu = 7;

title "&title - &cu Day Cure";

%let var = crack;

%let t = ;
%let t = Log;

%let y = &t&var;

%let ylabel = &t Days to Cracking;

*%scatter(&cu);

*%blk(&cu);

*%mean(&cu);

*%multmean;

%mulmean2;
