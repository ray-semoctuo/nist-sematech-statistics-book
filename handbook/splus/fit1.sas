/* 12/11/95: Fit macro - quadratic fit, model validation and contour plot

Search on 
***** START here to specify variable settings;
to begin.

APPROACH
1. Model in coded variables to reduce correlation/confounding and then use
   original variables sf and wc.
*/
%inc lib;
%gsfname(fit1);

%macro scatter(exp,y);
data ds; set &&&exp; &outliers; run;
title2 h=1.5 "&&&y";
%gslided;
symbol6 i=hiloj v=x;
proc gplot;
plot &y*&x2=&x1._n/&opt;
plot &y*&x1=&x2._n/&opt;
plot &y*seq/&opt;
plot &y*round=6/&opt;
run;
%m22t;
proc corr noprob nosimple; var &x1 &x2 &x1&x2 &x1.2 &x2.2; run;
%mend scatter;

%macro regall2(exp,y);
** x2 enters the model first;
data ds; set &&&exp; &outliers; run;
proc reg outest=outest noprint;
title2 h=1.5 "&&&y";
model &y =;
model &y = &x2;
model &y = &x2 &x1;
model &y = &x2 &x1 &x1&x2;
model &y = &x2 &x1 &x1&x2 &x1.2;
model &y = &x2 &x1 &x1&x2 &x1.2 &x2.2;
run;
data outest; set outest; drop _model_ _type_ &y;
format _rmse_ intercep &x1 &x2 &x1&x2 &x1.2 &x2.2 &format;
run;
proc print data=outest; run;
%mend regall2;

%macro regall1(exp,y);
** x1 enters the model first;
data ds; set &&&exp; &outliers; run;
proc reg outest=outest noprint;
title2 h=1.5 "&&&y";
model &y =;
model &y = &x1;
model &y = &x1 &x2;
model &y = &x1 &x2 &x1&x2;
model &y = &x1 &x2 &x1&x2 &x1.2;
model &y = &x1 &x2 &x1&x2 &x1.2 &x2.2;
run;
data outest; set outest; drop _model_ _type_ &y;
format _rmse_ intercep &x1 &x2 &x1&x2 &x1.2 &x2.2 &format;
run;
proc print data=outest; run;
%mend regall1;

%macro reg(exp,y,x);

data ds; set &&&exp; &outliers; run;
proc sort out=dsz; by seq; run;
proc reg outest=coef;
title2 h=1.5 "model &y (&&&y) = &x";
model &y = &x;
output out=out &res=res p=pred h=h dffits=dffits cookd=cookd;
run;
data out; set out; lagres = lag(res); run;

%macro validate;
%gslided;
%let optres = &opt &v;
proc gplot;
plot &y*&x2=&x1._n/&opt;
plot &y*&x1=&x2._n/&opt;
plot &y*&x1&x2/&opt;
plot &y*seq/&opt;
plot res*&x2=&x1._n/&optres;
plot res*&x1=&x2._n/&optres;
plot res*(&x1&x2 seq)/&optres;
plot res*(pred lagres)/&optres;
run;
%normaln(res);
%m34t;
%mend validate;

%macro validat2;
%gslided;
%let optres = &opt &v;
proc gplot;
plot &y*&x2=&x1._n/&opt;
plot &y*&x1=&x2._n/&opt;
plot &y*&x1&x2/&opt;
plot &y*seq/&opt;
plot res*&x2=&x1._n/&optres;
plot res*&x1=&x2._n/&optres;
plot res*(&x1&x2 seq)/&optres;
plot res*(pred lagres)/&optres;
run;
%normaln(res);
proc gplot;
label dffits = 'dffits' cookd = 'cookd' h = 'h';
plot h*mix/vaxis=0 to 1 by 0.2 vref=0.2 0.5 lvref=20 &opt;
plot dffits*mix/vref=-1 0 1 lvref=20 &opt;
plot cookd*mix/vref=1 lvref=20 &opt;
plot res*mix/&optres;
run;
%m44t;
%mend validat2;

*%validate;
%validat2;

%mend reg;

%macro contour;
* Uses coefficients from most recently fitted model, assumes <= 2nd order model;

data coef; set coef;
rename intercep=b0 &x1 = b1 &x2 = b2 &x1.2 = b11 &x2.2 = b22 &x1&x2 = b12;
drop _model_ _type_ &y;
format _rmse_ intercep &x1 &x2 &x1&x2 &x1.2 &x2.2 7.1;
run;

