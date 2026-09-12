/* 3/6/97: ANOVA Modeling

** Start here;

Findings

1. Log transform normalizes data and stabilizes variance.

*/
%inc lib;
%gsfname(crack2);
title "&title";

%let ds = &crack;
options _last_=&ds;

%macro glm(model);
proc glm;
class mixnum wc sf cu round;
title2 "model &y = &model";
model &y = &model/ss1;
*means cu sf*cu/tukey cldiff;
output out=out r=res p=pred;
run;

%macro validate;
%gslided;
proc gplot;
plot res*(pred wc sf cu mixnum)/&optres;
run;
%normaln(res);
%m33t;
%mend validate;
%validate;

%mend glm;

** Start here;

%let model = mixnum round;
%let model = wc|sf|cu;
*%let model = wc|sf|cu round;
*%let model = wc|sf|cu round wc*round sf*round cu*round;
*%let model = wc|sf|cu round wc*round sf*round cu*round sf*cu*round;

%let y = crack;
%let y = logcrack;

options ls=72;
%glm(&model);
