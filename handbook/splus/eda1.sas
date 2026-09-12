/* 12/11/95  Boiler plate EDA macro - plots and GLM for all responses

FINDINGS
1. F_STR - week is ns for 7, 28, 56, 90 day strength
2. O_STR - week is ns for 7, 28, 56, 90 day strength
3. F_DC - preliminary (only 2 rounds) poor agreement for diff. coef for mixes
       1,2,3; excellent agreement (suspiciously so) for mixes 4 to 9
*/
%inc lib;
%gsfname(eda1);

%macro eda(exp,y,format,outliers);
%let x1 = sf; %let x2 = wc;
data ds; set &&&exp; &outliers; run;
proc sort out=dsz; by seq; run;
%macro plots;
title "&title, &&&exp.title &outliers";
title2 h=1.5 "&&&y";
%gslided;
&s1; symbol2 &s5n; &s3;
proc gplot; note; 
note h=1 j=c "Round   x A   o B   + C" box=2 blank=yes bspace = 0.5 pct;
*note h=1 m=(18,92 pct) "Round   x A   o B   + C" box=2 blank=yes bspace = 0.5 pct;
plot &y*mixnum=round/&opt nolegend;
run;
proc gplot;
plot &y*(&x1 &x2)/&opt;
run;
%label(&exp,&y,&format,0.04);
&s1; &s2; &s3; symbol4 i=hiloj v=x;
proc gplot;
plot &y*round=4/&opt;
plot &y*seq/&opt;
run;
%m23t;
%mend plots;

%macro glm;
%let model = mixnum round;
proc glm;
class mixnum round;
title "&title, &&&exp.title &outliers";
title2 h=1.5 "Residuals from model &y(&&&y) = &model";
model &y = &model;
output out=out r=res p=pred;
run;

%gslided;
%plotresn;
proc gplot; plot res*(mixnum round)/&opt &v; run;
%m33t;

%mend glm;

%plots;
*%glm;

%mend eda;

*%let exp = f;
%let exp = o;

*%eda(&exp,str7,5.0,);
%eda(&exp,str28,4.1,);
*%eda(&exp,str56,5.0,);
*%eda(&exp,str90,4.1,);
*%eda(&exp,lstr90,5.2,);

*%eda(o,str28,5.0,where mix ^in &oostr28);

*%eda(&exp,dc,4.1);
*%eda(&exp,dc,4.1,where mix ^in &ofdc);
*%eda(&exp,logdc,6.2);
*%eda(&exp,logdc,6.2,where mix ^in &oflogdc);

*%eda(&exp,shr16w,5.3,);
*%eda(&exp,shr8w,5.3,);
*%eda(&exp,shr4w,5.3,);
*%eda(&exp,shr2w,5.3,);
*%eda(&exp,shr1w,5.3,);
*%eda(&exp,shr4d,5.3,);
*%eda(&exp,shr4d,5.3,where mix ^in &ooshr4d);
*%eda(f,shr16w,5.3,where mix ^in &ofshr16w);
*%eda(&exp,shr64w,5.3,);

*%eda(&exp,crack,4.0,);

*%eda(&exp,dc,4.1);
*%eda(&exp,logdc,6.2);

*%eda(&exp,mod28,6.1);
*%eda(&exp,mod90,6.1);
