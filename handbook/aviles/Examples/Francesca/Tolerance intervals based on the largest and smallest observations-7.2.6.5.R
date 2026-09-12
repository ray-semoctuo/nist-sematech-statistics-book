######################################################################
##
## Tolerance intervals based on the largest and smallest observations-7.2.6.5.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Oct 30
## HANDBOOK:     7.2.6.5. Tolerance intervals based on the largest and smallest observations
## http://www.itl.nist.gov/div898/handbook/prc/section2/prc265.htm

######################################################################

## LEFT SIDE BAR: R calculations for distribution-free tolerance intervals

## The R commands for calculating confidence and coverage levels corresponding
## to a tolerance interval defined as the interval between the smallest and
## largest observations are given below. The commands that are invoked for
## twenty-five measurements of resistivity from a quality control study are
## the same as for producing tolerance intervals for a normal distribution;
## namely,

## (1) Set the parameters
N = 25
Coverage = c(0.5,0.75,0.9,0.95,0.975,0.99,0.995,0.999,0.9995,0.9999)

p = Coverage
g = 1 - N*p^(N-1) + (N-1)*p^N                                                   ## REF: David 2nd edition pag 18-19, Mood and Grable pag 416-417, Wilks Annals 1941 pag92
Confidence = g

## (3) Display the results
print('INVOLVING XMIN = 97.01400  AND  XMAX = 97.11400')
cbind(Confidence, Coverage)