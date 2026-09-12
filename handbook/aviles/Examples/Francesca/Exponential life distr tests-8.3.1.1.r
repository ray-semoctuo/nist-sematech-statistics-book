######################################################################
##
## Exponential life distr tests-8.3.1.1.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Jul 10
## HANDBOOK:     8.3.1.1.   Exponential life distribution (or HPP model) tests
## http://www.itl.nist.gov/div898/handbook/apr/section3/apr311.htm

######################################################################
##
## LEFT SIDE BAR: R expression for obtaining same factors as in Table

## [...] and an R expression to calculate test length factors is

## (1) Calculate a test length factor corresponding to a number r of
## failures allowed and a 100*(1-alpha) confidence level.
0.5*qchisq(1-alpha,2*(r+1))


######################################################################
## ================================================================ ##
######################################################################