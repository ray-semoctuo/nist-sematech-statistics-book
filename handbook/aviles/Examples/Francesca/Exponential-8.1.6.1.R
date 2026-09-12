######################################################################
##
## Exponential-8.1.6.1.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Sept 17
## HANDBOOK:     8.1.6.1. Exponential
## http://www.itl.nist.gov/div898/handbook/apr/section1/apr161.htm

######################################################################

## LEFT SIDE BAR: R functions for the Exponential model

## Title: R Functions for the Exponential

## The R commands dexp and pexp calculate the exponential PDF and CDF
## for the standardized case with lambda = 1. To evaluate the PDF and CDF
## at 100 hours for an exponential with lambda = .01, the commands would be

dexp(100,0.01)
pexp(100,0.01)

## and the response would be .003679 for the pdf and .63212 for the cdf.

## R can do a probability plot of exponential data, normalized so that a
## perfect exponential fit is a diagonal line with slope 1.
## The SMPracticals package is required for drawing the plot.
## The following commands generate 100 random exponential observations
## (lambda = .01) and generate the probability plot that follows.

Y = rexp(100,0.01)
require(SMPracticals)
qqexp(Y,line = TRUE, main = "EXPONENTIAL PROBABILITY PLOT Y")

######################################################################

## LEFT SIDE BAR: R Exponential probability plot                                NOTE: Insert the new plot

######################################################################
## ================================================================ ##
######################################################################