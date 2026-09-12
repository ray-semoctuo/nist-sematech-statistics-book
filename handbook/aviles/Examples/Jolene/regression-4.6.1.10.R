######################################################################
##
## regression-4.6.1.10.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 17
## HANDBOOK:     Use of the Model for Calibration
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd61a.htm

######################################################################
##
## LEFT SIDE BAR:  Using the Model

## Now that a good model has been found for these data, it can be used 
## to estimate load values for new measurements of deflection. For 
## example, suppose a new deflection value of 1.239722 is observed. 
## The regression function can be solved for load to determine an 
## estimated load value without having to observe it directly. The 
## plot below illustrates the calibration process graphically.

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
## LEFT SIDE BAR:  <Calibration 4.1.3.3>

## Generate quadratic load variable
load2 = load*load

## Generate regression analysis results
outq = lm(deflection~load + load2)
qq = summary(outq)
qq

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

## Solve the regression function for Load
nd = 1.239722
tval = qt(.975,outq$df.residual)
f = function(load) {outq$coef%*%c(1,load,load^2)-nd}
nl = uniroot(f,c(min(load),max(load)))$root
nl
##> [1] 1705106

## Plot regression line and desired calibration point
par(mfrow=c(1,1),cex=1.25,ask=T,srt=0)
plot(load,deflection,ylab="Deflection",xlab="Load",
     pch=16, cex=1.25, col="blue")
abline(h=nd)
text(750000,1.3,"Deflection = 1.239722")
abline(v=nl)
par(srt=-90)
text(1800000,.7,"Load = ???")

######################################################################
##
## LEFT SIDE BAR:  Finding Bounds on the Load

## From the plot, it is clear that the load that produced the deflection 
## of 1.239722 should be about 1,750,000, and would certainly lie between 
## 1,500,000 and 2,000,000. This rough estimate of the possible load range 
## will be used to compute the load estimate numerically.

######################################################################
##
## LEFT SIDE BAR:  Obtaining a Numerical Calibration Value

## To solve for the numerical estimate of the load associated with 
## the observed deflection, the observed value substituting in the 
## regression function and the equation is solved for load. Typically 
## this will be done using a root finding procedure in a statistical 
## or mathematical package. That is one reason why rough bounds on 
## the value of the load to be estimated are needed.

######################################################################
##
## LEFT SIDE BAR:  Solving the Regression Equation

## \begin{array}{ccl} 1.239722 & = & 0.673618\times10^{-3} \\ 
## & + & (0.732059\times10^{-6})L \\ & - & (0.316081\times10^{-14})L^2 \\ 
## & \Downarrow & \\ L & = & 1705106 \end{array}

######################################################################
##
## LEFT SIDE BAR:  Which Solution?

## Even though the rough estimate of the load associated with an 
## observed deflection is not necessary to solve the equation, the 
## other reason is to determine which solution to the equation is 
## correct, if there are multiple solutions. The quadratic calibration 
## equation, in fact, has two solutions. As we saw from the plot on 
## the previous page, however, there is really no confusion over which 
## root of the quadratic function is the correct load. Essentially, the 
## load value must be between 150,000 and 3,000,000 for this problem. 
## The other root of the regression equation and the new deflection value 
## correspond to a load of over 229,899,600. Looking at the data at hand, 
## it is safe to assume that a load of 229,899,600 would yield a deflection 
## much greater than 1.24.

######################################################################
##
## LEFT SIDE BAR:  +/- What?

## The final step in the calibration process, after determining the 
## estimated load associated with the observed deflection, is to compute 
## an uncertainty or confidence interval for the load. A <single-use 95% 
## confidence interval 4.5.1.1> for the load, is obtained by inverting the 
## formulas for the upper and lower bounds of a <95% prediction interval 
## for a new deflection value 4.5.1.2>. These inequalities, shown below, are 
## usually solved numerically, just as the calibration equation was, 
## to find the end points of the confidence interval. For some models, 
## including this one, the solution could actually be obtained 
## algebraically, but it is easier to let the computer do the work 
## using a generic algorithm.

## \begin{array}{ccl} 1.239722 & > & f(L;\vec{\beta}) + t(0.975,37)\hat{\sigma}_p(L;\vec{\beta}) \\ 
## & \Downarrow & \\ L & > & 1704513 \end{array}

## \begin{array}{ccl} 1.239722 & < & f(L;\vec{\beta}) - t(0.975,37)\hat{\sigma}_p(L;\vec{\beta}) \\ 
## & \Downarrow & \\ L & < & 1705697 \end{array}

## The three terms on the right-hand side of each inequality are 
## the regression function ( f ), a t-distribution multiplier, 
## and the standard deviation of a new measurement from the process 
## ( \hat{\sigma}_p).  Regression software often provides convenient 
## methods for computing these quantities for arbitrary values of the 
## predictor variables, which can make computation of the confidence 
## interval end points easier. Although this interval is not symmetric 
## mathematically, the asymmetry is very small, so for all practical 
## purposes, the interval can be written as

## 1705106 \pm 593

## if desired.

## Compute confidence interval for calibration value 

## Create function to calculate the upper lmit
lo = function(load){
rsdm = sqrt(1 + c(1,load,load^2)%*%qq$cov.unscaled%*%c(1,load,load^2))
f(load) + tval*qq$sigma*rsdm
}

## Create function to calculate the lower limit
up = function(load){
rsdm = sqrt(1 + c(1,load,load^2)%*%qq$cov.unscaled%*%c(1,load,load^2))
f(load) - tval*qq$sigma*rsdm
}

## Use the two functions to find the roots
local = uniroot(lo,lower=min(load),upper=max(load))
local$root
##> [1] 1704513

upcal = uniroot(up,lower=min(load),upper=max(load))
upcal$root
##> [1] 1705698

######################################################################
## ================================================================ ##
######################################################################






