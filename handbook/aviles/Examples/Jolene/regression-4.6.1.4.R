######################################################################
##
## regression-4.6.1.4.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 12
## HANDBOOK:     4.6.1.4. Graphical Residual Analysis - Initial Model   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd614.htm

######################################################################
##
## LEFT SIDE BAR:  Potentially Misleading Plot

## After fitting a straight line to the data, many people like to 
## check the quality of the fit with a plot of the data overlaid with 
## the estimated regression function. The plot below shows this for 
## the load cell data. Based on this plot, there is no clear evidence 
## of any deficiencies in the model.

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

## Determine the number of observations
len = length(load)

## Generate regression analysis results
out = lm(deflection~load)

## Plot data overlaid with estimated regression function
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(load,deflection,xlab="Load",ylab="Deflection",
     pch=16, cex=1.25, col="blue" )
abline(reg=out)

######################################################################
##
## LEFT SIDE BAR:  Avoiding the Trap

## This type of overlaid plot is useful for showing the relationship 
## between the data and the predicted values from the regression 
## function; however, it can obscure important detail about the model. 
## Plots of the residuals, on the other hand, show this detail well, 
## and should be used to check the quality of the fit. Graphical 
## analysis of the residuals is the single most important technique 
## for determining the need for model refinement or for verifying that 
## the underlying assumptions of the analysis are met.

## Residual plots of interest for this model include:

##   1. <residuals versus the predictor variable 4.4.4.1>
##   2. <residuals versus the regression function values 4.4.4.4>
##   3. <residual run order plot 4.4.4.6>
##   4. <residual lag plot 4.4.4.3>
##   5. <histogram of the residuals 4.4.4.5>
##   6. <normal probability plot 4.4.4.5> 

## A plot of the residuals versus load is shown below.

######################################################################
##
## LEFT SIDE BAR:  Hidden Structure Revealed

## Plot residuals versus the independent variable, load
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(load,out$residuals, xlab="Load", ylab="Residuals",
     pch=16, cex=1.25, col="blue")

######################################################################
##
## LEFT SIDE BAR:  Scale of Plot Key

## The structure in the relationship between the residuals and the 
## load clearly indicates that the functional part of the model is 
## misspecified. The ability of the residual plot to clearly show 
## this problem, while the plot of the data did not show it, is due 
## to the difference in scale between the plots. The curvature in the 
## response is much smaller than the linear trend. Therefore the 
## curvature is hidden when the plot is viewed in the scale of the data. 
## When the linear trend is subtracted, however, as it is in the residual 
## plot, the curvature stands out.

## The plot of the residuals versus the predicted deflection values 
## shows essentially the same structure as the last plot of the residuals 
## versus load. For more complicated models, however, this plot can reveal 
## problems that are not clear from plots of the residuals versus the 
## predictor variables.

######################################################################
##
## LEFT SIDE BAR:  Similar Residual Structure

## Plot residual versus predicted values
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(out$fitted.values,out$residuals, 
     xlab="Predicted Values from the Straight-Line Model", 
     ylab="Residuals", pch=16, cex=1.25, col="blue")

######################################################################
##
## LEFT SIDE BAR:  Additional Diagnostic Plots

## Further residual diagnostic plots are shown below. The plots include 
## a run order plot, a lag plot, a histogram, and a normal probability 
## plot. Shown in a two-by-two array like this, these plots comprise a 
## 4-plot of the data that is very useful for checking the assumptions 
## underlying the model.

## 4-Plot of residuals
par(mfrow=c(2,2),ask=T)
plot(out$residuals,ylab="Residuals",xlab="Observation Number",
     main="Run Order Plot")
plot(out$residuals[2:len],out$residuals[1:len-1],ylab="Residuals",
     xlab="Lag 1 Residuals",main="Lag Plot")
hist(out$residuals,ylab="Frequency",xlab="Residuals",main="Histogram")
qqnorm(out$residuals,main="Normal Probability Plot")

######################################################################
##
## LEFT SIDE BAR:  Interpretation of Plots

## The structure evident in these residual plots also indicates potential 
## problems with different aspects of the model. Under ideal circumstances, 
## the plots in the top row would not show any systematic structure in 
## the residuals. The histogram would have a symmetric, bell shape, and 
## the normal probability plot would be a straight line. Taken at face value, 
## the structure seen here indicates a time trend in the data, autocorrelation 
## of the measurements, and a non-normal distribution of the residuals.

## It is likely, however, that these plots will look fine once the function 
## describing the systematic relationship between load and deflection has 
## been corrected. Problems with one aspect of a regression model often show 
## up in more than one type of residual plot. Thus there is currently no 
## clear evidence from the 4-plot that the distribution of the residuals from 
## an appropriate model would be non-normal, or that there would be 
## autocorrelation in the process, etc. If the 4-plot still indicates these 
## problems after the functional part of the model has been fixed, however, 
## the possibility that the problems are real would need to be addressed.

######################################################################
## ================================================================ ##
######################################################################






