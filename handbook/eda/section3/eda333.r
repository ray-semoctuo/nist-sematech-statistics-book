R commands and output for 1.4.2.10.3:

## Read data.
m <- matrix(scan("jahanmi2.dat",skip=50),ncol=16,byrow=T)
y = m[,5]
x1 = m[,6]
x2 = m[,7]
x3 = m[,8]
x4 = m[,9]
lab = m[,2]
batch = m[,14]

## Generate bihistogram.
library(Hmisc)
histbackback(split(y,batch),ylab="Strength of Ceramic",
             brks=seq(300,900,by=25))

## Generate a quantile-quantile plot for the two batches.
df = data.frame(y,batch)
y1 = df[batch==1,1]
y2 = df[batch==2,1]
qqplot(y2,y1)
abline(0,1)
title(sub="Quantile-Quantile Plot Y1 Y2")
boxplot(y~batch,ylab="Ceramic Strength",xlab="Batch")
title("Box Plot by Batch")

## Save variables as factors.
fx1 = factor(x1)
fx2 = factor(x2)
fx3 = factor(x3)
flab = factor(lab)
fbatch = factor(batch)
df = data.frame(y,fbatch,flab,fx1,fx2,fx3)

## Generate four plots on one page.
par(mfrow=c(2,2))

## Compute the batch means for each laboratory.
avg = aggregate(x=df$y, by=list(df$flab,df$fbatch), FUN="mean")

## Generate the block plot.
boxplot(avg$x ~ avg$Group.1, medlty="blank",
        ylab="Ceramic Strength",xlab="Laboratory",
        main="Batch Means for Each Laboratory")

## Add labels for the batch means.
text(avg$Group.1[avg$Group.2==1], avg$x[avg$Group.2==1],
     labels=avg$Group.2[avg$Group.2==1], pos=1)
text(avg$Group.1[avg$Group.2==2], avg$x[avg$Group.2==2],
     labels=avg$Group.2[avg$Group.2==2], pos=3)

## Generate the block plot for the first factor.
## Create new variable that indicates batch*x1.
## The new variable is necessary to preserve the order
## of the blocks within laboratory.
newx1 = x1/5
lx1 = factor(lab + newx1)
df = data.frame(y,fbatch,lx1)

## Compute the batch means for each laboratory and level of x1.
avg = aggregate(x=df$y, by=list(df$fbatch,df$lx1), FUN="mean")

## Specify locations of the bars on the x axis.
xpos = c(1,5,8,10,13:14,16:17,19:20,22:23)
boxplot(avg$x ~ avg$Group.2, medlty="blank", xlim=c(1,24),
        ylab="Ceramic Strength",xlab="Laboratory and x1",
        at=xpos,xaxt="n",main="Batch Means:  Lab and x1")
axis(side=1,at=c(1.5,4.5,7.5,10.5,13.5,16.5,19.5,22.5),
     labels=c("1","2","3","4","5","6","7","8"))

## Add labels for the batch means.
text(xpos,avg$x[avg$Group.1==1],
     labels=avg$Group.1[avg$Group.1==1], pos=1)
text(xpos,avg$x[avg$Group.1==2],
     labels=avg$Group.1[avg$Group.1==2], pos=3)

## Generate the block plot for the second factor.
## Create new variable that indicates batch*x2.
newx2 = x2/5
lx2 = factor(lab + newx2)
df = data.frame(y,fbatch,lx2)

## Compute the batch means for each laboratory and level of x2.
avg = aggregate(x=df$y, by=list(df$fbatch,df$lx2), FUN="mean")

## Specify locations of the bars on the x axis.
xpos = c(1:2,4:5,7:8,10:11,13,17,20,22)
boxplot(avg$x ~ avg$Group.2, medlty="blank", xlim=c(1,24),
        ylab="Ceramic Strength",xlab="Laboratory and x2",
        at=xpos ,xaxt="n",main="Batch Means:  Lab and x2")
axis(side=1,at=c(1.5,4.5,7.5,10.5,13.5,16.5,19.5,22.5),
     labels=c("1","2","3","4","5","6","7","8"))

## Add labels for the batch means.
text(xpos, avg$x[avg$Group.1==1],
     labels=avg$Group.1[avg$Group.1==1], pos=1)
text(xpos, avg$x[avg$Group.1==2],
     labels=avg$Group.1[avg$Group.1==2], pos=3)

## Generate the block plot for the third factor.
## Create new variable that indicates batch*x3.
newx3 = x3/5
lx3 = factor(lab + newx3)
df = data.frame(y,fbatch,lx3)

## Compute the batch means for each laboratory and level of x3.
avg = aggregate(x=df$y, by=list(df$fbatch,df$lx3), FUN="mean")

## Specify locations of the bars on the x axis.
xpos = c(1:2,4:5,7:8,10:11,13:14,16:17,19:20,22:23)
boxplot(avg$x ~ avg$Group.2, medlty="blank", xlim=c(1,24),
        ylab="Ceramic Strength",xlab="Laboratory and x3",
        at=xpos ,xaxt="n",main="Batch Means:  Lab and x3")
axis(side=1,at=c(1.5,4.5,7.5,10.5,13.5,16.5,19.5,22.5),
     labels=c("1","2","3","4","5","6","7","8"))

## Add labels for the batch means.
text(xpos, avg$x[avg$Group.1==1],
     labels=avg$Group.1[avg$Group.1==1], pos=1)
text(xpos, avg$x[avg$Group.1==2],
     labels=avg$Group.1[avg$Group.1==2], pos=3)

## Perform an F-test to compare two variances.
var.test(y~batch)

>         F test to compare two variances

> data:  y by batch 
> F = 1.123, num df = 239, denom df = 239, p-value = 0.3704
> alternative hypothesis: true ratio of variances is not equal to 1 
> 95 percent confidence interval:
>  0.8709874 1.4480271 
> sample estimates:
> ratio of variances 
          1.123038 

## Perform a two-sample T-test for the case where group variances
## are equal.
t.test(y~batch,var.equal=TRUE,alternative="greater")

>         Two Sample t-test

> data:  y by batch 
> t = 13.3806, df = 478, p-value < 2.2e-16
> alternative hypothesis: true difference in means is greater than 0 
> 95 percent confidence interval:
>  68.25501      Inf 
> sample estimates:
> mean in group 1 mean in group 2 
>        688.9986        611.1560 

## Compute pooled standard deviation. 
## (When sample sizes are equal, take the average of variances.)
s = aggregate(x=df$y, by=list(df$fbatch), FUN="sd")
sp2 = (s$x[1]^2 + s$x[2]^2)/2
sp = sqrt(sp2)
sp

> [1] 63.70167
