######################################################################
##
## regression-4.6.2.4.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.2.4. Weighting to Improve Fit   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd624.htm

######################################################################
##
## LEFT SIDE BAR:  Transformations

## In regression modeling, we often apply transformations to achieve 
## the following two goals:

##    1. to satisfy the homogeneity of variances assumption for the errors.
##    2. to linearize the fit as much as possible. 

## Some care and judgment is required in that these two goals can 
## conflict. We generally try to achieve homogeneous variances first 
## and then address the issue of trying to linearize the fit.

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
## LEFT SIDE BAR:  Plot of Common Transformations to Obtain 
##                 Homogeneous Variances

## The first step is to try transforming the response variable to find 
## a tranformation that will equalize the variances. In practice, the 
## square root, ln, and reciprocal transformations often work well for 
## this purpose. We will try these first.

## Transformations of response variable
lnfdef = log(fdef)
sqrtfdef = sqrt(fdef)
invfdef = 1/fdef

## Plot transformed response variable
par(mfrow=c(2,2),ask=T)
xax = "Lab Defect Size"
plot(ldef,fdef,xlab=xax,ylab="Field Defect Size",col="blue")
plot(ldef,sqrtfdef,xlab=xax,ylab="Sqrt(Field Defect Size)",col="blue")
plot(ldef,lnfdef,xlab=xax,ylab="ln(Field Defect Size)",col="blue")
plot(ldef,invfdef,xlab=xax,ylab="1/Field Defect Size",col="blue")
title(main="Transformations of Response Variable",outer=TRUE,line=-2)

## In examining these plots, we are looking for the plot that shows the
## most constant variability across the horizontal range of the plot.

## This plot indicates that the ln transformation is a good candidate 
## model for achieving the most homogeneous variances. 

######################################################################
##
## LEFT SIDE BAR:  Plot of Common Transformations to Linearlize the Fit

## One problem with applying the above transformation is that the plot 
## indicates that a straight-line fit will no longer be an adequate 
## model for the data. We address this problem by attempting to find 
## a transformation of the predictor variable that will result in the 
## most linear fit. In practice, the square root, ln, and reciprocal 
## transformations often work well for this purpose. We will try these 
## first.

## Transformations of predictor variable
lnldef = log(ldef)
sqrtldef = sqrt(ldef)
invldef = 1/ldef

## Plot transformed predictor variable
par(mfrow=c(2,2),ask=T)
yax = "ln(Field Defect Size)"
plot(ldef,lnfdef,xlab="Lab Defect Size", ylab=yax, col="blue")
plot(sqrtldef,lnfdef,xlab="Sqrt(Lab Defect Size)", ylab=yax, col="blue")
plot(lnldef,lnfdef,xlab="ln(Lab Defect Size)", ylab=yax, col="blue")
plot(invldef,lnfdef,xlab="1/Lab Defect Size", ylab=yax, col="blue")
title(main="Transformations of Predictor Variable",outer=TRUE,line=-2)

## This plot shows that the ln transformation of the predictor 
## variable is a good candidate model.

######################################################################
##
## LEFT SIDE BAR:  Box-Cox Linearity Plot

## The previous step can be approached more formally by the use of 
## the <Box-Cox linearity plot 1.3.3.5> . The \alpha value on the x axis 
## corresponding to the maximum correlation value on the y axis 
## indicates the power transformation that yields the most linear fit.

##  Box-Cox linearity plot
for (i in (0:100)){
    alpha = -2 + 4*i/100
    if (alpha != 0){
    tx = ((ldef**alpha) - 1)/alpha
    temp = lm(lnfdef~tx)
    temps = summary(temp)
    if(i==0) {rsq = temps$r.squared
              alp = alpha}
    else {rsq = rbind(rsq,temps$r.squared)
          alp = rbind(alp,alpha)}
    }}
rcor = sqrt(rsq)
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(alp,rcor,type="l",xlab="Alpha",ylab="Correlation",
     main="Box-Cox Linearity Plot ln(Field) Lab",
     ylim=c(.6,1), col="blue")

