###############################################################################
##
##  ControlChartPrecision-2.3.5.1.1.R
##
##  AUTHOR:       Ivelisse Aviles
##  MODIFICATION: 2006 Dec 19
##  HANDBOOK:     2.3.5.1.1. Example of control chart for precision
##  http://www.itl.nist.gov/div898/handbook/mpc/section3/mpc3511.htm

###############################################################################
##
## LEFT SIDE BAR:  Example of a control chart for precision of a mass balance

## Mass calibrations usually start with the comparison of kilograms standards
## using a high precision balance as a comparator. Many of the measurements at
## the kilogram level that were made at NIST between 1975 and 1990 were made on
## balance #12 using a 1,1,1,1 calibration design. The redundancy in the
## calibration design produces estimates for the individual kilograms and a
## repeatability standard deviation with three degrees of freedom for each
## calibration run. These standard deviations estimate the precision of the
## balance.

## LEFT SIDE BAR:  Need for monitoring precision

## The precision of the balance is monitored to check for:
## 1.  Slow degradation in the balance
## 2.  Anomalous behavior at specific times

## LEFT SIDE BAR:  Monitoring technique for standard deviations

## The standard deviations over time and many calibrations are tracked and
## monitored using a control chart for standard deviations. The database and
## control limits are updated on a yearly or bi-yearly basis and standard
## deviations for each calibration run in the next cycle are compared with the
## control limits. In this case, the standard deviations from 117 calibrations
## between 1975 and 1985 were pooled to obtain a repeatability standard
## deviation with v = 3*117 = 351 degrees of freedom, and the control limits
## were computed at the 1% significance level.

## LEFT SIDE BAR:  Run the software macro for creating the control chart for
## balance #12

## LEFT SIDE BAR:  Control chart for precision

## R creates the control chart as follows

## (1) Data input 
## (R-function read.table("data.file.location.and.name") reads a file in table 
## format and creates a data frame from it, with cases corresponding to lines 
## and variables to fields in the file.)
mass<-read.table("C:/mass.txt")
names(mass)<-c("Date","Check Stand ID","Check Stand Value","Balance ID",
"Residual StDev", "Design ID")

## (2) Pooled repeatability standard deviation
## For more information on calculations, please refer to Section 2.3.5.1.
res.stdev<-mass[,5]    ## the 5th column of the dataset mass is the res stdev
prsd<-sqrt(sum(res.stdev^2)/length(res.stdev))

## (3) Upper Control Limit
UCL<-prsd*sqrt(qf(.99,3,351))

## (4) Control Chart
year<-mass[,1]    ## the 1st column of the dataset mass is the date by year
plot(year,res.stdev,xlab="TIME IN YEARS",ylab="STANDARD DEVIATIONS OF BALANCE 12",
main="Control Chart for Precision of Balance")
abline(UCL,0,col="green")
abline(prsd,0)
text(86,UCL+.002,"Control limit = 0.067 micrograms")
mtext("Standard deviations with 3 degrees of freedom plotted vs year",side=3,line=.5)
 






















## LEFT SIDE BAR:  Interpretation of the control chart

## The control chart shows that the precision of the balance remained in
## control through 1990 with only two violations of the control limits. For
## those occasions, the calibrations were discarded and repeated. Clearly, for
## the second violation, something significant occurred that invalidated the
## calibration results.

## LEFT SIDE BAR:  Further interpretation of the control chart

## However, it is also clear from the pattern of standard deviations over time
## that the precision of the balance was gradually degrading and more and more
## points were approaching the control limits. This finding led to a decision
## to replace this balance for high accuracy calibrations.

###############################################################################
## ========================================================================= ##
###############################################################################







