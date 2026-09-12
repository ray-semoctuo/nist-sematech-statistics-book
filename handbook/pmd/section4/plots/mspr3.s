if(search()[1]!="pr1.dat") attach(pr1.dat,pos=1)
utmp <- unique(tmp)
l.utmp <- length(utmp)
m1 <- 1:l.utmp
tau <- 1:l.utmp
beta <- 1:l.utmp
m0 <- 1:l.utmp
tf <- seq(0,120,length=100)
postscript(file="mspr3.ps",hor=F)
par(mfrow=c(3,2),mgp=c(2.25,0.75,0),lwd=2,pch=16)
for(i in 1:l.utmp)
{
itmp <- tmp==utmp[i]
nlf <- nls(y[itmp]~m1*exp(-(t[itmp]/tau)^beta)+m0,
           start=list(m1=3,tau=3+0.01*utmp[i]+0.015*utmp[i]^2,beta=1.2,m0=5))
plot(t[tmp==utmp[i]],y[tmp==utmp[i]],
       ylim=c(5,8),xlab="Time, minutes",ylab="Torque",csi=0.2,mkh=0.05)
m1 <- nlf$par[1]
tau <- nlf$par[2]
beta <- nlf$par[3]
m0 <- nlf$par[4]
pred <- m1*exp(-(tf/tau)^beta)+m0
lines(tf,pred)
text(90,7.75,paste("Temperature =",utmp[i]),csi=0.2)
}
dev.off()
