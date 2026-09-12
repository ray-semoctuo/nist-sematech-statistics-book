#
#
#
pontius.dat <- read.table("pontius.dat",header=T)
attach(pontius.dat,pos=1)
cbind(Load,Deflection)
lf <- lm(Deflection~Load)
lfs <- summary(lf)
lfs
plot(Load,Deflection,xlab="Load",ylab="Deflection",pch="x")
lines(Load[order(Load)],predict(lf,data.frame(Load=Load[order(Load)])))
title(cex=0.667,"Data & Predicted Values from Straight Line Fit vs. Load")
