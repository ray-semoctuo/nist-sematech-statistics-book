######################################################################
##
## regression-4.6.3.2.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.3.2. Initial Non-Linear Fit   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd632.htm

######################################################################
##
## LEFT SIDE BAR:  Plot of Data

## The first step in fitting a nonlinear function is to simply 
## plot the data.

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

##  Plot the data
par(mfrow=c(1,1),ask=T,cex=1.25)
xax = "Metal Distance"
yax = "Ultrasonic Response"
ttl = "Ultrasonic Reference Block Data"
plot(dist,resp, xlab=xax, ylab=yax, main=ttl,col="blue")

## This plot shows an exponentially decaying pattern in the data. 
## This suggests that some type of exponential function might be 
## an appropriate model for the data.

######################################################################
##
## LEFT SIDE BAR:  Initial Model Selection

## There are two issues that need to be addressed in the initial model 
## selection when fitting a nonlinear model.

##    1. We need to determine an appropriate functional form for the model.
##    2. We need to determine appropriate starting values for the estimation 
##       of the model parameters. 

######################################################################
##
## LEFT SIDE BAR:  Determining an Appropriate Functional Form for the Model

## Due to the large number of potential functions that can be used for 
## a nonlinear model, the determination of an appropriate model is not 
## always obvious. Some <guidelines for selecting an appropriate model 4.4.2> 
## were given in the analysis chapter.

## The plot of the data will often suggest a well-known function. In 
## addition, we often use scientific and engineering knowledge in 
## determining an appropriate model. In scientific studies, we are 
## frequently interested in fitting a theoretical model to the data. 
## We also often have historical knowledge from previous studies 
## (either our own data or from published studies) of functions that 
## have fit similar data well in the past. In the absence of a 
## theoretical model or experience with prior data sets, selecting 
## an appropriate function will often require a certain amount of 
## trial and error.

## Regardless of whether or not we are using scientific knowledge in 
## selecting the model, <model validation 4.4.4> is still critical 
## in determining if our selected model is adequate. 

######################################################################
##
## LEFT SIDE BAR:  Determining Appropriate Starting Values

## Nonlinear models are fit with iterative methods that require starting 
## values. In some cases, inappropriate starting values can result in 
## parameter estimates for the fit that converge to a local minimum or 
## maximum rather than the global minimum or maximum. Some models are 
## relatively insensitive to the choice of starting values while others 
## are extremely sensitive.

## If you have prior data sets that fit similar models, these can often 
## be used as a guide for determining good starting values. We can also 
## sometimes make educated guesses from the functional form of the model. 
## For some models, there may be specific methods for determining 
## starting values. For example, sinusoidal models that are commonly 
## used in time series are quite sensitive to good starting values. The 
## <beam deflection case study 1.4.2.5> shows an example of obtaining 
## starting values for a sinusoidal model.

## In the case where you do not know what good starting values would be, 
## one approach is to create a grid of values for each of the parameters 
## of the model and compute some measure of goodness of fit, such as the 
## residual standard deviation, at each point on the grid. The idea is 
## to create a broad grid that encloses reasonable values for the 
## parameter. However, we typically want to keep the number of grid 
## points for each parameter relatively small to keep the computational 
## burden down (particularly as the number of parameters in the model 
## increases). The idea is to get in the right neighborhood, not to find 
## the optimal fit. We would pick the grid point that corresponds to the 
## smallest residual standard deviation as the starting values. 

######################################################################
##
## LEFT SIDE BAR:  Fitting Data to a Theoretical Model

## For this particular data set, the scientist was trying to fit the 
## following theoretical model.

##      y = \frac{\exp(-b_1 x)} {b_2 + b_3 x} 

## Since we have a theoretical model, we use this as the initial model.
## The best starting values for the parameters are all 0.1.

######################################################################
##
## LEFT SIDE BAR:  Nonlinear Fit Output

## The following fit output was generated by R.

## Fit initial model
out = nls(resp ~ exp(-b1*dist)/(b2 + b3*dist),
           start=list(b1=.1,b2=.1,b3=.1))
outs = summary(out)
outs
upred = resp - outs$resid
udfout = data.frame(upred,dist)
udfout = udfout[order(dist),]

##> Formula: resp ~ exp(-b1 * dist)/(b2 + b3 * dist)

##> Parameters:
##>     Estimate Std. Error t value Pr(>|t|)    
##> b1 0.1902787  0.0219386   8.673 1.13e-15 ***
##> b2 0.0061314  0.0003450  17.772  < 2e-16 ***
##> b3 0.0105309  0.0007928  13.283  < 2e-16 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 3.362 on 211 degrees of freedom

##> Correlation of Parameter Estimates:
##>         b1     b2
##> b2  0.8386       
##> b3 -0.9505 -0.949

######################################################################
##
## LEFT SIDE BAR:  Plot of Predicted Values with Original Data

## Plot data and fitted curve
par(mfrow=c(1,1),ask=T,cex=1.25)
plot(dist,resp,xlab=xax,ylab=yax,col="blue")
lines(udfout$dist,udfout$upred)
title("Ultrasonic Reference Block Data",line=2)
title("With Unweighted Nonlinear Fit",line=1)

## This plot shows a reasonably good fit. It is difficult to detect any
## violations of the fit assumptions from this plot. The estimated model is

##      y = \frac{\exp(-0.190x)} {0.00613 + 0.0105x} 

######################################################################
##
## LEFT SIDE BAR:  6-Plot for Model Validation

## When there is a single independent variable, the <6-plot 1.3.3.33>  
## provides a convenient method for initial model validation.

## Residual 6-plot
par(mfrow=c(3,2),ask=T)
plot(dist,resp,xlab=xax, ylab=yax, main=ttl)
lines(udfout$dist,udfout$pred)
plot(dist,outs$resid, ylab="Residuals", xlab="Distance",
     main="Residuals vs Distance")
plot(upred,outs$resid, ylab="Residuals", xlab="Predicted",
     main="Residual vs Predicted")
plot(outs$resid[2:len],outs$resid[1:len-1], ylab="Residuals",
     xlab="Lag 1 Residuals", main="Lag Plot")
hist(outs$resid, ylab="Frequency", xlab="Residuals",main="Histogram")
qqnorm(outs$resid, main="Normal Probability Plot")

## The basic assumptions for regression models are that the errors are 
## random observations from a normal distribution with zero mean and 
## constant standard deviation (or variance).

## These plots suggest that the variance of the errors is not constant.

## In order to see this more clearly, we will generate full- sized a 
## plot of the predicted values from the model and overlay the data 
## and plot the residuals against the independent variable, Metal Distance. 

######################################################################
##
## LEFT SIDE BAR:  Plot of Residual Values against Independent Variable

## Enlarge residual plot
par(mfrow=c(1,1),ask=T,cex=1.25)
plot(dist,outs$resid, ylab="Residuals", xlab="Metal Distance",
     col="blue")
abline(h=0)
title("Ultrasonic Reference Block Data Residuals",line=2)
title("Unweighted Fit",line=1) 


## This plot suggests that the errors have greater variance for the 
## values of metal distance less than one than elsewhere. That is, 
## the assumption of homogeneous variances seems to be violated.

######################################################################
##
## LEFT SIDE BAR:  Non-Homogeneous Variances

## Except when the Metal Distance is less than or equal to one, there 
## is not strong evidence that the error variances differ. Nevertheless, 
## we will use transformations or weighted fits to see if we can elminate 
## this problem.

######################################################################
## ================================================================ ##
######################################################################