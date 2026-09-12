set.seed(75)
#seed <- .Random.seed
l.ut <- 11
l.utmp <- 6
t <- rep(seq(0,120,length=l.ut),l.utmp)
tmp <- rep(seq(25,75,length=l.utmp),rep(l.ut,l.utmp))
yt <- 3*exp(-(t/(3+0.01*tmp+0.015*tmp^2))^1.2) + 5
y <- yt + rnorm(length(yt),sd=0.05)
utmp <- unique(tmp)
m1 <- 1:l.utmp
tau <- 1:l.utmp
beta <- 1:l.utmp
m0 <- 1:l.utmp
for(i in 1:l.utmp)
{
itmp <- tmp==utmp[i]
nlf <- nls(y[itmp]~m1*exp(-(t[itmp]/tau)^beta)+m0,
           start=list(m1=3,tau=3+0.01*utmp[i]+0.015*utmp[i]^2,beta=1.2,m0=5))
assign(paste("nlf",i,sep=""),nlf)
m1[i] <- nlf$par[1]
tau[i] <- nlf$par[2]
beta[i] <- nlf$par[3]
m0[i] <- nlf$par[4]
}
pr1.dat <- data.frame(t=t,tmp=tmp,yt=yt,y=y)
rm(l.ut,l.utmp,t,tmp,yt,y,utmp,tau,itmp,nlf1,nlf2,nlf3,nlf4,nlf5,nlf6)
