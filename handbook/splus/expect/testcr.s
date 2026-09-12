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
pontius.dat <- read.table("pontius.dat",header=T)\n
attach(pontius.dat,pos=1)\n
cbind(Load,Deflection)\n
#\n
# Starting Step 2.2\n
lf <- lm(Deflection~Load)\n
lfs <- summary(lf)\n
lfs\n
# Finished Step 2.2: Page Back for Output\n
# Finished Step 1.1\n
#\n
# Starting Step 2.3\n
plot(Load,Deflection,xlab="Load",ylab="Deflection",pch="x")\n
lines(Load[order(Load)],predict(lf,data.frame(Load=Load[order(Load)])))\n
title(cex=0.667,"Data & Predicted Values from Straight Line Fit vs. Load")\n
# Finished Step 2.3: Page Back for Output\n
