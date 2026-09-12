postscript(file="qdp1.ps",hor=T)
par(pty="s",mfrow=c(1,2),mgp=c(2.5,0.75,0),)

x <- seq(-5,9,length=100)
y <- -2*(x+2)*(x-7) 

plot(x,y,type="l",ylab="y",xlab="x")
title("y = -2*(x+2)(x-7)")

x <- seq(-20,40,length=100)
y <- x^2+132

plot(x,y,type="l",ylab="y",xlab="x",ylim=c(0,1800))
title("y = x**2 + 132")
dev.off()

postscript(file="qdp2.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))

x <- seq(1.5,3.5,length=100)
x <- seq(2,3,length=100)
y <- -2*(x+2)*(x-7) 

plot(x,y,type="l",ylab="y",xlab="x")
title("y = -2*(x+2)(x-7)")
dev.off()

postscript(file="qdp3.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))

x <- seq(-10,0,length=100)
y <- x^2+132

plot(x,y,type="l",ylab="y",xlab="x")
title("y = x**2 + 132")
dev.off()

postscript(file="qdp4.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))

x <- seq(6,10,length=100)
y <- -2*(x+2)*(x-7) 

plot(x,y,type="l",ylab="y",xlab="x")
title("y = -2*(x+2)(x-7)")
dev.off()

postscript(file="qdp5.ps",hor=T)
par(mgp=c(2.5,0.75,0),mar=c(4,4,4,2))

x <- seq(10,30,length=100)
y <- x^2+132

plot(x,y,type="l",ylab="y",xlab="x")
title("y = x**2 + 132")
dev.off()
