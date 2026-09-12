if(search()[1]!="htscd1.dat") attach(htscd1.dat,pos=1)
nreps <- 5
ym <- as.matrix(htscd1.dat[,3:(nreps+2)])
unc2u <- matrix(NA,nrow=nreps,ncol=3)
unc8u <- matrix(NA,nrow=nreps,ncol=3)
unc2w <- matrix(NA,nrow=nreps,ncol=3)
unc8w <- matrix(NA,nrow=nreps,ncol=3)
wv <- 1/(x+0.001)^2
for(i in 1:nreps) {
ci <- pointwise(predict(lm(ym[,i]~x),data.frame(x=2),se.fit=T))
unc2u[i,] <- as.vector(c(ci$lower,ci$fit,ci$upper))
ci <- pointwise(predict(lm(ym[,i]~x),data.frame(x=8),se.fit=T))
unc8u[i,] <- as.vector(c(ci$lower,ci$fit,ci$upper))
ci <- pointwise(predict(lm(ym[,i]~x,weights=wv),data.frame(x=2,wv=1/(2.001^2)),se.fit=T))
unc2w[i,] <- as.vector(c(ci$lower,ci$fit,ci$upper))
ci <- pointwise(predict(lm(ym[,i]~x,weights=wv),data.frame(x=8),se.fit=T))
unc8w[i,] <- as.vector(c(ci$lower,ci$fit,ci$upper))
print(i)
}
