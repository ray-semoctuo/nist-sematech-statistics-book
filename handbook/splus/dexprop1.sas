/* 4/4/95: Estimate uncertainty in fitted quadratic model

GOAL
1. Estimate/compute relative uncertainty in the fitted quadratic model
  using the r reps of a 9 point ccd with given rsd.  Note that r and rsd
  are scalar factors since we get the same surface by fitting the mean
 response at the 9 points.

FINDINGS
1. With 2nd order model and CCD, fitted model at the center point is
   the center point itself and not the average of all data (as is the
  the case with the Factorial design and factorial model).  It is the
  average if the factorial model is used (linear and cross-product terms).
2. Maximum sd of fitted response is at the center with
      sd[yhat(0,0)] = s/root(r) where r is the number of reps.

   So use this fact for worst case scenarios.

3. Minimum sd is near the circle (factorial or axial all fall on a circle
   alpha = root(2) here) points.
*/
%gsfname(dexprop1);
title "&title";
title2 "Uncertainty in fitted quadratic model";
%let term2 = int x1 x2 x1x1 x2x2 x1x2;
%let term1 = int x1 x2 x1x2;
%let term1add = int x1 x2;
%let r = 1;

%let ds = library.ccd;
data xccd; set &ds; drop alpha;
int = 1; x1x1 = x1*x1; x2x2 = x2*x2; x1x2 = x1*x2;
do rep = 1 to &r; output; end;
run;

data cp; set xccd; if x1 = 0 and x2 = 0; output; run;
data xffd; set xccd; if abs(x1) = 1 or abs(x2) = 1; run;
data xax; set xccd; drop alpha; alpha = sqrt(2);
if abs(x1) = alpha or abs(x2) = alpha;
run;

data xffdwcp; set xffd cp; run;
data xaxwcp; set xax cp; run;

%let x = xccd;
%let order = 2;
%let var = &&term&order;

* Generate x pairs to compute uncertainty at;
data x0;
x1 = 0; x2 = 0;
int = 1; x1x1 = x1*x1; x2x2 = x2*x2; x1x2 = x1*x2; output;
x1 = 1; x2 = 1;
int = 1; x1x1 = x1*x1; x2x2 = x2*x2; x1x2 = x1*x2; output;
run;

data radius; alpha = sqrt(2);
do x1 = 0 to alpha by alpha/9;
x2 = 0; int = 1; x1x1 = x1*x1; x2x2 = x2*x2; x1x2 = x1*x2; output;
end;
run;

%let x0 = radius;
%let c = 1;

proc iml;
reset print fw=7 pagesize=1000 fuzz;
use &x; read all var {&var} into x [colname=vnamex];
use &x0; read all var {&var} into x0 [colname=vnamex0];
xpx = x`*x;
invxpx = inv(xpx);
zbhat = invxpx*x`;
h = x*invxpx*x`;
zsyhat = sqrt(vecdiag(x0*invxpx*x0`));
c = &c;
cyhat = c*zsyhat;
