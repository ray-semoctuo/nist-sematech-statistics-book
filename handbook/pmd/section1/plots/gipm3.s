if(search()[1]!="gipm3.dat") attach(gipm3.dat,pos=1)
postscript("gipm3.ps",hor=T)
par(mfrow=c(3,3),oma=c(0,0,0,0),mar=c(4,4,2,3),
    mgp=c(1.75,0.75,0),lwd=3,pch=16,lab=c(3,3,3))
set.seed(513)
x1g <- seq(0,90,length=20)
x2g <- seq(0,90,length=20)
x1 <- runif(50,min=0,max=90)
x2 <- runif(50,min=0,max=90)
yt <- 43 + 0.125*x1 - 0.035*x2 + 0.003*x1*x2 - 0.001*x1^2 - 0.001*x2^2
y <- yt + rnorm(length(yt),sd=0.25)
lf <- lm(y~cbind(x1,x2,x1*x2,x1^2,x2^2))
rpf <- function(x1,x2) lf$coef[1] + lf$coef[2]*x1 + lf$coef[3]*x2 +
                       lf$coef[4]*x1*x2 + lf$coef[5]*x1^2 + lf$coef[6]*x2^2

persp.setup(lwd=c(0,0,0))
pp <- persp(x1g,x2g,matrix(rep(y,length=length(x1g)*length(x2g)),nrow=length(x1g),ncol=length(x2g)),
            xlab="x1",
            ylab="x2",
            zlab="y",
            cex=0.8,
            zlim=range(range(y),range(predict(lf),range(outer(x1g,x2g,rpf)))))
points(perspp(x1,x2,y,pp))

persp.setup(lwd=c(1,1,1))
persp(x1g,x2g,outer(x1g,x2g,rpf),
      xlab="",
      ylab="",
      zlab="",
      cex=0.8,
      zlim=range(range(y),range(predict(lf),range(outer(x1g,x2g,rpf)))))

persp.setup(lwd=c(0,0,0))
pp <- persp(x1g,x2g,matrix(0,nrow=length(x1g),ncol=length(x2g)),
            xlab="",
            ylab="",
            zlab="",
            zlim=c(-0.75,0.75),
            cex=0.8)
points(perspp(x1,x2,lf$res,pp))

par(mfg=c(2,2,3,3))
persp.setup(lwd=c(1,1,1))
persp(x1g,x2g,outer(x1g,x2g,rpf),
      xlab="",
      ylab="",
      zlab="",
      cex=0.8,
      zlim=range(range(y),range(predict(lf),range(outer(x1g,x2g,rpf)))))

hist(lf$res,xlim=c(-0.75,0.75),probability=T,xlab="",col=1,cex=0.8)
box()

par(mfg=c(3,2,3,3))
persp.setup(lwd=c(1,1,1))
persp(x1g,x2g,outer(x1g,x2g,rpf),
      xlab="",
      ylab="",
      zlab="",
      cex=0.8,
      zlim=range(range(y),range(predict(lf),range(outer(x1g,x2g,rpf)))))

plot(seq(-0.75,0.75,length=100),dnorm(seq(-0.75,0.75,length=100),sd=0.25),xlab="",ylab="",type="l",cex=0.8)

par(mfrow=c(1,1),new=T)
plot(0:100,0:100,type="n",axes=F,xlab="",ylab="")
text(25,90,"=")
text(25,48.5,"=")
text(25,7,"=")
text(69,90,"+")
text(69,48.5,"+")
text(69,7,"+")

dev.off()
detach(what=1,save=F)
