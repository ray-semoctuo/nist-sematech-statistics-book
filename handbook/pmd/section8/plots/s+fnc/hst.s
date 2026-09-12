hst <- function(x,...)
{
#
# An alternate version of hist that uses bin widths based on the interquartile
# range and the sample size.  The argument x is the data to be plotted. 
# Additional named arguments to hist can be passed through this function.
#
iqr <- diff(quantile(x,c(0.25,0.75)))
bw <- (2*iqr)/(length(x)^(1/3))
bx <- (bw*(ceiling(diff(range(x))/bw)-(diff(range(x))/bw)))/2
bks <- seq(min(x)-bx,max(x)+bx,bw)
hist(x, breaks=bks,xlim=c(min(x)-bx,max(x)+bx),...)
}
