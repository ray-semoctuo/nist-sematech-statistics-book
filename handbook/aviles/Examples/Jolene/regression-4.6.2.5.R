######################################################################
##
## regression-4.6.2.5.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.2.5. Weighting to Improve Fit   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd625.htm

######################################################################
##
## LEFT SIDE BAR:  Weighting

## Another approach when the assumption of constant standard deviation 
## of the errors (i.e. homogeneous variances) is violated is to perform 
## a <weighted fit 4.1.4.3>. In a weighted fit, we give less weight to 
## the less precise measurements and more weight to more precise 
## measurements when estimating the unknown parameters in the model.

## Create vector with dependent variable, field defect size
fdef = c(18,38,15,20,18,36,20,43,45,65,43,38,33,10,50,10,50,15,53,60,18,
         38,15,20,18,36,20,43,45,65,43,38,33,10,50,10,50,15,53,15,37,15,
         18,11,35,20,40,50,36,50,38,10,75,10,85,13,50,58,58,48,12,63,10,
         63,13,28,35,63,13,45,9,20,18,35,20,38,50,70,40,21,19,10,33,16,5,
         32,23,30,45,33,25,12,53,36,5,63,43,25,73,45,52,9,30,22,56,15,45)

## Create vector with independent variable, lab defect size
ldef = c(20.2,56.0,12.5,21.2,15.5,39.0,21.0,38.2,55.6,81.9,39.5,56.4,40.5,
         14.3,81.5,13.7,81.5,20.5,56.0,80.7,20.0,56.5,12.1,19.6,15.5,38.8,
         19.5,38.0,55.0,80.0,38.5,55.8,38.8,12.5,80.4,12.7,80.9,20.5,55.0,
         19.0,55.5,12.3,18.4,11.5,38.0,18.5,38.0,55.3,38.7,54.5,38.0,12.0,
         81.7,11.5,80.0,18.3,55.3,80.2,80.7,55.8,15.0,81.0,12.0,81.4,12.5,
         38.2,54.2,79.3,18.2,55.5,11.4,19.5,15.5,37.5,19.5,37.5,55.5,80.0,
         37.5,15.5,23.7,9.8,40.8,17.5,4.3,36.5,26.3,30.4,50.2,30.1,25.5,
         13.8,58.9,40.0,6.0,72.5,38.8,19.4,81.5,77.4,54.6,6.8,32.6,19.8,
         58.8,12.9,49.0)

## Determine number of observations
len = length(fdef)

######################################################################
##
## LEFT SIDE BAR:  Fit for Estimating Weights

## For the pipeline data, we chose <approximate replicate groups 4.4.5.2> 
## so that each group has four observations (the last group only has 
## three). This was done by first sorting the data by the predictor 
## variable and then taking four points in succession to form each 
## replicate group.

## Using the <power function model 4.4.5.2> with the data for estimating 
## the weights, we generated the following output using R for the fit of 
## ln(variances) against ln(means) for the replicate groups. The 
## output has been edited slightly for display. 

## Determine replicate groups
df = data.frame(ldef,fdef)
df = df[order(ldef),]
id = rep(1:27,each=4)
id = id[1:length(ldef)]
dfid = data.frame(id,df)

m = by(dfid$fdef,id,mean)
s2 = by(dfid$fdef,id,var)
mfdef = as.vector(m)
vfdef = as.vector(s2)
lnmfdef = log(mfdef)
lnvfdef = log(vfdef)

## Fit power function model
out2 = lm(lnvfdef~lnmfdef)
summary(out2)

##> Call:
##> lm(formula = lnvfdef ~ lnmfdef)

##> Residuals:
##>     Min      1Q  Median      3Q     Max 
##> -2.0038 -0.5934  0.1245  0.5605  1.7062 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  -3.1573     0.8696  -3.631  0.00127 ** 
##> lnmfdef       1.7087     0.2552   6.694 5.14e-07 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.8391 on 25 degrees of freedom
##> Multiple R-Squared: 0.6419,     Adjusted R-squared: 0.6276 
##> F-statistic: 44.82 on 1 and 25 DF,  p-value: 5.143e-07 

## Plot power function model with power function
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(lnmfdef,lnvfdef,xlim=c(1,5),ylim=c(-1,6),
     ylab="ln(Replicate Variances)", xlab="ln(Replicate Means)",
     main="Fit for Estimating Weights", cex=1.25, col="blue")
abline(reg=out2)

