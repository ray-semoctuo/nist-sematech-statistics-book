######################################################################
##
## Weibull-8.1.6.2.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Sept 17
## HANDBOOK:     8.1.6.2. Weibull
## http://www.itl.nist.gov/div898/handbook/apr/section1/apr162.htm

######################################################################

## LEFT SIDE BAR: R functions for the Weibull

## Title: R Functions for the Weibull

## The following commands in R will evaluate the PDF and CDF of a Weibull
## at time T, with shape gamma and characteristic life alpha.
## dweibull(T, gamma, alpha)
## pweibull(T, gamma, alpha)
## For example, if T = 1000,  gamma = 1.5 and alpha = 5000, the above commands
## will produce a PDF of .000123 and a CDF of .08556.
## To generate Weibull random numbers from a Weibull with shape parameter 1.5
## and characteristic life 5000, use the following command:

sample = rweibull(100, 1.5, 5000)

## Next, to see how well these "random Weibull data points" are actually fit
## by a Weibull, we plot the points to check whether they
## line up following a straight line.
## The Weibull probability plot is not available directly in R. However,        ## REF: cran.r-project.org/doc/vignettes/Devore6/Devore6.pdf
## the plot can be created using the formula ln[-ln(1 - p)] for the percentiles
## The commands (following the last command above) are:

plot(log(-log(1 - (seq(1:length(sample) - 0.5))/length(sample))), log(sort(sample)),
xlab = "Theoretical Quantiles", ylab = "log(sample)", main = "Weibull Q-Q Plot")

## The resulting plot is shown below.

######################################################################

## LEFT SIDE BAR: R Weibull Probability Plot                                    ## NOTE: Insert the new plot

######################################################################
## ================================================================ ##
######################################################################