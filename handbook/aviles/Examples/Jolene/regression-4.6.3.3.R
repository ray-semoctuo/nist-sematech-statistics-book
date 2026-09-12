######################################################################
##
## regression-4.6.3.3.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.3.3. Transformations to Improve Fit   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd633.htm

######################################################################
##
## LEFT SIDE BAR:  Transformations

## The first step in fitting a nonlinear function is to simply plot the data.

## Create vector with dependent variable, ultrasonic response
resp = c( 92.9000,78.7000,64.2000,64.9000,57.1000,43.3000,31.1000,23.6000,
          31.0500,23.7750,17.7375,13.8000,11.5875,9.4125,7.7250,7.3500,
          8.0250,90.6000,76.9000,71.6000,63.6000,54.0000,39.2000,29.3000,
          21.4000,29.1750,22.1250,17.5125,14.2500,9.4500,9.1500,7.9125,
          8.4750,6.1125,80.0000,79.0000,63.8000,57.2000,53.2000,42.5000,
          26.8000,20.4000,26.8500,21.0000,16.4625,12.5250,10.5375,8.5875,
          7.1250,6.1125,5.9625,74.1000,67.3000,60.8000,55.5000,50.3000,
          41.0000,29.4000,20.4000,29.3625,21.1500,16.7625,13.2000,10.8750,
          8.1750,7.3500,5.9625,5.6250,81.5000,62.4000,32.5000,12.4100,
          13.1200,15.5600,5.6300,78.0000,59.9000,33.2000,13.8400,12.7500,
          14.6200,3.9400,76.8000,61.0000,32.9000,13.8700,11.8100,13.3100,
          5.4400,78.0000,63.5000,33.8000,12.5600,5.6300,12.7500,13.1200,
          5.4400,76.8000,60.0000,47.8000,32.0000,22.2000,22.5700,18.8200,
          13.9500,11.2500,9.0000,6.6700,75.8000,62.0000,48.8000,35.2000,  
          20.0000,20.3200,19.3100,12.7500,10.4200,7.3100,7.4200,70.5000,
          59.5000,48.5000,35.8000,21.0000,21.6700,21.0000,15.6400,8.1700,
          8.5500,10.1200,78.0000,66.0000,62.0000,58.0000,47.7000,37.8000,
          20.2000,21.0700,13.8700,9.6700,7.7600,5.4400,4.8700,4.0100,3.7500,
          24.1900,25.7600,18.0700,11.8100,12.0700,16.1200,70.8000,54.7000,
          48.0000,39.8000,29.8000,23.7000,29.6200,23.8100,17.7000,11.5500,
          12.0700,8.7400,80.7000,61.3000,47.5000,29.0000,24.0000,17.7000,
          24.5600,18.6700,16.2400,8.7400,7.8700,8.5100,66.7000,59.2000,
          40.8000,30.7000,25.7000,16.3000,25.9900,16.9500,13.3500,8.6200,
          7.2000,6.6400,13.6900,81.0000,64.5000,35.5000,13.3100,4.8700,
          12.9400,5.0600,15.1900,14.6200,15.6400,25.5000,25.9500,81.7000,
          61.6000,29.8000,29.8100,17.1700,10.3900,28.4000,28.6900,81.3000,
          60.9000,16.6500,10.0500,28.9000,28.9500)

