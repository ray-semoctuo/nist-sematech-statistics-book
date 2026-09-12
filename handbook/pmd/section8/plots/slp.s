postscript(file="slp1.ps",hor=T)
par(pty="s",mfrow=c(1,2),mgp=c(2.5,0.75,0),)

x <- seq(0,20,length=5)
y <- 2 + 5*x  

plot(x,y,type="l",ylab="y",xlab="x")
title("y = 2 + 5*x")

x <- seq(-20,100,length=5)
y <- 300  - 5*x  

plot(x,y,type="l",ylab="y",xlab="x")
title("y = 300 - 5*x")
dev.off()
