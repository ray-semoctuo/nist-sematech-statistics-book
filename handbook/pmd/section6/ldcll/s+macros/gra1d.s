#
# Starting Step 2.6
vl <- "Residuals"
par(mfrow=c(2, 2), mgp=c(2.5, 0.5, 0))
plot(lf$res, xlab="Observation Number", ylab=vl)
abline(h=0)
title(cex=0.667, "\n Run Order Plot")
#
par(pty="s")
vlp <- paste(vl, "Lag 1")
plot(tsmatrix(lf$res, lag(lf$res)), xlab=vl, ylab=vlp)
title(cex=0.667, "\n Lag Plot")
#
par(pty="")
hist(lf$res, xlab=vl, ylab="Frequency")
title(cex=0.667, "\n Histogram")
#
par(pty="s")
qqnorm(lf$res, ylab=vl)
title(cex=0.667, "\n Normal Probability Plot")
#
# Finished Step 2.6