## This plot indicates that a value of -0.1 achieves the most linear fit.

## In practice, for ease of interpretation, we often prefer to use a 
## common transformation, such as the ln or square root, rather than the 
## value that yields the mathematical maximum. However, the Box-Cox 
## linearity plot still indicates whether our choice is a reasonable one. 
## That is, we might sacrifice a small amount of linearity in the fit to 
## have a simpler model.

## In this case, a value of 0.0 would indicate a ln transformation. 
## Although the optimal value from the plot is -0.1, the plot indicates 
## that any value between -0.2 and 0.2 will yield fairly similar results. 
## For that reason, we choose to stick with the common ln transformation. 

######################################################################
##
## LEFT SIDE BAR:  ln-ln Fit

## Based on the above plots, we choose to fit a ln-ln model. R 
## generated the following output for this model.

## Regression for ln-ln transformed variables
outt = lm(lnfdef~lnldef)
summary(outt)

##> Call:
##> lm(formula = lnfdef ~ lnldef)

##> Residuals:
##>      Min       1Q   Median       3Q      Max 
##> -0.33360 -0.13982  0.03105  0.12745  0.33701 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  0.28138    0.08093   3.477 0.000739 ***
##> lnldef       0.88518    0.02302  38.457  < 2e-16 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 0.1683 on 105 degrees of freedom
##> Multiple R-Squared: 0.9337,     Adjusted R-squared: 0.9331 
##> F-statistic:  1479 on 1 and 105 DF,  p-value: < 2.2e-16 

## Note that although the residual standard deviation is significantly 
## lower than it was for the original fit, we cannot compare them 
## directly since the fits were performed on different scales. 

######################################################################
##
## LEFT SIDE BAR:  Plot of Predicted Values

## Plot data with overlaid regression function
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(lnldef,lnfdef,xlab="ln(Lab Defect Size)",ylab="ln(Field Defect Size)",
     main="Transformed Alaska Pipeline Data with Fit",col="blue")
abline(reg=outt)

## The plot of the predicted values with the transformed data 
## indicates a good fit. In addition, the variability of the data 
## across the horizontal range of the plot seems relatively constant.

######################################################################
##
## LEFT SIDE BAR:  6-Plot of Fit

## Residual 6-plot
par(mfrow=c(3,2),ask=T)
plot(lnldef,lnfdef,xlab="ln(Lab Defect Size)",ylab="ln(Field Defect Size)",
     main="ln(Field Defect Size vs ln(Lab Defect Size)")
abline(reg=outt)
plot(lnfdef,outt$residuals, xlab="ln(Lab Defect Size)",ylab="Residuals",
     main="Residual vs ln(Lab Defect Size)")
plot(outt$residuals,outt$fitted.values,ylab="Residuals",xlab="Predicted",
     main="Residual vs Predicted")
plot(outt$residuals[2:len],outt$residuals[1:len-1],ylab="Residuals",
     xlab="Lag 1 Residuals",main="Lag Plot")
hist(outt$residuals,ylab="Frequency",xlab="Residuals",main="Histogram")
qqnorm(outt$residuals,main="Normal Probability Plot")

## Since we transformed the data, we need to check that all of the 
## regression assumptions are now valid.

## The 6-plot of the residuals indicates that all of the regression 
## assumptions are now satisfied. 

######################################################################
##
## LEFT SIDE BAR:  Plot of Residuals

## Plot residuals versus ln(lab defect size)
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(lnldef,outt$residuals, xlab="ln(Lab Defect Size)",
     ylab="Residuals", main="Residuals from Fit to Transformed Data",
     cex=1.25, col="blue")
abline(h=0)

## In order to see more detail, we generate a full-size plot of the 
## residuals versus the predictor variable, as shown above. This plot 
## suggests that the assumption of homogeneous variances is now met.

######################################################################
## ================================================================ ##
######################################################################






