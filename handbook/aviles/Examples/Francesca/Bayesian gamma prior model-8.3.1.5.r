######################################################################
##
## Bayesian gamma prior model-8.3.1.5
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Jul 10
## HANDBOOK:     8.3.1.5 Bayesian gamma prior model
## http://www.itl.nist.gov/div898/handbook/apr/section3/apr315.htm

######################################################################
##
## LEFT SIDE BAR: How to plan a Bayesian test to confirm a system meets
## its MTBF objective

## [...] by trial and and error. However, based on the properties
## of the gamma distribution, it turns out that we can calculate T
## directly by using
## T = M × G^(-1)(1-alpha; a', 1) - b    ## MY PROPOSE OF CHANGE


######################################################################
##
## SIDE BAR: R will easily do the required calculations

## TITLE: Solving For T = Bayesian Test Time Using R

## The R expression for the required Bayesian test time to confirm
## a goal of M at 100×(1-alpha)% confidence, allowing r failures and
## assuming gamma prior parameters of a and b is
## M*qgamma(1-alpha,a+r,1) - b            ## MY PROPOSE OF CHANGE


######################################################################
##
## SIDE BAR: R example

## TITLE: Example: Calculating a Bayesian Test Time

## (2) Set the desired M, the gamma prior parameters a and b,
##  the 100×(1-alpha)% confidence level and the number r of allowed failures
M = 500
a = 2.863
b = 1522.49
alpha = 0.20
r = 2

## [...] Using R, type the expression
M*qgamma(1-alpha,a+r,1) - b


######################################################################
## ================================================================ ##
######################################################################