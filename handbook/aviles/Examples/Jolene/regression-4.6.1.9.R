######################################################################
##
## regression-4.6.1.9.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 17
## HANDBOOK:     4.6.1.9. Interpretation of Numerical Output - Model #2
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd619.htm

######################################################################
##
## LEFT SIDE BAR:  Quadratic Confirmed

## The numerical results from the fit are shown below. For the 
## quadratic model, the lack-of-fit test statistic is 0.8107. The 
## fact that the test statistic is approximately one indicates 
## there is no evidence to support a claim that the functional part 
## of the model does not fit the data. The test statistic would have 
## had to have been greater than 2.17 to reject the hypothesis that 
## the quadratic model is correct.

## Create vector with dependent variable, deflection
deflection = c(0.11019, 0.21956, 0.32949, 0.43899, 0.54803, 0.65694,
               0.76562, 0.87487, 0.98292, 1.09146, 1.20001, 1.30822,
               1.41599, 1.52399, 1.63194, 1.73947, 1.84646, 1.95392,
               2.06128, 2.16844, 0.11052, 0.22018, 0.32939, 0.43886,
               0.54798, 0.65739, 0.76596, 0.87474, 0.98300, 1.09150,
               1.20004, 1.30818, 1.41613, 1.52408, 1.63159, 1.73965,
               1.84696, 1.95445, 2.06177, 2.16829)

## Create vector with independent variable, load
load = c(150000, 300000, 450000, 600000, 750000, 900000, 1050000,
         1200000, 1350000, 1500000, 1650000, 1800000, 1950000,
         2100000, 2250000, 2400000, 2550000, 2700000, 2850000,
         3000000, 150000, 300000, 450000, 600000, 750000, 900000,
         1050000, 1200000, 1350000, 1500000, 1650000, 1800000,
         1950000, 2100000, 2250000, 2400000, 2550000, 2700000,
         2850000, 3000000)

######################################################################
##
## LEFT SIDE BAR:  R Output

## Generate quadratic load variable
load2 = load*load

## Generate regression analysis results
outq = lm(deflection~load + load2)
summary(outq)

##> Call:
##> lm(formula = deflection ~ load + load2)

##> Residuals:
##>        Min         1Q     Median         3Q        Max 
##> -4.468e-04 -1.578e-04  3.817e-05  1.088e-04  4.235e-04 

##> Coefficients:
##>               Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  6.736e-04  1.079e-04    6.24 2.97e-07 ***
##> load         7.321e-07  1.578e-10 4638.65  < 2e-16 ***
##> load2       -3.161e-15  4.867e-17  -64.95  < 2e-16 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.0002052 on 37 degrees of freedom
##> Multiple R-Squared:     1,      Adjusted R-squared:     1 
##> F-statistic:  1.853e+08 on 2 and 37 DF,  p-value: < 2.2e-16 

## Perform lack-of-fit test

## Compute sum-of-squares for total error
sse = sum(outq$res^2)
## Degrees of freedom for total error
df.sse = outq$df

## Compute sum of squares for pure error
sspe = sum((tapply(outq$res,load,length)-1)*tapply(outq$res,load,var))
sspe
##> [1] 9.2215e-07
## Degrees of freedom for pure error
df.sspe = sum((tapply(outq$res,load,length)-1))
df.sspe
##> [1] 20

## Compute sum of squares for lack-of-fit
sslf = sse-sspe
sslf
##> [1] 6.354677e-07
## Degrees of freedom for lack-of-fit
df.sslf = df.sse-df.sspe
df.sslf
##> [1] 17

## Compute lack of fit test statistic
lf.fstat = (sslf/df.sslf)/(sspe/df.sspe)
lf.fstat
##> [1] 0.8107239

## Determine p-value associated with test statistic
pval = 1 - pf(lf.fstat,df.sslf,df.sspe)
pval
##> [1] 0.666173

## Determine cut-off value for one-sided hypothesis test from F-table
qf(0.95,df.sslf,df.sspe)
##> [1] 2.166701

######################################################################
##
## LEFT SIDE BAR:  Regression Function

## From the numerical output, we can also find the regression function 
## that will be used for the calibration. The function, with its 
## estimated parameters, is
  	
## \begin{array}{ccl} D \equiv f(L;\vec{\beta}) & = & 0.673618\times10^{-3} \\ 
## & + & (0.732059\times10^{-6})L \\ & - & (0.316081\times10^{-14})L^2 \end{array}

## All of the parameters are significantly different from zero, as 
## indicated by the associated t statistics. The 97.5% cut-off for 
## the t distribution with 37 degrees of freedom is 2.026. Since 
## all of the t values are well above this cut-off, we can safely 
## conclude that none of the estimated parameters is equal to zero.

######################################################################
## ================================================================ ##
######################################################################






