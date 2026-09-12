######################################################################
##
## regression-4.6.2.2.R
##
## AUTHOR:       Jolene Splett
## MODIFICATION: 2007 Apr 17
## HANDBOOK:     4.6.2.2. Check for Batch Effect   
## http://www.itl.nist.gov/div898/handbook/pmd/section6/pmd622.htm

######################################################################
##
## LEFT SIDE BAR:  Plot of Raw Data

## As with any regression problem, it is always a good idea to plot 
## the raw data first. The following is a scatter plot of the raw data.

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

## Create vector with batch indicator
bat = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
        2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,
        4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
        5,6,6,6,6,6,6,6)

## Save data in a data frame and determine number of observations
Batch <- as.factor(bat)
df <- data.frame(fdef,ldef,Batch)
len <- length(Batch)

##  Plot the data
par(ask=T,cex=1.25)
xax = "Lab Defect Size"
yax = "Field Defect Size"
title = "Alaska Pipeline Ultrasonic Calibration Data"
plot(ldef,fdef,xlab=xax,ylab=yax,main=title,col="blue")

## This scatter plot shows that a straight line fit is a good 
## initial candidate model for these data.

######################################################################
##
## LEFT SIDE BAR:  Plot by Batch

## These data were collected in six distinct batches. The first step 
## in the analysis is to determine if there is a batch effect.

## In this case, the scientist was not inherently interested in the 
## batch. That is, batch is a nuisance factor and, if reasonable, we 
## would like to analyze the data as if it came from a single batch. 
## However, we need to know that this is, in fact, a reasonable 
## assumption to make. 

######################################################################
##
## LEFT SIDE BAR:  Conditional Plot

## We first generate a <conditional plot 1.3.3.26.12.> where we 
## condition on the batch.

## Generate conditional plot
library("lattice")
par(ask=T)
trellis.device(new = TRUE, col = FALSE)
FIG = xyplot(fdef ~ ldef | Batch, data=df,
      main = title,
      layout=c(3,2),
      col=4,
      xlab=list(xax,cex=1.1),
      ylab=list(yax,cex=1.1),
      strip=function(...)
      strip.default(...,strip.names=c(T,T)))
plot(FIG)

## This conditional plot shows a scatter plot for each of the six 
## batches on a single page. Each of these plots shows a similar pattern.

######################################################################
##
## LEFT SIDE BAR:  Linear Correlation and Related Plots

## We can follow up the conditional plot with a <linear correlation 
## plot 1.3.3.16>, a <linear intercept plot 1.3.3.17>, a <linear slope 
## plot 1.3.3.18>, and a <linear residual standard deviation plot 1.3.3.19>. 
## These four plots show the correlation, the intercept and slope from a 
## linear fit, and the residual standard deviation for linear fits applied 
## to each batch.  These plots show how a linear fit performs across the 
## six batches.

##  Batch analysis
x = ldef
y = fdef
xydf = data.frame(x,y,Batch)
out = by(xydf,xydf$Batch,function(x) lm(y~x,data=x))
lapply(out,summary)

##> $"1"

##> Call:
##> lm(formula = y ~ x, data = x)

##> Residuals:
##>     Min      1Q  Median      3Q     Max 
##> -8.7219 -4.9844 -0.4439  3.4162 11.6738 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  7.15730    2.97737   2.404   0.0279 *  
##> x            0.63269    0.06392   9.898 1.80e-08 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 6.526 on 17 degrees of freedom
##> Multiple R-Squared: 0.8521,     Adjusted R-squared: 0.8434 
##> F-statistic: 97.98 on 1 and 17 DF,  p-value: 1.798e-08 


##> $"2"

##> Call:
##> lm(formula = y ~ x, data = x)

##> Residuals:
##>      Min       1Q   Median       3Q      Max 
##> -9.09547 -5.49791  0.02057  2.75029 11.25706 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  7.51458    2.81007   2.674   0.0155 *  
##> x            0.63759    0.05828  10.941  2.2e-09 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 6.382 on 18 degrees of freedom
##> Multiple R-Squared: 0.8693,     Adjusted R-squared: 0.862 
##> F-statistic: 119.7 on 1 and 18 DF,  p-value: 2.200e-09 


##> $"3"

##> Call:
##> lm(formula = y ~ x, data = x)

##> Residuals:
##>     Min      1Q  Median      3Q     Max 
##> -11.370  -2.390   1.396   2.488  16.250 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  2.20247    2.82865   0.779    0.446    
##> x            0.83185    0.05901  14.096 3.63e-11 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 6.61 on 18 degrees of freedom
##> Multiple R-Squared: 0.9169,     Adjusted R-squared: 0.9123 
##> F-statistic: 198.7 on 1 and 18 DF,  p-value: 3.629e-11 


