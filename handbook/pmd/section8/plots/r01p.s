attach("s+fnc")
postscript(file="r01p1.ps",hor=T)
par(pty="s",mfrow=c(1,2),mgp=c(2.5,0.75,0))
p1 <- 1
p2 <- 2
p <- c(p1,p2)

offset <- 0.05
x1 <- seq(-1.5,-1/p2-offset,length=100)
x2 <- seq(-1/p2+offset,1.5,length=100)

plot(c(x1,x2),c(r01(x1,p),r01(x2,p)),type="n",ylab="y",xlab="x")
title("y = 1/(1 + 2x)")
lines(x1,r01(x1,p))
lines(x2,r01(x2,p))
abline(h=0,lty=8)
abline(v=-1/p2,lty=8)

p1 <- 7
p2 <- -0.03
p <- c(p1,p2)

offset <- 0.05
x1 <- seq(32,-1/p2-offset,length=100)
x2 <- seq(-1/p2+offset,35,length=100)

plot(c(x1,x2),c(r01(x1,p),r01(x2,p)),type="n",ylab="y",xlab="x")
title("y = 7/(1 - 0.03x)")
lines(x1,r01(x1,p))
lines(x2,r01(x2,p))
abline(h=0,lty=8)
abline(v=-1/p2,lty=8)
dev.off()

postscript(file="r01p2.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 10
p2 <- -7 
p <- c(p1,p2)
x <- seq(-30,-5,length=100)

plot(x,r01(x,p),type="l",ylab="y",xlab="x")
title("y = 1/(10 - 7*x)")
dev.off()

postscript(file="r01p3.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 0.2
p2 <- 3 
p <- c(p1,p2)
x <- seq(4,5,length=100)

plot(x,r01(x,p),type="l",ylab="y",xlab="x")
title("y = 1/(0.2 + 3*x)")
dev.off()

postscript(file="r01p4.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- -50
p2 <- -3
p <- c(p1,p2)
x <- seq(0.45,1.1,length=100)

plot(x,r01(x,p),type="l",ylab="y",xlab="x")
title("y = 1/(-50 - 3*x)")
dev.off()

postscript(file="r01p5.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- -400
p2 <- 0.04
p <- c(p1,p2)
x <- seq(0,30,length=100)

plot(x,r01(x,p),type="l",ylab="y",xlab="x")
title("y = 1/(-400 + 0.04*x)")
dev.off()
