#
# Starting Step 2.7
sse <- sum(lf$res^2)
df.sse <- lf$df
sspe <- sum((tapply(lf$res,Load,length)-1)*tapply(lf$res,Load,var))
df.sspe <- sum((tapply(lf$res,Load,length)-1))
sslf <- sse-sspe
df.sslf <- df.sse-df.sspe
lf.fstat <- (sslf/df.sslf)/(sspe/df.sspe)
lf.fstat
# Finished Step 2.7
