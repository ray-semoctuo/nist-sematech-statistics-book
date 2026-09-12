######################################################################
##
## Bayesian method-8.1.7.1.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Jul 09
## HANDBOOK:     8.1.7.1. Homogeneus Poisson Process (HPP)
## http://www.itl.nist.gov/div898/handbook/apr/section1/apr171.htm

######################################################################
##
## LEFT SIDE BAR: Poisson relationship and R function

## Note that in the HPP model, the probability of having exactly k failures
## by time T is given by the Poisson distribution with mean lambda*T
## (see formula for P(N(T) = k) above). This can be evaluated by
## the R expression:

## (1) Evaluate the Poisson PDF, having mean equal to lambda*T, at k
dpois(k, lambda*T)

######################################################################
## ================================================================ ##
######################################################################