data coef; set coef;
b0=sum(b0,0); b1=sum(b1,0); b2=sum(b2,0); b11=sum(b11,0); b22=sum(b22,0); b12=sum(b12,0);
call symput('b0',left(put(b0,&format)));
call symput('b1',left(put(b1,&format)));
call symput('b2',left(put(b2,&format)));
call symput('b11',left(put(b11,&format)));
call symput('b22',left(put(b22,&format)));
call symput('b12',left(put(b12,&format)));
run;

data contour; set coef;
step = 30;
do &x1 = &&&x1.lo to &&&x1.hi by (&&&x1.hi - &&&x1.lo)/step;
 do &x2 = &&&exp&x2.lo to &&&exp&x2.hi by (&&&exp&x2.hi - &&&exp&x2.lo)/step;
   pred = b0 + b1*&x1 + b2*&x2 + b12*&x1*&x2 + b11*&x1*&x1 + b22*&x2*&x2;
   output;
 end;
end;
label &x1 = 'Silica fume - %'
      &x2 = 'w/cm'
;
run;

title "&title, &&&exp.title &outliers";
title2 "Predicted &&&y = &b0 + &b1*&x1 + &b2*&x2 + &b12*&x1*&x2 + &b11*&x1*&x1 + &b22*&x2*&x2";
title3 "Contour levels are &levels,  solid line is first contour level";
proc gcontour gout=mp;
axis1 &&&x1.order;
%* Run first plot statement first time;
&plot;
run;

%mend contour;

***** START here to specify variable settings;
**
** Specify values of macro variables;
**
** Select one the follow macros to run;
**
** %regall;
** %reg;
** %contour;
**;

* Use x1 and x2 for model identification (less correlated than sf and wc);
* Use sf and wc for model interpretation (contour plots);

%let x1 = sf;
%let x2 = wc;
*%let x1 = x1;
*%let x2 = x2;

%let y = str28;
*%let y = shr16w;
*%let y = dc;
*%let y = logdc;
*%let y = crack;
*%let y = shr4d;
*%let y = mod28;
*%let y = mod90;
*%let y = str90;
*%let y = lstr90;
*%let y = shr64w;

*%let exp = f;
%let exp = o;

%let outliers = ;
*%let outliers = where mix ^in &oostr28;
*%let outliers = where mix ^in &ofshr16w;
*%let outliers = where mix ^in &ofdc;
*%let outliers = where mix ^in &oflogdc;
*%let outliers = where mix ^in &ooshr4d;

title "&title, &&&exp.title &outliers";

** No need to run scatter, since you can fit a regression model with just
   the mean below;
*%scatter(&exp,&y);

%let format =;
%let format = 9.5;
*%let format = 9.4;
*%let format = 9.3;


** x2, i.e. wc (x1, i.e. sf) enters the model first in %regall2(1);
*%regall2(&exp,&y);
*%regall1(&exp,&y);

%let res = residual;
*%let res = rstudent;

* Null model, just the intercept = mean;
*%reg(&exp,&y,);

* 1-variable models;
*%reg(&exp,&y,&x2);
*%reg(&exp,&y,&x1);

* 2-variable models;
%reg(&exp,&y,&x2 &x1);

*%reg(&exp,&y,&x1 &x1.2);

* 3-variable models;
*%reg(&exp,&y,&x2 &x1 &x1&x2);
*%reg(&exp,&y,&x2 &x1 &x1.2);
*%reg(&exp,&y,&x2 &x1 &x2.2);

* 4-variable models;
*%reg(&exp,&y,&x2 &x1 &x1.2 &x2.2);

*%reg(&exp,&y,&x2 &x1 &x1&x2 &x1.2);
*%reg(&exp,&y,&x2 &x1 &x1&x2 &x2.2);

* Full quadratic model;
*%reg(&exp,&y,&x2 &x1 &x1&x2 &x1.2 &x2.2);

* f_str28: Apparent linear trend of residuals with lags is ns, p-value = 0.15, &x2.2 is ns;

** %contour uses coefficients from most recently fitted model;

** Plot in variables sf and wc instead of x1 and x2;
** Run plot statement 1 the first time through;
** 8/6/96: For contour levels now, I use just variable &&l&exp&y.  I think
    I initially introduced the 2nd macro variable for logdc for contours in
    logdc and in original units;

%let plot = plot &x2*&x1=pred/haxis=axis1;
%let levels = &&l&exp&y;
*%let levels = &&&exp&y;
%let plot = plot &x2*&x1=pred/haxis=axis1 levels=&levels nolegend;
%contour;