## Create vector with independent variable, metal distance
dist = c(0.500,0.625,0.750,0.875,1.000,1.250,1.750,2.250,1.750,2.250,2.750,
         3.250,3.750,4.250,4.750,5.250,5.750,0.500,0.625,0.750,0.875,1.000,
         1.250,1.750,2.250,1.750,2.250,2.750,3.250,3.750,4.250,4.750,5.250,
         5.750,0.500,0.625,0.750,0.875,1.000,1.250,1.750,2.250,1.750,2.250,
         2.750,3.250,3.750,4.250,4.750,5.250,5.750,0.500,0.625,0.750,0.875,
         1.000,1.250,1.750,2.250,1.750,2.250,2.750,3.250,3.750,4.250,4.750,
         5.250,5.750,0.500,0.750,1.500,3.000,3.000,3.000,6.000,0.500,0.750,
         1.500,3.000,3.000,3.000,6.000,0.500,0.750,1.500,3.000,3.000,3.000,
         6.000,0.500,0.750,1.500,3.000,6.000,3.000,3.000,6.000,0.500,0.750,
         1.000,1.500,2.000,2.000,2.500,3.000,4.000,5.000,6.000,0.500,0.750,
         1.000,1.500,2.000,2.000,2.500,3.000,4.000,5.000,6.000,0.500,0.750,
         1.000,1.500,2.000,2.000,2.500,3.000,4.000,5.000,6.000,0.500,0.625,
         0.750,0.875,1.000,1.250,2.250,2.250,2.750,3.250,3.750,4.250,4.750,
         5.250,5.750,3.000,3.000,3.000,3.000,3.000,3.000,0.500,0.750,1.000,
         1.500,2.000,2.500,2.000,2.500,3.000,4.000,5.000,6.000,0.500,0.750,
         1.000,1.500,2.000,2.500,2.000,2.500,3.000,4.000,5.000,6.000,0.500,
         0.750,1.000,1.500,2.000,2.500,2.000,2.500,3.000,4.000,5.000,6.000,
         3.000,0.500,0.750,1.500,3.000,6.000,3.000,6.000,3.000,3.000,3.000, 
         1.750,1.750,0.500,0.750,1.750,1.750,2.750,3.750,1.750,1.750,0.500,
         0.750,2.750,3.750,1.750,1.750)

## Save data in a data frame and determine the number of observations
df = data.frame(resp,dist)
len = length(resp)

## specify axis labels and plot title
xax = "Metal Distance"
yax = "Ultrasonic Response"
ttl = "Ultrasonic Reference Block Data"

######################################################################
##
## LEFT SIDE BAR:  Plot of Common Transformations to Obtain 
##                 Homogeneous Variances

## The first step is to try transformations of the response variable 
## that will result in homogeneous variances. In practice, the square 
## root, ln, and reciprocal transformations often work well for this 
## purpose. We will try these first.

## Transformations of response variable
lnresp = log(resp)
sqrtresp = sqrt(resp)
invresp = 1/resp

## Plot transformed data
par(mfrow=c(2,2),ask=T)
xax = "Metal Distance"
plot(dist,resp,xlab=xax,ylab="Ultrasonic Response",col="blue")
plot(dist,sqrtresp,xlab=xax,ylab="Sqrt(Ultrasonic Response)",col="blue")
plot(dist,lnresp,xlab=xax,ylab="ln(Ultrasonic Response)",col="blue")
plot(dist,invresp,xlab=xax,ylab="1/Ultrasonic Response",col="blue")
title(main="Transformations of Response Variable",outer=TRUE,line=-2)

## In examining these four plots, we are looking for the plot that 
## shows the most constant variability of the ultrasonic response across 
## values of metal distance. Although the scales of these plots differ 
## widely, which would seem to make comparisons difficult, we are not 
## comparing the absolute levesl of variability between plots here. 
## Instead we are comparing only how constant the variation within each 
## plot is for these four plots. The plot with the most constant variation 
## will indicate which transformation is best.

## Based on constancy of the variation in the residuals, the square 
## root transformation is probably the best tranformation to use for 
## this data. 

######################################################################
##
## LEFT SIDE BAR:  Plot of Common Transformations to Predictor Variables

## After transforming the response variable, it is often helpful to 
## transform the predictor variable as well. In practice, the square 
## root, ln, and reciprocal transformations often work well for this 
## purpose. We will try these first.

## Transformations of predictor variable
lndist = log(dist)
sqrtdist = sqrt(dist)
invdist = 1/dist

