/* 5/2/96: Yellow book

  3/8/96: Contour plots inverse transform of log(dc) model to dc

12/11/95: Fit macro - quadratic fit, model validation and contour plot

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

%macro regall(exp,y);
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
%mend regall;

%macro regall2(exp,y);
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
%mend regall2;

%macro reg(exp,y,x);

data ds; set &&&exp; &outliers; run;
proc sort out=dsz; by seq; run;
proc reg outest=coef;
title2 h=1.5 "model &y (&&&y) = &x";
model &y = &x;
output out=out r=&res p=pred h=h dffits=dffits cookd=cookd;
run;
data out; set out; lagres = lag(&res); run;

%macro validate;
%gslided;
%let optres = &opt &v;
proc gplot;
plot &y*&x2=&x1._n/&opt;
plot &y*&x1=&x2._n/&opt;
plot &y*&x1&x2/&opt;
plot &y*seq/&opt;
plot &res*&x2=&x1._n/&optres;
plot &res*&x1=&x2._n/&optres;
plot &res*(&x1&x2 seq)/&optres;
plot &res*(pred lagres)/&optres;
run;
%normaln(&res);
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
plot &res*&x2=&x1._n/&optres;
plot &res*&x1=&x2._n/&optres;
plot &res*(&x1&x2 seq)/&optres;
plot &res*(pred lagres)/&optres;
run;
%normaln(&res);
proc gplot;
label dffits = 'dffits' cookd = 'cookd' h = 'h';
plot h*seq/vaxis=0 to 1 by 0.2 vref=0.2 0.5 lvref=20 &opt;
plot dffits*seq/vref=-1 0 1 lvref=20 &opt;
plot cookd*seq/vref=1 lvref=20 &opt;
run;
%m44t;
%mend validat2;

*%validate;
*%validat2;

%mend reg;

* Assumes most recently fitted model is quadratic;
%macro contour;

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
   tpred = 10**pred;
   output;
 end;
end;
label &x1 = 'Silica fume - %'
      &x2 = 'w/cm'
;
run;

%let xorig = 9; 
%let yorig = 10;
%let xnote = 43;
%let ynote = 90;

title "&title, &&&exp.title &outliers";
title2 "Predicted &dc = 10**(&b0 + &b1*&x1 + &b2*&x2 + &b12*&x1*&x2 + &b11*&x1*&x1 + &b22*&x2*&x2)";
title3 "Contour levels are &levels,  solid line is first contour level";
title " ";
*proc gcontour gout=mp;
proc gcontour;
label wc = 'Water to Cement Ratio' 
      sf = 'Silica Fume Percentage'
;
*note h=1 m=(59,24 pct) "10" 
     m=(44,41 pct) "14"
     m=(35,51 pct) "18"
     m=(29,57.5 pct) "22"
     m=(24,63 pct) "26"
;
note h=1 m=(32.5,27.5 pct) "10" 
     m=(25.5,43.5 pct) "14"
     m=(21.5,52 pct) "18"
;
*note m=(&xorig,&yorig pct) "0"
     m=(+&xnote,+0 pct) "0"
     m=(+0,&ynote pct) "0"
     m=(-&xnote,+0 pct) "0"
;
*axis1 &&&x1.order;
axis1 order=(0 to 12 by 3);
%* Run first plot statement first time;
&plot;
run;
%mend contour;

***** START here to specify variable settings;

* Use x1 and x2 for model identification (less correlated than sf and wc);
* Use sf and wc for model interpretation (contour plots);

%let x1 = sf;
%let x2 = wc;
*%let x1 = x1;
*%let x2 = x2;

*Analysis for log10(dc);
%let y = logdc;

%let exp = f;
*%let exp = o;

%let outliers = ;
%let oflogdc = ('2FA');
%let oflogdc = ('2FA','3FA');
%let outliers = where mix ^in &oflogdc;

title "&title, &&&exp.title &outliers";
*%scatter(&exp,&y);

%let format =;
%let format = 8.4;
*%regall(&exp,&y);
*%regall2(&exp,&y);

*%let res = res;
%let res = rstudent;

*%reg(&exp,&y,&x2);
*%reg(&exp,&y,&x1);

*%reg(&exp,&y,&x2 &x1);

*%reg(&exp,&y,&x1 &x1.2);

*%reg(&exp,&y,&x2 &x1 &x1&x2);
%reg(&exp,&y,&x2 &x1 &x1.2);
*%reg(&exp,&y,&x2 &x1 &x2.2);

*%reg(&exp,&y,&x2 &x1 &x1.2 &x2.2);

*%reg(&exp,&y,&x2 &x1 &x1&x2 &x1.2);
*%reg(&exp,&y,&x2 &x1 &x1&x2 &x2.2);
*%reg(&exp,&y,&x2 &x1 &x1&x2 &x1.2 &x2.2);
* f_str28: Apparent linear trend of residuals with lags is ns, p-value = 0.15, &x2.2 is ns;

* Run plot statement 1 the first time through;
* Plot in variables sf and wc instead of x1 and x2;
* Define and use 2nd levels macro var. if deleting outliers changes contour levels;

* Plot design with mean Dc's at points;

%inc '~/detwiler/macros/label_f_dc_yb.sas';
title ' ';

*%portrait;

goptions ftext=triplex;

%notitle;
%cell3;

* Use proper cell size for portrait;
*%cellpor3;
*goptions hpos=58 vpos=36;

%labelyb(&exp,dc,4.1,0.04);

*%let plot = plot &x2*&x1=tpred/haxis=axis1;
%let lflogdc = 10 to 58 by 4;
%let levels = &&l&exp&y;
*%let levels = &&&exp&y;
%let plot = plot &x2*&x1=tpred/haxis=axis1 levels=&levels nolegend;
%contour;

%m21;

