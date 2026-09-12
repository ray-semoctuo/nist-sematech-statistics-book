#
# Starting Step 2.3
plot(Load,Deflection,xlab="Load",ylab="Deflection",pch="x")
lines(Load[order(Load)],predict(lf,data.frame(Load=Load[order(Load)])))
title(cex=0.667,"Data & Predicted Values from Straight Line Fit vs. Load")
# Finished Step 2.3
