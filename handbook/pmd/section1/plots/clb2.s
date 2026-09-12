if(search()[1]!="tmp.dat") attach(tmp.dat,pos=1)
set.seed(222)
x <- seq(100,600,10)
yt <- -2.4650818346e-01*x   +
       5.9040421171e-03*x^2 +
      -1.3257931636e-06*x^3 +
       1.5668291901e-09*x^4 +
      -1.6944529240e-12*x^5 +
       6.2990347094e-16*x^6
set.seed(998)
y <- yt+rnorm(length(yt),sd=0.0333)
lf <- loess(y~x,span=0.3)
ynew <- rnorm(1,m=736,sd=0.0333)
print(ynew)
print(clb.int(lf,ynew,c(385,390),0.99))
assign("clb2.dat",data.frame(x=x,yt=yt,y=y),where=2)
detach(what=1,save=F)

