function(lf,ynew,xrng,cl = 0.95)
{
#
# Function to produce a calibration interval from any fitting routine that
#   1. yields predicted values with a distribution that is well approximated
#      by a normal distribution, and 
#   2. that has a method for predict that produces standard errors and degrees
#      of freedom.
#
# lf is a fit object, ynew is the new response variable value, xrng is an
# interval which contains the solution of the predictiona and uncertainty
# equations, and cl is the confidence level.
#
assign("lf",lf,frame = 1)
assign("ynew",ynew,frame = 1)
assign("xrng",xrng,frame = 1)
assign("cl",cl,frame = 1)
clbpef <- function(x)
{
pred <- predict(lf,x,se.fit = T)
pred$fit-ynew
}
clblbf <- function(x)
{
pred <- predict(lf,x,se.fit = T)
pred$fit-qt((1+cl)/2,pred$df)*sqrt(pred$res^2+pred$se^2)-ynew
}
clbubf <- function(x)
{
pred <- predict(lf,x,se.fit = T)
pred$fit+qt((1+cl)/2,pred$df)*sqrt(pred$res^2+pred$se^2)-ynew
}
clbpe <- uniroot(clbpef,xrng)$root
clblb <- uniroot(clbubf,xrng)$root
clbub <- uniroot(clblbf,xrng)$root
c(clblb,clbpe,clbub)
}
