######################################################################
##
## Lifetime distribution models-8.1.2.1.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Sept 17
## HANDBOOK:     8.1.2.1. Repairable systems, non-repairable populations and lifetime distribution models
## http://www.itl.nist.gov/div898/handbook/apr/section1/apr121.htm

######################################################################

## LEFT SIDE BAR: R Weibull CDF commands

## Solution: The R commands for the Weibull are:

Y = pweibull(800*5, 1.5, 8000)

## and R computes Y to be .298 or about 30% of the pumps will fail in the first
## 5 years.

######################################################################
## ================================================================ ##
######################################################################
