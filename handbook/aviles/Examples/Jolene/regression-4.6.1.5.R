######################################################################
##
## regression-4.6.1.5.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 17
## HANDBOOK:     4.6.1.5. Interpretation of Numerical Output - Initial Model   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd615.htm

######################################################################
##
## LEFT SIDE BAR:  Lack-of-Fit Statistic Interpretable

## The fact that the residual plots clearly indicate a problem with the 
## specification of the function describing the systematic variation in 
## the data means that there is little point in looking at most of the 
## numerical results from the fit. However, since there are replicate 
## measurements in the data, the lack-of-fit test can also be used as 
## part of the model validation. The numerical results of the fit from R 
## are list below.

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

## Generate regression analysis results
out = lm(deflection~load)
summary(out)

##> Call:
##> lm(formula = deflection ~ load)

##> Residuals:
##>        Min         1Q     Median         3Q        Max 
##> -0.0042751 -0.0016308  0.0005818  0.0018932  0.0024211 

##> Coefficients:
##>              Estimate Std. Error  t value Pr(>|t|)    
##> (Intercept) 6.150e-03  7.132e-04    8.623 1.77e-10 ***
##> load        7.221e-07  3.969e-10 1819.289  < 2e-16 ***
## > ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.002171 on 38 degrees of freedom
##> Multiple R-Squared:     1,      Adjusted R-squared:     1 
##> F-statistic:  3.31e+06 on 1 and 38 DF,  p-value: < 2.2e-16 

## Perform lack-of-fit test

## Compute sum-of-squares for total error
sse = sum(out$res^2)
## Degrees of freedom for total error
df.sse = out$df

## Compute sum of squares for pure error
sspe = sum((tapply(out$res,load,length)-1)*tapply(out$res,load,var))
sspe
##> [1] 9.2215e-07

## Degrees of freedom for pure error
df.sspe = sum((tapply(out$res,load,length)-1))
df.sspe
##> [1] 20

## Compute sum of squares for lack-of-fit
sslf = sse-sspe
sslf
##> [1] 0.000178226

## Degrees of freedom for lack-of-fit
df.sslf = df.sse-df.sspe
df.sslf
##> [1] 18

## Compute lack of fit test statistic
lf.fstat = (sslf/df.sslf)/(sspe/df.sspe)
lf.fstat
##> [1] 214.7469

## Determine p-value associated with test statistic
pval = 1 - pf(lf.fstat,df.sslf,df.sspe)
pval
##> [1] 0

## Determine cut-off value for one-sided hypothesis test from F-table
qf(0.95,df.sslf,df.sspe)
##> [1] 2.151124


######################################################################
##
## LEFT SIDE BAR:  Function Incorrect

## The lack-of-fit test statistic is 214.7534, which also clearly 
## indicates that the functional part of the model is not right. The 
## 95 % cut-off point for the test is 2.15. Any value greater than 
## that indicates that the hypothesis of a straight-line model for this 
## data should be rejected.

## The same conclusion is reached by examining the p-value associated 
## with the test statistic.  The p-value is the probability of observing 
## a result at least as large as the test statistic based on random 
## chance alone, assuming the null hypothesis is true.  Since the 
## p-value in the example is much smaller than 0.05, we conclude that 
## the lack of fit is significant at the 0.05 level.

######################################################################
## ================================================================ ##
######################################################################






