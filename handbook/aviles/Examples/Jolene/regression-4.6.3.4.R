######################################################################
##
## regression-4.6.3.4.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.3.4. Weighting to Improve Fit   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd634.htm

######################################################################
##
## LEFT SIDE BAR:  Weighting

## Another approach when the assumption of constant variance of the 
## errors is violated is to perform a weighted fit. In a 
## <weighted fit 4.1.4.3>, we give less weight to the less precise 
## measurements and more weight to more precise measurements when 
## estimating the unknown parameters in the model.

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
## LEFT SIDE BAR:  Finding an Appropriate Weight Function

## Techniques for determining an appropriate weight function were 
## discussed in detail in <Section 4.4.5.2.>

## In this case, we have replication in the data, so we can fit the 
## <power model 4.4.5.2>

##       \begin{array}{ccl} \ln{(\hat{\sigma}_i^2)} 
##        & = & \ln{(\gamma_1x_i^{\gamma_2})} \\ & & \\ \mbox{\hspace*{0.55in}} 
##        & = & \ln{(\gamma_1)} + \gamma_2\ln{(x_i}) \end{array} 

## to the variances from each set of replicates in the data and use 
## w_i = \frac{1}{x^{\hat{\gamma}_2}_i} for the weights.

######################################################################
##
## LEFT SIDE BAR:  Fit for Estimating Weights

## R was used to generate the following output for the fit of 
## ln(variances) against ln(means) for the replicate groups. 

##  Determine Weights
dfs = df[order(dist),]
d = by(dfs$dist,dfs$dist,mean)
s2 = by(dfs$resp,dfs$dist,var)
md = as.vector(d)
vresp = as.vector(s2)
lnmd = log(md)
lnvresp = log(vresp)
out2 = lm(lnvresp~lnmd)
summary(out2)

##> Call:
##> lm(formula = lnvresp ~ lnmd)

##> Residuals:
##>     Min      1Q  Median      3Q     Max 
##> -1.1471 -0.4365  0.0985  0.4271  1.0269 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)   2.5369     0.1919   13.22 2.42e-11 ***
##> lnmd         -1.1128     0.1741   -6.39 3.11e-06 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.6099 on 20 degrees of freedom
##> Multiple R-Squared: 0.6712,     Adjusted R-squared: 0.6548 
##> F-statistic: 40.83 on 1 and 20 DF,  p-value: 3.106e-06 

##  Plot data and fitted line
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(lnmd,lnvresp,xlim=c(-1,2),ylim=c(0,4),ylab="ln(Replicate Variances)",
     xlab="ln(Metal Distance)", main="Fit for Estimating Weights",
     cex=1.25,col="blue")
abline(reg=out2)

## The fit output and plot from the replicate variances against the 
## replicate means shows that the linear fit provides a reasonable fit, 
## with an estimated slope of -1.03.

## Based on this fit, we used an estimate of -1.0 for the exponent 
## in the weighting function. 

######################################################################
##
## LEFT SIDE BAR:  Residual Plot for Weight Function

## Plot residuals
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(lnmd,out2$residuals, main="Residuals from Weight Estimation Fit",
     ylab="Residuals", xlab="ln(Metal Distance)",ylim=c(-2,2),
     xlim=c(-1,2), col="blue")
abline(h=0)

## The residual plot from the fit to determine an appropriate weighting 
## function reveals no obvious problems.

######################################################################
##
## LEFT SIDE BAR:  Numerical Output from Weighted Fit

## R was used to generate the following output for the weighted fit.

## Weighted regression analysis
w = 1/(dist**(-1))
outw = nls(~ sqrt(w)*(resp - exp(-b1*dist)/(b2 + b3*dist)),
           start=list(b1=.1,b2=.1,b3=.1))
outs = summary(outw)
outs

##> Formula: 0 ~ sqrt(w) * (resp - exp(-b1 * dist)/(b2 + b3 * dist))

##> Parameters:
##>     Estimate Std. Error t value Pr(>|t|)    
##> b1 0.1469999  0.0150471   9.769   <2e-16 ***
##> b2 0.0052801  0.0004021  13.131   <2e-16 ***
##> b3 0.0123875  0.0007362  16.826   <2e-16 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 4.111 on 211 degrees of freedom

##> Correlation of Parameter Estimates:
##>         b1      b2
##> b2  0.8134        
##> b3 -0.9448 -0.9287

## Save fit information for plotting
wpred = exp(-outs$parameters[1,1]*dist)/(outs$parameters[2,1] + 
        outs$parameters[3,1]*dist)
resid = resp - wpred
wresid = sqrt(w)*(resp-wpred)
wdfout = data.frame(wpred,dist)
wdfout = wdfout[order(dist),]

######################################################################
##
## LEFT SIDE BAR:  Plot of Predicted Values

## To assess the quality of the weighted fit, we first generate a plot 
## of the predicted line with the original data.

## Plot data with overlaid fitted curve
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(dist,resp,xlab="Metal Distance", ylab="Ultrasonic Response",
     col="blue")
lines(wdfout$dist,wdfout$wpred)
title("Ultrasonic Data with Weighted Fit",line=2)
title("Weights=1/(Metal Distance)**(-1)",line=1)

## The plot of the predicted values with the data indicates a good fit. 
## The model for the weighted fit is

##       y = \frac{\exp(-0.147x)}{0.00528 + 0.0124x} 

######################################################################
##
## LEFT SIDE BAR:  6-Plot of Fit

## Residual 6-plot
par(mfrow=c(3,2),ask=T)
plot(dist,resp,xlab="Metal Distance", ylab="Ultrasonic Response",
     main="Ultrasonic Response vs Metal Distance")
lines(wdfout$dist,wdfout$wpred)
plot(dist,wresid,ylab="Residuals",xlab="Metal Distance",
     main="Residuals vs Metal Distance")
plot(wpred,wresid,ylab="Residuals",xlab="Predicted",
     main="Residual vs Predicted")
plot(wresid[2:len],wresid[1:len-1],ylab="Residuals",
     xlab="Lag 1 Residuals",main="Lag Plot")
hist(wresid,ylab="Frequency",xlab="Residuals",main="Histogram")
qqnorm(wresid,main="Normal Probability Plot")

## We need to verify that the weighted fit does not violate the 
## regression assumptions. The 6-plot indicates that the regression 
## assumptions are satisfied.

######################################################################
##
## LEFT SIDE BAR:  Plot of Residuals

## Enlarge residual plot
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(dist,wresid,ylab="Residuals",xlab="Metal Distance",
     main="Residuals from Weighted Fit", col="blue")
abline(h=0)

## In order to check the assumption of equal error variances in more 
## detail, we generate a full-sized version of the residuals versus 
## the predictor variable. This plot suggests that the residuals now 
## have approximately equal variability.

######################################################################
## ================================================================ ##
######################################################################