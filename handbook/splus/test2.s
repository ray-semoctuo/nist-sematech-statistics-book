#
# Starting Load Cell Calibration Case Study
#
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
