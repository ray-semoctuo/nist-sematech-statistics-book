######################################################################
##
## The Marascuillo procedure-7.4.7.4.R
##
## AUTHOR:       Francesca Pennecchi
## MODIFICATION: 2007 Sept 14
## HANDBOOK: 7.4.7.4. Comparing multiple proportions: The Marascuillo procedure
## http://www.itl.nist.gov/div898/handbook/prc/section4/prc474.htm

######################################################################
##
## LEFT SIDE BAR: Table of critical values

## Note: The values in this table were computed with the following R commands.

## (1) Set the proportions
p = c(0.120, 0.153, 0.140, 0.210, 0.127)
N = length(p)
value = critical.range = c()

for (i in 1:(N-1))
   { for (j in (i+1):N)
      {
        value = c(value,(abs(p[i]-p[j])))
        critical.range = c(critical.range,sqrt(qchisq(.95,4))*sqrt(p[i]*(1-p[i])/300 + p[j]*(1-p[j])/300))
      }
   }

round(cbind(value,critical.range),3)