##> $"4"

##> Call:
##> lm(formula = y ~ x, data = x)

##> Residuals:
##>    Min     1Q Median     3Q    Max 
##> -9.932 -2.775 -0.374  2.889  7.930 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  3.18655    1.88338   1.692    0.108    
##> x            0.77022    0.03938  19.560 1.41e-13 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 4.381 on 18 degrees of freedom
##> Multiple R-Squared: 0.9551,     Adjusted R-squared: 0.9526 
##> F-statistic: 382.6 on 1 and 18 DF,  p-value: 1.414e-13 


##> $"5"

##> Call:
##> lm(formula = y ~ x, data = x)

##> Residuals:
##>      Min       1Q   Median       3Q      Max 
##> -18.5261  -2.7865   0.8096   3.4953   8.7293 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  4.86365    2.33614   2.082   0.0511 .  
##> x            0.75791    0.05724  13.241 4.83e-11 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 5.829 on 19 degrees of freedom
##> Multiple R-Squared: 0.9022,     Adjusted R-squared: 0.8971 
##> F-statistic: 175.3 on 1 and 19 DF,  p-value: 4.834e-11 


##> $"6"

##> Call:
##> lm(formula = y ~ x, data = x)

##> Residuals:
##>     101     102     103     104     105     106     107 
##>  0.7125 -0.2117 -1.9221  1.3451  1.0155  0.4188 -1.3581 

##> Coefficients:
##>             Estimate Std. Error t value Pr(>|t|)    
##> (Intercept)  3.22600    1.01547   3.177   0.0246 *  
##> x            0.88025    0.02621  33.584  4.4e-07 ***
##> ---
##> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

##> Residual standard error: 1.35 on 5 degrees of freedom
##> Multiple R-Squared: 0.9956,     Adjusted R-squared: 0.9947 
##> F-statistic:  1128 on 1 and 5 DF,  p-value: 4.401e-07 


## Save batch regression results 
outs = sapply(out,summary)
outc = sapply(out,coef)
fitse = t(outs[6,])
fitse = c(fitse[[1]],fitse[[2]],fitse[[3]],fitse[[4]],fitse[[5]],fitse[[6]])
r2 = t(outs[8,])
r2 = c(r2[[1]],r2[[2]],r2[[3]],r2[[4]],r2[[5]],r2[[6]])
b0 = t(outc[1,])
b1 = t(outc[2,])

##  Batch plots
par(mfrow=c(2,2),ask=T)
id = c(1:length(b0))
xax2 = "Batch Number"
plot(id,r2,xlab=xax2,ylab="Correlation",ylim=c(.8,1),
     col="blue",pch=16,cex=1.25)
abline(h=mean(r2))
plot(id,b0[1,],xlab=xax2,ylab="Intercept",ylim=c(0,8),
     col="blue",pch=16,cex=1.25)
abline(h=mean(b0))
plot(id,b1[1,],xlab=xax2,ylab="Slope",ylim=c(.5,.9),
     col="blue",pch=16,cex=1.25)
abline(h=mean(b1))
plot(id,fitse,xlab=xax2,ylab="RESSD",ylim=c(0,7),
     col="blue",pch=16,cex=1.25)
abline(h=mean(fitse))

## We can follow up the conditional plot with a linear correlation 
## plot, a linear intercept plot, a linear slope plot, and a linear 
## residual standard deviation plot. These four plots show the 
## correlation, the intercept and slope from a linear fit, and the 
## residual standard deviation for linear fits applied to each batch. 
## These plots show how a linear fit performs across the six batches.

######################################################################
##
## LEFT SIDE BAR:  Treat BATCH as Homogeneous

## These summary plots, in conjunction with the conditional plot 
## above, show that treating the data as a single batch is a 
## reasonable assumption to make. None of the batches behaves 
## badly compared to the others and none of the batches requires 
## a significantly different fit from the others.

## These two plots provide a good pair. The plot of the fit 
## statistics allows quick and convenient comparisons of the overall 
## fits. However, the conditional plot can reveal details that may 
## be hidden in the summary plots. For example, we can more readily 
## determine the existence of clusters of points and outliers, 
## curvature in the data, and other similar features.

## Based on these plots we will ignore the BATCH variable for the 
## remaining analysis. 

######################################################################
## ================================================================ ##
######################################################################






