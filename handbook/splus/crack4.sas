/* 3/7/97: ANOVA Modeling for single cure
*/
%inc lib;
%gsfname(crack4);

%macro glm(cu,model,means,alpha,optmeans);
options _last_=&&crack&cu ls=72;
proc glm;
class mixnum wc sf round;
title2 h=1.5 "model &y = &model";
model &y = &model/ss1;
means &means/tukey alpha=&alpha &optmeans;
output out=out r=res p=pred;
run;

%macro validate;
%gslided;
proc gplot;
plot res*(pred wc sf round mixnum)/&optres;
run;
%normaln(res);
%m33t;
%mend validate;
%validate;

%mend glm;

%let cu = 1;
%let cu = 7;

title "&title - &cu Day Cure";

* Significant effects for Tukey multiple comparisons;

%let alpha = 0.10;
%let alpha = 0.05;

%let means1 = sf;
%let means7 = sf wc;

%let optmeans = ;
*%let optmeans = cldiff;

%let model = mixnum round;
%let model = sf|wc round;
*%let model = sf|wc round wc*round sf*round;

%let y = crack;
*%let y = logcrack;

%glm(&cu,&model,&&means&cu,&alpha,&optmeans);

