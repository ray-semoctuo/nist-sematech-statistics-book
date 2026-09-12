nreps <- 1000
output <- matrix(NA,nrow=nreps,ncol=3)
for(i in 1:nreps)
{
y <- yt+rnorm(length(yt),sd=0.0333)
lf <- loess(y~x,span=0.3)
output[i,] <- clb.int(lf,rnorm(1,m=736,sd=0.0333),c(385,390),0.99)
print(i)
}
