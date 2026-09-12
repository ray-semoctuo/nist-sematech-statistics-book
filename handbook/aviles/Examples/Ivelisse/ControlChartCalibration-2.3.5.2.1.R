###############################################################################
##
##  ControlChartCalibration-2.3.5.2.1.R
##
##  AUTHOR:       Ivelisse Aviles
##  MODIFICATION: 2006 Dec 26
##  HANDBOOK:     2.3.5.2.1. Example of Shewhart control chart for mass calibrations
##  http://www.itl.nist.gov/div898/handbook/mpc/section3/mpc3521.htm

###############################################################################
##
## LEFT SIDE BAR:  Example of a control chart for mass calibrations at the 
## kilogram level 

## Mass calibrations usually start with the comparison of four kilogram 
## standards using a high precision balance as a comparator. Many of the 
## measurements at the kilogram level that were made at NIST between 1975 
## and 1990 were made on balance #12 using a 1,1,1,1 calibration design. 
## The restraint for this design is the known average of two kilogram reference 
## standards. The redundancy in the calibration design produces individual 
## estimates for the two test kilograms and the two reference standards. 

## LEFT SIDE BAR:  Check standard 

## There is no slot in the 1,1,1,1 design for an artifact check standard when 
## the first two kilograms are reference standards; the third kilogram is a test 
## weight; and the fourth is a summation of smaller weights that act as the 
## restraint in the next series. Therefore, the check standard is a computed 
## difference between the values of the two reference standards as estimated 
## from the design. The convention with mass calibrations is to report the 
## correction to nominal, in this case the correction to 1000 g, as shown in 
## the control charts below. 

## LEFT SIDE BAR:  Need for monitoring  

## The kilogram check standard is monitored to check for: 
## 1.  Long-term degradation in the calibration process 
## 2.  Anomalous behavior at specific times 

## LEFT SIDE BAR:  Monitoring technique for check standard values 

## Check standard values over time and many calibrations are tracked and 
## monitored using a Shewhart control chart. The database and control limits 
## are updated when needed and check standard values for each calibration run 
## in the next cycle are compared with the control limits. In this case, the 
## values from 117 calibrations between 1975 and 1985 were averaged to obtain 
## a baseline and process standard deviation with v = 116 degrees of freedom. 
## Control limits are computed with a factor of k = 3 to identify truly 
## anomalous data points. 

## LEFT SIDE BAR:  Run the software macro for creating the Shewhart control chart

## LEFT SIDE BAR:  Control chart of measurements of kilogram check standard 
## showing a change in the process after 1985   

## R creates the control chart as follows:

## (1) Data input 
## (R-function read.table("data.file.location.and.name") reads a file in table 
## format and creates a data frame from it, with cases corresponding to lines 
## and variables to fields in the file.)
mass<-read.table("C:/mass.txt")
names(mass)<-c("Date","Check Stand ID","Check Stand Value","Balance ID",
"Residual StDev", "Design ID")

## (2) Control limits
## For more information on calculations, please refer to Section 2.3.5.2. 
baselinemass<-subset(mass,Date<=85)  ## Calibrations between 1975 and the end of 1984
meanValue<-mean(baselinemass[,3])
stdevValue<-sd(baselinemass[,3])
UCL<-meanValue+3*stdevValue
LCL<-meanValue-3*stdevValue  

## (3) Control Chart
yr=c(min(LCL,min(mass[,3]))-.05,max(UCL,max(mass[,3]))+.05) ## vertical-axis' range
xr=c(floor(min(mass[,1])),ceiling(max(mass[,1]))) ## horizontal-axis' range  
plot(xr,yr,xlab="Time in years",ylab="Corrections (mg)",
main="Shewhart control chart for kilogram calibrations",type="n")
abline(UCL,0,col="blue")
abline(meanValue,0)
abline(LCL,0,col="blue")
text(78,UCL+.005,"UCL = mean + 3s = -19.39 mg")   
text(78,LCL-.005,"LCL = mean - 3s = -19.57 mg")  
points(mass[,1],mass[,3])

## LEFT SIDE BAR:  Interpretation of the control chart 

## The control chart shows only two violations of the control limits. For those 
## occasions, the calibrations were discarded and repeated. The configuration 
## of points is unacceptable if many points are close to a control limit and 
## there is an unequal distribution of data points on the two sides of the 
## control chart -- indicating a change in either: 
##
## process average which may be related to a change in the reference standards 
## or
## variability which may be caused by a change in the instrument precision or 
## may be the result of other factors on the measurement process. 

## LEFT SIDE BAR:  Small changes only become obvious over time 

## Unfortunately, it takes time for the patterns in the data to emerge because 
## individual violations of the control limits do not necessarily point to a 
## permanent shift in the process. The Shewhart control chart is not powerful 
## for detecting small changes, say of the order of at most one standard 
## deviation, which appears to be approximately the case in this application. 
## This level of change might seem insignificant, but the calculation of 
## uncertainties for the calibration process depends on the control limits. 

## LEFT SIDE BAR:  Re-establishing the limits based on recent data and EWMA option 

## If the limits for the control chart are re-calculated based on the data after 
## 1985, the extent of the change is obvious. Because the exponentially weighted 
## moving average (EWMA) control chart is capable of detecting small changes, it 
## may be a better choice for a high precision process that is producing many 
## control values. 

## LEFT SIDE BAR:  Run continuation of software macro for updating Shewhart 
## control chart     
                                                                                      
## LEFT SIDE BAR:  Revised control chart based on check standard measurements 
## after 1985         
                                                                                                                         
## R updates the control chart as follows:    

## (1) Re-calculating the limits based on data after 1985                                                              
recentmass<-subset(mass,Date>85)  ## Available data since 1985                                                   
meanValue2<-mean(recentmass[,3])                                                                                                                                           
stdevValue2<-sd(recentmass[,3])                                                      
UCL2<-meanValue2+3*stdevValue2                                                           
LCL2<-meanValue2-3*stdevValue2                                                           
                                                                                      
## (3) Control Chart                                                                  
yr=c(min(LCL,min(mass[,3]))-.05,max(UCL,max(mass[,3]))+.05) ## vertical-axis' range   
xr=c(floor(min(mass[,1])),ceiling(max(mass[,1]))) ## horizontal-axis' range           
plot(xr,yr,xlab="Time in years",ylab="Corrections (mg)",                              
main="Shewhart control chart for kilogram calibrations",type="n")                     
lines(c(baselinemass[,1]), c(rep(UCL,length(baselinemass[,1]))),col="blue")                                                      
lines(c(baselinemass[,1]), c(rep(meanValue,length(baselinemass[,1]))))                                                                     
lines(c(baselinemass[,1]), c(rep(LCL,length(baselinemass[,1]))),col="blue") 
lines(c(recentmass[,1]), c(rep(UCL2,length(recentmass[,1]))),col="green") 
lines(c(recentmass[,1]), c(rep(meanValue2,length(recentmass[,1]))))                                                       
lines(c(recentmass[,1]), c(rep(LCL2,length(recentmass[,1]))),col="green") 
text(87,UCL2+.005,"UCL = -19.35 mg")                                       
text(87,LCL2-.005,"LCL = -19.56 mg")                                       
points(mass[,1],mass[,3])   
points(recentmass[,1],recentmass[,3],pch=21,bg="green")

###############################################################################
## ========================================================================= ##
###############################################################################







