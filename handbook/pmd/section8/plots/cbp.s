postscript(file="cbp1.ps",hor=T)
par(pty="s",mfrow=c(1,2),mgp=c(2.5,0.75,0),)

x <- seq(-2.5,2,length=100)
y <- -6*(x+2)*x*(x-1)
plot(x,y,type="l",ylab="y",xlab="x")
title("y = -6*(x+2)*x*(x-1)")

x <- seq(15,40,length=100)
y <- (x-25)^3+450
plot(x,y,type="l",ylab="y",xlab="x")
title("y = (x-25)**3 + 450")

dev.off()

postscript(file="cbp2.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(-2,2,length=100)
y <- -6*(x+2)*x*(x-2)
plot(x,y,type="l",ylab="y",xlab="x")
abline(h=0,lty=8)
title("y = -6*(x+2)*x*(x-2)")
dev.off()

postscript(file="cbp3.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(20,30,length=100)
y <- (x-25)^3+450
plot(x,y,type="l",ylab="y",xlab="x")
title("y = (x-25)**3 + 450")
dev.off()

postscript(file="cbp4.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(-1,0.5,length=100)
y <- -6*(x+2)*x*(x-1)
plot(x,y,type="l",ylab="y",xlab="x")
title("y = -6*(x+2)*x*(x-1)")
dev.off()

postscript(file="cbp5.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(30,40,length=100)
y <- (x-25)^3+450
plot(x,y,type="l",ylab="y",xlab="x")
title("y = (x-25)**3 + 450")
dev.off()

postscript(file="cbp6.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(15,20,length=100)
y <- (x-25)^3+450
plot(x,y,type="l",ylab="y",xlab="x")
title("y = (x-25)**3 + 450")
dev.off()

postscript(file="cbp7.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(-3,-1.5,length=100)
y <- -6*(x+2)*x*(x-1)
plot(x,y,type="l",ylab="y",xlab="x")
title("y = -6*(x+2)*x*(x-1)")
dev.off()

postscript(file="cbp8.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))
x <- seq(1,2,length=100)
y <- -6*(x+2)*x*(x-1)
plot(x,y,type="l",ylab="y",xlab="x")
title("y = -6*(x+2)*x*(x-1)")
dev.off()
