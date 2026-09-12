######################################################################
##
## Bayesian method-8.2.5.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Jul 06
## HANDBOOK:     8.2.5. Bayesian methods are used for reliability evaluation?
## http://www.itl.nist.gov/div898/handbook/apr/section2/apr25.htm

######################################################################
##
## LEFT SIDE BAR: R can easily solve for gamma prior parameters when using
## the "50/95" consensus method

## TITLE: Using R To Obtain Gamma Parameters

##
##
##
##


######################################################################
##
## SIDE BAR: An R example using the "50/95" consensus method

## TITLE: Example

## A group of engineers, discussing the reliability of a new piece of
## equipment, decide to use the 50/95 method to convert their knowledge into a
## Bayesian gamma prior. Consensus is reached on a likely MTBF50 value of 600
## hours and a low MTBF05 value of 250. RT is 600/250 = 2.4.

## (1) Set the reasonable MTBF and the low MTBF and their ratio RT
MTBF50 = 600
MTBF05 = 250
RT = MTBF50/MTBF05

## (2) Find gamma prior parameter a such as the ratio
## qgamma(0.95,a,1)/qgamma(0.5,a,1) equals the ratio RT
estimating_a = function(a)
{
 return(qgamma(0.95,a,1)/qgamma(0.5,a,1)-RT)
}
A = uniroot(estimating_a, c(0.001,500), tol = .Machine$double.eps)
a = A[1]$root

## (3) Find gamma prior parameter b
b = 0.5*MTBF50*qgamma(0.5,a,1/2)


######################################################################
## ================================================================ ##
######################################################################