## The fit output and plot from the replicate variances against the 
## replicate means shows that the a linear fit provides a reasonable 
## fit with an estimated slope of 1.69. Note that this data set has 
## a small number of replicates, so you may get a slightly different 
## estimate for the slope. For example, S-PLUS generated a slope 
## estimate of 1.52. This is caused by the sorting of the predictor 
## variable (i.e., where we have actual replicates in the data, 
## different sorting algorithms may put some observations in different 
## replicate groups). In practice, any value for the slope, which will 
## be used as the <exponent in the weight function 4.4.5.2>, in the 
## range 1.5 to 2.0 is probably reasonable and should produce comparable 
## results for the weighted fit.

## We used an estimate of 1.5 for the exponent in the weighting function. 

######################################################################
##
## LEFT SIDE BAR:  Residual Plot for Weight Function

## Plot residuals from power function model
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(lnmfdef,out2$residuals, main="Residuals from Weight Estimation Fit",
     ylab="Residuals", xlab="ln(Replicate Means)",ylim=c(-2,2),
     xlim=c(1,5), cex=1.25, col="blue")
abline(h=0)

## The residual plot from the fit to determine an appropriate weighting 
## function reveals no obvious problems.

######################################################################
##
## LEFT SIDE BAR:  Numerical Output from Weighted Fit

## Weighted regression analysis
w = 1/(ldef**1.5)
outw = lm(fdef~ldef,weight=w)
summary(outw)
wresid = weighted.residuals(outw)

##> Call:
##> lm(formula = fdef ~ ldef, weights = w)

##> Residuals:
##>      Min       1Q   Median       3Q      Max 
##> -0.75742 -0.30420  0.07279  0.25865  0.78715 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  2.35234    0.54312   4.331  3.4e-05 ***
##> ldef         0.80636    0.02265  35.595  < 2e-16 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.3646 on 105 degrees of freedom
##> Multiple R-Squared: 0.9235,     Adjusted R-squared: 0.9227 
##> F-statistic:  1267 on 1 and 105 DF,  p-value: < 2.2e-16 

## R generated the following output for the weighted fit of the 
## model that relates the field measurements to the lab measurements.

## This output shows a slope of 0.81 and an intercept term of 2.35. 
## This is compared to a slope of 0.73 and an intercept of 4.99 in 
## the <original model 4.6.2.3>.

######################################################################
##
## LEFT SIDE BAR:  Plot of Predicted Values

## Plot data with overlaid weighted regression function
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(ldef,fdef,ylab="Field Defect Size", xlab="Lab Defect Size",
     col="blue")
abline(reg=outw)
title("Alaska Pipeline Data with Weighted Fit",line=2)
title("Weights=1/(Lab Defect Size)**1.5",line=1)

## The plot of the predicted values with the data indicates a good fit.

######################################################################
##
## LEFT SIDE BAR:  Diagnostic Plots of Weighted Residuals

## Residual 6-plot
par(mfrow=c(3,2),ask=T)
plot(ldef,fdef,xlab="Lab Defect Size",
     ylab="Field Defect Size",main="Field Defect Size vs Lab Defect Size")
abline(reg=outw)
plot(ldef,wresid,ylab="Residuals",xlab="Lab Defect Size",
     main="Residuals vs Lab Defect Size")
plot(outw$fitted.values,wresid,ylab="Residuals",xlab="Predicted",
     main="Residual vs Predicted")
plot(wresid[2:len],wresid[1:len-1],ylab="Residuals",
     xlab="Lag 1 Residuals",main="Lag Plot")
hist(wresid,ylab="Frequency",xlab="Residuals",main="Histogram")
qqnorm(wresid,main="Normal Probability Plot")

## We need to verify that the weighting did not result in the other 
## regression assumptions being violated. A 6-plot, after weighting 
## the residuals, indicates that the regression assumptions are 
## satisfied.

######################################################################
##
## LEFT SIDE BAR:  Plot of Weighted Residuals vs Lab Defect Size

## Plot weighted residuals versus lab defect size
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(ldef,wresid,ylab="Residuals",xlab="Lab Defect Size",
     main="Residuals from Weighted Fit")
abline(h=0)

## In order to check the assumption of homogeneous variances for the 
## errors in more detail, we generate a full sized plot of the weighted 
## residuals versus the predictor variable. This plot suggests that 
## the errors now have homogeneous variances.

######################################################################
## ================================================================ ##
######################################################################