## Plot transformed data
par(mfrow=c(2,2),ask=T)
yax <- "Sqrt(Ultrasonic Response)"
plot(dist,sqrtresp,xlab="Metal Distance", ylab=yax, col="blue")
plot(sqrtdist,sqrtresp,xlab="Sqrt(Metal Distance)", ylab=yax, col="blue")
plot(lndist,sqrtresp,xlab="ln(Metal Distance)", ylab=yax, col="blue")
plot(invdist,sqrtresp,xlab="1/(Metal Distance)", ylab=yax, col="blue")
title(main="Transformations of Predictor Variable",outer=TRUE,line=-2)

## This plot shows that none of the proposed transformations offers 
## an improvement over using the raw predictor variable.

######################################################################
##
## LEFT SIDE BAR:  Square Root Fit

## Based on the above plots, we choose to fit a model with a square 
## root transformation for the response variable and no transformation 
## for the predictor variable.  We used R to generate the following 
## output for this model.

##  Fit model with sqrt(Ultrasonic Response)
out = nls(sqrtresp ~ exp(-b1*dist)/(b2 + b3*dist),
          start=list(b1=.1,b2=.1,b3=.1))
outs = summary(out)
outs

##> Formula: sqrtresp ~ exp(-b1 * dist)/(b2 + b3 * dist)

##> Parameters:
##>     Estimate Std. Error t value Pr(>|t|)    
##> b1 -0.015428   0.008611  -1.792   0.0746 .  
##> b2  0.080672   0.001506  53.577   <2e-16 ***
##> b3  0.063857   0.002880  22.173   <2e-16 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.2972 on 211 degrees of freedom

##> Correlation of Parameter Estimates:
##>         b1      b2
##> b2  0.7929        
##> b3 -0.9601 -0.8991

## Save fit information for plotting
pred = sqrtresp - outs$resid
dfout = data.frame(pred,dist)
dfout = dfout[order(dist),]

## Although the residual standard deviation is lower than it was for 
## the original fit, we cannot compare them directly since the fits 
## were performed on different scales.

######################################################################
##
## LEFT SIDE BAR: Plot of Predicted Values

## Plot data and regression function
par(mfrow=c(1,1),ask=T,cex=1.25)
plot(dist,sqrtresp,xlab=xax,ylab=yax,
     main="Transformed Data with Fit",col="blue")
lines(dfout$dist,dfout$pred)

## The plot of the predicted values with the transformed data indicates 
## a good fit. The fitted model is

##       \sqrt{y} = \frac{\exp(-0.015x)} {0.0807 + 0.0639x} 

######################################################################
##
## LEFT SIDE BAR:  6-Plot of Fit

## Residual 6-plot
par(mfrow=c(3,2),ask=T)
plot(dist,sqrtresp,xlab=xax, ylab="Sqrt(Ultrasonic Response)", 
     main=ttl)
lines(dfout$dist,dfout$pred)
plot(dist,outs$resid, ylab="Residuals", xlab="Metal Distance",
     main="Residuals vs Metal Distance")
plot(pred,outs$resid, ylab="Residuals", xlab="Predicted",
     main="Residual vs Predicted")
plot(outs$resid[2:len],outs$resid[1:len-1], ylab="Residuals",
     xlab="Lag 1 Residuals", main="Lag Plot")
hist(outs$resid, ylab="Frequency", xlab="Residuals", main="Histogram")
qqnorm(outs$resid, main="Normal Probability Plot")

## Since we transformed the data, we need to check that all of the 
## regression assumptions are now valid.

## The 6-plot of the data using this model indicates no obvious 
## violations of the assumptions. 

######################################################################
##
## LEFT SIDE BAR:  Plot of Residuals

##  Enlarge residual plot
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(dist,outs$resid, ylab="Residuals", xlab="Metal Distance",
     main="Residuals From Fit to Transformed Data", col="blue")
abline(h=0)

## In order to see more detail, we generate a full size version of 
## the residuals versus predictor variable plot. This plot suggests 
## that the errors now satisfy the assumption of homogeneous variances.

######################################################################
## ================================================================ ##
######################################################################