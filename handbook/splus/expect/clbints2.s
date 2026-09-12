#
# Starting Step 4.2
f <- function(load) {lf$coef%*%c(1,load,load^2)-nd}
nl <- uniroot(f,c(1500000,2000000))$root
nl
# Finished Step 4.2
