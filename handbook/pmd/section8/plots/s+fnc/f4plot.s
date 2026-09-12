function(x,vl = "",ttl = "")
{
#
# Function which produces a "Filliben" 4-plot.  The argument x is the vector
# of data to be plotted, vl is a variable label, and ttl is the title for the
# overall plot.
#
par(oma = c(0, 0, 2, 0), mfrow = c(2, 2), mgp = c(2.5, 0.5, 0))
plot(x, xlab = "Observation Number", ylab = vl)
abline(h = 0)
title(cex = 0.833, "\n Run Order Plot")
par(pty = "s")
vlp <- paste(vl, "Lag 1")
plot(tsmatrix(x, lag(x)), xlab = vl, ylab = vlp)
title(cex = 0.833, "\n Lag Plot")
par(pty = "")
hist(x, xlab = vl, ylab = "Frequency")
title(cex = 0.833, "\n Histogram")
par(pty = "s")
qqnorm(x, ylab = vl)
title(cex = 0.833, "\n Normal Probability Plot")
mtext(ttl, outer = T, cex = 1.35)
par(mfrow = c(1, 1), pty = "")
summary(x)
}
