pontius.dat <- read.table("pontius.dat",header=T)\n>
attach(pontius.dat,pos=1)\n>
cbind(Load,Deflection)\n>
plot(Load,Deflection,xlab="Load",ylab="Deflection",pch="x")\n>
lf <- lm(Deflection~Load)\n>
lfs <- summary(lf)\n>
lfs\n>
lines(Load[order(Load)],predict(lf,data.frame(Load=Load[order(Load)])))\n>
title(cex=0.667,"Data & Predicted Values from Straight Line Fit vs. Load")\n>
