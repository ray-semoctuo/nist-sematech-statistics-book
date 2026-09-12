#
# Starting Load Cell Calibration Case Study
#
# Setting Splus Defaults
#while(sum(search()=="esihb.cs")) detach(what=1,save=F)
#esihb.cs <- data.frame()
#attach(esihb.cs,pos=1)
#split.screen(c(1,1),erase=T)
#par(par.default)
# Finished Setting Defaults
#
# Starting Step 1.1
pontius.dat <- read.table("pontius.dat",header=T)
attach(pontius.dat,pos=1)
cbind(Load,Deflection)
#
# Starting Step 2.2
lf <- lm(Deflection~Load)
lfs <- summary(lf)
lfs
# Finished Step 2.2: Page Back for Output
# Finished Step 1.1
#
# Starting Step 2.3
plot(Load,Deflection,xlab="Load",ylab="Deflection",pch="x")
lines(Load[order(Load)],predict(lf,data.frame(Load=Load[order(Load)])))
title(cex=0.667,"Data & Predicted Values from Straight Line Fit vs. Load")
# Finished Step 2.3: Page Back for Output
