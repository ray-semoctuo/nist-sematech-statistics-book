postscript("opt1.ps",hor=T)
par(mfrow=c(1,1),oma=c(0,0,0,0),mar=c(4,4,3,3),
    mgp=c(1.75,0.5,0),lwd=3,pch=16,lab=c(3,3,3))
if(search()[1]!="opt.dat") attach(opt.dat,pos=1)
set.seed(324)
x1 <- c(-1,-1,1,1,-1.414214,1.414214,0,0,0,0,0,0,0)
x2 <- c(-1,1,-1,1,0,0,-1.414214,1.414214,0,0,0,0,0)
yt <- 203 + 8*x1 - 30*x2 - 4*x1*x2 - 16*x1^2 - 24*x2^2
y <- yt + rnorm(13,sd=5)
x1 <- 50*x1 + 100
x2 <- 100*x2 + 300
lf <- lm(y~x1+x2+x1*x2+x1^2+x2^2)                         
gv <- list(x1=seq(25,175,length=20),x2=seq(150,450,length=20))
pred <- matrix(predict(lf,expand.grid(gv)),ncol=20,nrow=20)
pp <- persp(gv$x1,gv$x2,pred,
            xlab="Temperature",ylab="Pressure",zlab="Through Put",cex=1.2)
points(perspp(x1,x2,y,pp))
asp <- perspp(c(25,rep(118.4280,3)),c(450,rep(225.6853,3)),c(rep(217.9243,2),60,60),pp)
aep <- perspp(c(rep(118.4280,3),25),c(rep(225.6853,2),150,225.6853),c(217.9243,rep(60,3)),pp)
arrows(asp$x,asp$y,aep$x,aep$y,size=0.15)
text(213,563,cex=1.2,srt=-4.5,"Max. Through Put \n = 218")
text(510,135,cex=1.2,srt=18,"Pressure = 225")
text(732,163,cex=1.2,srt=-29,"Temp. = \n 118")
dev.off()
