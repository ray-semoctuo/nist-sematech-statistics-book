nreps <- 1000
output <- matrix(NA,nrow=nreps,ncol=3)
lfo <- lm(dfl~ld+ld^2,data=pontius.dat)
ld <- pontius.dat$ld
dflt <- as.vector(predict(lfo))
for(i in 1:nreps)
{
dfl <- dflt+rnorm(length(dflt),sd=2.052e-4)
lf <- lm(dfl~ld+ld^2)
ynew <- rnorm(1,m=1.239742,sd=2.052e-4)
output[i,] <- clb.int(lm(dfl~ld+ld^2),rnorm(1,m=1.239742,sd=2.052e-4),c(1.5e6,2e6),0.95)
print(c(i))
}
q()
