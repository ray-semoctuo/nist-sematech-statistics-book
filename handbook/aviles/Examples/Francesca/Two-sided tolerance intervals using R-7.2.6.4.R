######################################################################
##
## Two-sided tolerance intervals using R-7.2.6.4.R                              ## OSS: But, after introducing function "tol.lim.fac" of package "spc" (see file
##                                                                              ## "Tolerance intervals for a normal distribution-7.2.6.3.R"), would whole this section
## AUTHOR:       Francesca Pennecchi                                            ## be still so important? Actually, it was born to give indication for the calculation
## MODIFICATION: 2007 Sept 13                                                   ## of the k factor in EXCEL, hence it may not be appropriate anymore.
## HANDBOOK:     7.2.6.4. Two-sided tolerance intervals using EXCEL
## http://www.itl.nist.gov/div898/handbook/prc/section2/prc264.htm

######################################################################

## TITLE: Two-sided tolerance intervals using R

## LEFT SIDE BAR: Two-sided tolerance intervals using R

## One method for computing factors for two-sided tolerance intervals
## using R makes use of the definition...

## LEFT SIDE BAR: R function

## The value r has to be found from the integral above which defines
## limits within which p percent of the normal distribution lies.
## An R calculation is illustrated below for the same problem as
## on the previous page except where N= 220 measurements are made of thickness.
## We wish to find tolerance intervals that contain a proportion p = 0.90
## of the wafers with probability  = 0.99.
## The R commands for this calculation are shown below. The calculations are
## approximate and depend on the tolerance of zero-finding uniroot function.
## Calculations should be correct to three signficant digits.

## LEFT SIDE BAR: Basic definition of r in EXCEL ### DELETE ###

## LEFT SIDE BAR: Basic definition of r in EXCEL ### DELETE ###

## (1) Set the parameter values:
N = 220
p = 0.90
g = 0.99

## (2) Estimate r such that (pnorm(1/sqrt(N)+r) - pnorm(1/sqrt(N)-r)) equals p=0.90
estimating_r = function(r)
{
 return(p - (pnorm(1/sqrt(N)+r) - pnorm(1/sqrt(N)-r)))
}
R = uniroot(estimating_r, c(-100,100))
r = A[1]$root

## LEFT SIDE BAR: Calculation in R of k factor
## Now calculate the k factor from the equation above.

## (3) Calculate the k factor
k = r*sqrt((N-1)/(qchisq(1-g,N-1)))

## LEFT SIDE BAR: Calculation in Dataplot  ### DELETE ###