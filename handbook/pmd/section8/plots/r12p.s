attach("s+fnc")
postscript(file="r12p1.ps",hor=T)
par(pty="s",mfrow=c(2,2),mgp=c(2.5,0.75,0))
p1 <- 1
p2 <- 2
p3 <- -(1/12)
p4 <- -(1/12)
p <- c(p1,p2,p3,p4)

offset <- 0.05
x1 <- seq(-10,-4-offset,length=100)
x2 <- seq(-4+offset,3-offset,length=100)
x3 <- seq(3+offset,10,length=100)

plot(c(x1,x2),c(r12(x1,p),r12(x2,p)),type="n",ylab="y",xlab="x")
title("y=(1+2x)/(1-(1/12)x-(1/12)x^2)")
lines(x1,r12(x1,p))
lines(x2,r12(x2,p))
lines(x3,r12(x3,p))
abline(v=-4,lty=8)
abline(v=3,lty=8)

p1 <- 1
p2 <- 2
p3 <- 2
p4 <- 1
p <- c(p1,p2,p3,p4)

offset <- 0.05
x1 <- seq(-10,-1-offset,length=100)
x2 <- seq(-1+offset,10,length=100)

plot(c(x1,x2),c(r12(x1,p),r12(x2,p)),type="n",ylab="y",xlab="x")
title("y=(1+2x)/(1+2x+x^2)")
lines(x1,r12(x1,p))
lines(x2,r12(x2,p))
abline(v=-1,lty=8)
dev.off()

postscript(file="r12p2.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 1
p2 <- 2
p3 <- 5
p4 <- 7
p <- c(p1,p2,p3,p4)
x <- seq(-3,-1,length=100)

plot(x,r12(x,p),type="l",ylab="y",xlab="x")
title("y=(1+2x+5x^2)/(1+7x)")
dev.off()

postscript(file="r12p3.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 1
p2 <- 2
p3 <- -3
p4 <- -4
p <- c(p1,p2,p3,p4)
x <- seq(-0.25,0.15,length=100)

plot(x,r12(x,p),type="l",ylab="y",xlab="x")
title("y=(1+2x-3x^2)/(1-4x)")
dev.off()

postscript(file="r12p4.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- -1
p2 <- -2
p3 <- 3
p4 <- -4
p <- c(p1,p2,p3,p4)
x <- seq(0.25,1.25,length=100)

plot(x,r12(x,p),type="l",ylab="y",xlab="x")
title("y=(1-2x+3x^2)/(1-4x)")
dev.off()

postscript(file="r12p5.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 1
p2 <- 2
p3 <- 5
p4 <- 7
p <- c(p1,p2,p3,p4)
x <- seq(0,1,length=100)

plot(x,r12(x,p),type="l",ylab="y",xlab="x")
title("y=(1+2x+5x^2)/(1+7x)")
dev.off()
