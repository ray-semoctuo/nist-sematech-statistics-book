/* 12/11/95  Multiplots of design and points labelled with mean response.
*/
%inc lib;
%gsfname(eda2);

%macro title(exp);
title "&title, &&&exp.title";
title2 h=1.5 "Vertical axis is water to cement (wc) ratio; Horizontal axis is silica fume (sf) amount (in %)";
%mend title;

%macro lab_str(exp,format,pct);
%title(&exp);
%gslided;
%label(&exp,str7,&format,&pct);
%label(&exp,str28,&format,&pct);
%label(&exp,str56,&format,&pct);
%label(&exp,str90,&format,&pct);
%m22t;
%mend lab_str;

%macro lab_shr(exp,format,pct);
%title(&exp);
%gslided;
%label(&exp,shr4d,&format,&pct);
%label(&exp,shr1w,&format,&pct);
%label(&exp,shr2w,&format,&pct);
%label(&exp,shr4w,&format,&pct);
%label(&exp,shr8w,&format,&pct);
%label(&exp,shr16w,&format,&pct);
%m23t;
%mend lab_shr;

*%let exp = f;
%let exp = o;

*%lab_str(&exp,5.0,0.05);
%lab_shr(&exp,5.3,0.05);
