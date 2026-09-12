######################################################################
##
## regression-4.6.2.6.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.2.6. Compare the Fits   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd626.htm

######################################################################
##
## LEFT SIDE BAR:  Three Fits to Compare

## It is interesting to compare the results of the three fits:

##    1. Unweighted fit
##    2. Transformed fit
##    3. Weighted fit 

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

######################################################################
##
## LEFT SIDE BAR:  Plots of Fits with Data

##  Regression analysis
out = lm(fdef~ldef)
summary(out)

##  Regression for ln-ln transformed variables
lnfdef = log(fdef)
lnldef = log(ldef)
outt = lm(lnfdef~lnldef)
summary(outt)

##  Weighted regression analysis
w = 1/(ldef**1.5)
outw = lm(fdef~ldef,weight=w)
summary(outw)
wresid = weighted.residuals(outw)

##  Generate plot to compare three fits
xval = seq(min(ldef),max(ldef))
yu = predict.lm(out,data.frame(ldef=xval))
yt = exp(outt$coef[1]+outt$coef[2]*log(xval))
yw = predict.lm(outw,data.frame(ldef=xval))

par(mfrow=c(1,1),cex=1.25,ask=T)
plot(ldef,fdef,ylab="Field Defect Size", xlab="Lab Defect Size",
     xlim=c(0,90),ylim=c(0,90), cex=.85)
lines(x=xval,y=yu,lty=1, col="red")
lines(x=xval,y=yt,lty=2, col="black")
lines(x=xval,y=yw,lty=3, col="blue")
legend(85,legend=c("Unweighted Fit","Transformed Fit","Weighted Fit"),
       lty=c(1,2,3), col=c("red","black","blue"))
title("Data with Unweighted Line, WLS Fit,",line=2)
title("and Fit Using Transformed Variables",line=1)

## This plot shows that, compared to the original fit, the transformed 
## and weighted fits generate smaller predicted values for low values 
## of lab defect size and larger predicted values for high values of 
## lab defect size. The three fits match fairly closely for intermediate 
## values of lab defect size. The transformed and weighted fit tend to 
## agree for the low values of lab defect size. However, for large 
## values of lab defect size, the weighted fit tends to generate higher 
## values for the predicted values than does the transformed fit.

######################################################################
##
## LEFT SIDE BAR:  Conclusion

## Although the original fit was not bad, it violated the assumption 
## of homogeneous variances for the error term. Both the fit of the 
## transformed data and the weighted fit successfully address this 
## problem without violating the other regression assumptions.

######################################################################
## ================================================================ ##
######################################################################






