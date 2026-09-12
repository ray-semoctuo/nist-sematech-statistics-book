######################################################################
##
## regression-4.6.3.5.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 19
## HANDBOOK:     4.6.3.5. Compare the Fits  
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd635.htm

######################################################################
##
## LEFT SIDE BAR:  Three Fits to Compare

## It is interesting to compare the results of the three fits:

##    1. Unweighted fit
##    2. Transformed fit
##    3. Weighted fit 

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

## Fit initial model
out = nls(resp ~ exp(-b1*dist)/(b2 + b3*dist),
          start=list(b1=.1,b2=.1,b3=.1))
outi = summary(out)
uressd = outi$sigma
upred = resp - outi$resid
udfout = data.frame(upred,dist)
udfout = udfout[order(dist),]

## Fit model with sqrt(Ultrasonic Response)
sqrtresp = sqrt(resp)
out = nls(sqrtresp ~ exp(-b1*dist)/(b2 + b3*dist),
          start=list(b1=.1,b2=.1,b3=.1))
outt = summary(out)
pred = sqrtresp - outt$resid
dfout = data.frame(pred,dist)
dfout = dfout[order(dist),]
tpred = pred**2
tresid = resp - tpred
tressd = sqrt(sum(tresid**2)/outt$df[2])

## Weighted regression analysis
w = 1/(dist**(-1))
out = nls(~ sqrt(w)*(resp - exp(-b1*dist)/(b2 + b3*dist)),
          start=list(b1=.1,b2=.1,b3=.1))
outw = summary(out)
wpred = exp(-outw$parameters[1,1]*dist)/(outw$parameters[2,1] + 
        outw$parameters[3,1]*dist)
resid = resp - wpred
wresid = sqrt(w)*(resp-wpred)
wdfout = data.frame(wpred,dist)
wdfout = wdfout[order(dist),]
wressd = sqrt(sum(resid**2)/outw$df[2])

######################################################################
##
## LEFT SIDE BAR:  Plots of Fits with Data

## The first step in comparing the fits is to plot all three sets of 
## predicted values (in the original units) on the same plot with the 
## raw data.

## Plot to compare fits
par(mfrow=c(1,1),cex=1.25,ask=T)
plot(dist,resp,xlab="Metal Distance", ylab="Ultrasonic Response")
lines(udfout$dist,udfout$upred, lty=1, col="red")
lines(dfout$dist,dfout$pred**2, lty=2, col="black")
lines(wdfout$dist, wdfout$wpred, lty=3,col="blue")
legend(x=3,y=80,
       legend=c("Unweighted Fit","Transformed Fit","Weighted Fit"),
       lty=c(1,2,3), col=c("red","black","blue"))
title("Data with Unweighted Line, WLS Fit,",line=2)
title("and Fit Using Transformed Variables",line=1)

## This plot shows that all three fits generate comparable predicted 
## values. We can also compare the residual standard deviations (RESSD) 
## from the fits. The RESSD for the transformed data is calculated after 
## translating the predicted values back to the original scale.

##  Compare RESSD from fits

## RESSD from original fit
uressd
##> [1] 3.361672

## RESSD from fit using transformed response
tressd
##> [1] 3.323509

## RESSD from weighted fit
wressd
##> [1] 3.40894

## In this case, the RESSD is quite close for all three fits 
## (which is to be expected based on the plot).

######################################################################
##
## LEFT SIDE BAR:  Conclusion

## Given that transformed and weighted fits generate predicted values 
## that are quite close to the original fit, why would we want to make 
## the extra effort to generate a transformed or weighted fit? We do 
## so to develop a model that satisfies the <model assumptions 4.2.1>  
## for fitting a nonlinear model. This gives us more confidence that 
## conclusions and analyses based on the model are justified and 
## appropriate.

######################################################################
## ================================================================ ##
######################################################################