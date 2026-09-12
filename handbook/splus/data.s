#
# Starting Load Cell Calibration Case Study
#
# Setting Splus Defaults
while(sum(search()=="esihb.cs")) detach(what=1,save=F)
esihb.cs <- data.frame()
attach(esihb.cs,pos=1)
split.screen(c(1,1),erase=T)
par(par.default)
# Finished Setting Defaults
#
# Starting Step 1.1
pontius.dat <- read.table("pontius.dat",header=T)
attach(pontius.dat,pos=1)
cbind(Load,Deflection)
# Finished Step 1.1
