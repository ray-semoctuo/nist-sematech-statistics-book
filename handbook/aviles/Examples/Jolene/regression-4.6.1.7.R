######################################################################
##
## regression-4.6.1.7.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 17
## HANDBOOK:     4.6.1.7. Model Fitting - Model #2
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd617.htm

######################################################################
##
## LEFT SIDE BAR:  New Function

## Based on the residual plots, the function used to describe the data 
## should be the quadratic polynomial:
	
## D = \beta_0 + \beta_1L + \beta_2L^2

## The computer output from this process is shown below. As for the 
## straight-line model, however, it is important to check that the 
## assumptions underlying the parameter estimation are met before trying 
## to interpret the numerical output. The steps used to complete the 
## graphical residual analysis are essentially identical to those used for 
## the previous model.

######################################################################
##
## LEFT SIDE BAR:  R Output for Quadratic Fit

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

## Create variable with squared load
load2 = load*load

## Fit quadratic model
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

######################################################################
## ================================================================ ##
######################################################################






