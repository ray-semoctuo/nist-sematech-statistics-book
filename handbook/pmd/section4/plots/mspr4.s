if(search()[1]!="pr1.dat") attach(pr1.dat,pos=1)
utmp <- unique(tmp)
l.utmp <- length(utmp)
beta1 <- 1:l.utmp
beta2 <- 1:l.utmp
beta3 <- 1:l.utmp
beta4 <- 1:l.utmp
tf <- seq(0,120,length=100)
for(i in 1:l.utmp)
{
itmp <- tmp==utmp[i]
nlf <- nls(y[itmp]~beta1+beta2*exp(-(t[itmp]/beta3)^beta4),
           start=list(beta1=5,beta2=3,beta3=3+0.01*utmp[i]+0.015*utmp[i]^2,beta4=1.2))
assign(paste("nlf",i,sep=""),nlf,where=1)
beta1[i] <- nlf$par[1]
beta2[i] <- nlf$par[2]
beta3[i] <- nlf$par[3]
beta4[i] <- nlf$par[4]
}
postscript(file="mspr4.ps",hor=T)
par(mfrow=c(2,2),mgp=c(1.75,0.5,0),lwd=2,pch=16,mar=c(3,3,1,1))
ll <- mean(beta1)-2.5*0.2
ul <- mean(beta1)+2.5*0.2
plot(utmp,beta1,xlab="Temperature",ylab="Values of Beta1",csi=0.2,mkh=0.05,ylim=c(ll,ul))
abline(h=mean(beta1),lty=1)
abline(h=c(ll,ul),lty=2)
ll <- mean(beta2)-2.5*0.2
ul <- mean(beta2)+2.5*0.2
plot(utmp,beta2,xlab="Temperature",ylab="Values of Beta2",csi=0.2,mkh=0.05,ylim=c(ll,ul))
abline(h=mean(beta2),lty=1)
abline(h=c(ll,ul),lty=2)
ll <- mean(beta3)-2.5*6
ul <- mean(beta3)+2.5*6
plot(utmp,beta3,xlab="Temperature",ylab="Values of Beta3",csi=0.2,mkh=0.05)
abline(h=mean(beta3),lty=1)
abline(h=c(ll,ul),lty=2)
ll <- mean(beta4)-2.5*0.1
ul <- mean(beta4)+2.5*0.1
plot(utmp,beta4,xlab="Temperature",ylab="Values of Beta4",csi=0.2,mkh=0.05,ylim=c(ll,ul))
abline(h=mean(beta4),lty=1)
abline(h=c(ll,ul),lty=2)
dev.off()
