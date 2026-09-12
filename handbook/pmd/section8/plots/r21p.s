attach("s+fnc")
postscript(file="r21p1.ps",hor=T)
par(pty="s",mfrow=c(1,2),mgp=c(2.5,0.75,0))
p1 <- 1
p2 <- 2
p3 <- -3
p4 <- -4
p <- c(p1,p2,p3,p4)

offset <- 0.05
x1 <- seq(-1.5,-1/p4-offset,length=100)
x2 <- seq(-1/p4+offset,1.5,length=100)

plot(c(x1,x2),c(r21(x1,p),r21(x2,p)),type="n",ylab="y",xlab="x")
title("y=(1+2x-3x^2)/(1-4x)")
lines(x1,r21(x1,p))
lines(x2,r21(x2,p))
abline(v=-1/p4,lty=8)

p1 <- 1
p2 <- 2
p3 <- 5
p4 <- 7
p <- c(p1,p2,p3,p4)

offset <- 0.05
x1 <- seq(-3,-1/p4-offset,length=100)
x2 <- seq(-1/p4+offset,4,length=100)

plot(c(x1,x2),c(r21(x1,p),r21(x2,p)),type="n",ylab="y",xlab="x")
title("y=(1+2x+5x^2)/(1+7x)")
lines(x1,r21(x1,p))
lines(x2,r21(x2,p))
abline(v=-1/p4,lty=8)
dev.off()

postscript(file="r21p2.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 1
p2 <- 2
p3 <- 5
p4 <- 7
p <- c(p1,p2,p3,p4)
x <- seq(-3,-1,length=100)

plot(x,r21(x,p),type="l",ylab="y",xlab="x")
title("y=(1+2x+5x^2)/(1+7x)")
dev.off()

postscript(file="r21p3.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 1
p2 <- 2
p3 <- -3
p4 <- -4
p <- c(p1,p2,p3,p4)
x <- seq(-0.25,0.15,length=100)

plot(x,r21(x,p),type="l",ylab="y",xlab="x")
title("y=(1+2x-3x^2)/(1-4x)")
dev.off()

postscript(file="r21p4.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- -1
p2 <- -2
p3 <- 3
p4 <- -4
p <- c(p1,p2,p3,p4)
x <- seq(0.25,1.25,length=100)

plot(x,r21(x,p),type="l",ylab="y",xlab="x")
title("y=(1-2x+3x^2)/(1-4x)")
dev.off()

postscript(file="r21p5.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 1
p2 <- 2
p3 <- 5
p4 <- 7
p <- c(p1,p2,p3,p4)
x <- seq(0,1,length=100)

plot(x,r21(x,p),type="l",ylab="y",xlab="x")
title("y=(1+2x+5x^2)/(1+7x)")
dev.off()
