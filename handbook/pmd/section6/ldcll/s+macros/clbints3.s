#
# Starting Step 4.3
flb <- function(load) 
  {
  rsdm <- sqrt(1 + c(1,load,load^2)%*%lfs$cov.unscaled%*%c(1,load,load^2))
  f(load) + qt(0.975,lf$df)*lfs$sigma*rsdm
  }
nllb <- uniroot(flb,c(1500000,2000000))$root
fub <- function(load) 
  {
  rsdm <- sqrt(1 + c(1,load,load^2)%*%lfs$cov.unscaled%*%c(1,load,load^2))
  f(load) - qt(0.975,lf$df)*lfs$sigma*rsdm
  }
nlub <- uniroot(fub,c(1500000,2000000))$root
c(nllb,nl,nlub)
# Finished Step 4.3
