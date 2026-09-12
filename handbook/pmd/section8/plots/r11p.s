attach("s+fnc")
postscript(file="r11p1.ps",hor=T)
par(pty="s",mfrow=c(1,2),mgp=c(2.5,0.75,0))
p1 <- 1
p2 <- 2
p3 <- 3
p <- c(p1,p2,p3)

offset <- 0.05
x1 <- seq(-1.5,-1/p3-offset,length=100)
x2 <- seq(-1/p3+offset,1.5,length=100)

plot(c(x1,x2),c(r11(x1,p),r11(x2,p)),type="n",ylab="y",xlab="x")
title("y=(1+2x)/(1+3x)")
lines(x1,r11(x1,p))
lines(x2,r11(x2,p))
abline(h=p2/p3,lty=8)
abline(v=-1/p3,lty=8)

p1 <- -1
p2 <- 2
p3 <- 3
p <- c(p1,p2,p3)

offset <- 0.05
x1 <- seq(-1.5,-1/p3-offset,length=100)
x2 <- seq(-1/p3+offset,1.5,length=100)

plot(c(x1,x2),c(r11(x1,p),r11(x2,p)),type="n",ylab="y",xlab="x")
title("y=(-1+2x)/(1+3x)")
lines(x1,r11(x1,p))
lines(x2,r11(x2,p))
abline(h=p2/p3,lty=8)
abline(v=-1/p3,lty=8)
dev.off()

postscript(file="r11p2.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 10
p2 <- -7 
p3 <- 0.333
p <- c(p1,p2,p3)
x <- seq(-30,-5,length=100)

plot(x,r11(x,p),type="l",ylab="y",xlab="x")
title("y=(10-7x)/(1+0.333x)")
dev.off()

postscript(file="r11p3.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 0.2
p2 <- 3 
p3 <- 1
p <- c(p1,p2,p3)
x <- seq(3,5,length=100)

plot(x,r11(x,p),type="l",ylab="y",xlab="x")
title("y=(0.2+3x)/(1+x)")
dev.off()

postscript(file="r11p4.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- -50
p2 <- -3
p3 <- -4
p <- c(p1,p2,p3)
x <- seq(0.45,1.1,length=100)

plot(x,r11(x,p),type="l",ylab="y",xlab="x")
title("y=(-50-3x)/(1-4x)")
dev.off()

postscript(file="r11p5.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
p1 <- 400
p2 <- 1000
p3 <- 0.25
p <- c(p1,p2,p3)
x <- seq(0,30,length=100)

plot(x,r11(x,p),type="l",ylab="y",xlab="x")
title("y=(400+1000x)/(1+0.25x)")
dev.off()
