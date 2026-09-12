######################################################################
##
## regression-4.6.1.8.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 17
## HANDBOOK:     4.6.1.8. Graphical Residual Analysis - Model #2
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd618.htm

######################################################################
##
## LEFT SIDE BAR:  <Compare to Initial Model 4.6.1.4>

## The data with a quadratic estimated regression function and the 
## residual plots are shown below.

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

## Create variable with squared load, determine number of observations
load2 = load*load
len = length(load)

## Fit quadratic model
outq = lm(deflection~load + load2)

## Sort data for plotting
upred = deflection - outq$resid
udfout = data.frame(upred,load)
udfout = udfout[order(load),]

## Plot data overlaid with estimated regression function
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(load,deflection,xlab="Load",ylab="Deflection",
     pch=16, cex=1.25, col="blue")
lines(udfout$load,udfout$upred)

## This plot is almost identical to the analogous plot for the 
## straight-line model, again illustrating the lack of detail in the 
## plot due to the scale. In this case, however, the residual plots 
## will show that the model does fit well.

######################################################################
##
## LEFT SIDE BAR:  Plot Indicates Model Fits Well

## Plot residuals versus independent variable, load
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(load,outq$residuals,xlab="Load",ylab="Residuals",
     pch=16, cex=1.25, col="blue")

## The residuals randomly scattered around zero, indicate that the 
## quadratic is a good function to describe these data. There is also no 
## indication of non-constant variability over the range of loads.

######################################################################
##
## LEFT SIDE BAR:  Plot Also Indicates Model OK

## Plot residuals versus predicted deflection
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(outq$fitted.values,outq$residuals,
     ylab="Residuals",xlab="Predicted Values from Quadratic Model",
     pch=16, cex=1.25, col="blue")

## This plot also looks good. There is no evidence of changes in 
## variability across the range of deflection.

######################################################################
##
## LEFT SIDE BAR:  No Problems Indicated

## 4-Plot of residuals
par(mfrow=c(2,2),ask=T)
plot(outq$residuals,ylab="Residuals",xlab="Observation Number",
     main="Run Order Plot")
plot(outq$residuals[2:len],outq$residuals[1:len-1],ylab="Residuals",
     xlab="Lag 1 Residuals",main="Lag Plot")
hist(outq$residuals,ylab="Frequency",xlab="Residuals",main="Histogram")
qqnorm(outq$residuals,main="Normal Probability Plot")

## All of these residual plots have become satisfactory by simply by 
## changing the functional form of the model. There is no evidence 
## in the run order plot of any time dependence in the measurement 
## process, and the lag plot suggests that the errors are independent. 
## The histogram and normal probability plot suggest that the random 
## errors affecting the measurement process are normally distributed.

######################################################################
## ================================================================ ##
######################################################################






