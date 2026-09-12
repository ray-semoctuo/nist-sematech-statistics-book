######################################################################
##
## regression-4.6.1.3.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 12
## HANDBOOK:     4.6.1.3. Model Fitting - Initial Model   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd613.htm

######################################################################
##
## LEFT SIDE BAR: <Least Squares Estimation 4.4.3.1>

## Using R software for computing least squares parameter estimates, the 
## straight-line model,

## D = \beta_0 + \beta_1L

## is easily fit to the data. The computer output from this process is 
## shown below.  Before trying to interpret all of the numerical output, 
## however, it is critical to check that the assumptions underlying the 
## parameter estimation are met reasonably well.  The next two sections 
## show how the underlying assumptions about the data and model are 
## checked using graphical and numerical methods.

######################################################################
##
## LEFT SIDE BAR:  R Output

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
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.002171 on 38 degrees of freedom
##> Multiple R-Squared:     1,      Adjusted R-squared:     1 
##> F-statistic:  3.31e+06 on 1 and 38 DF,  p-value: < 2.2e-16 

######################################################################
## ================================================================ ##
######################################################################






