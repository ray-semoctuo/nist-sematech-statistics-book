clb.int <- function(lf, ynew, xrng, cl = 0.95)
{
assign("lf", lf, frame = 1)
assign("ynew", ynew, frame = 1)
assign("xrng", xrng, frame = 1)
assign("cl", cl, frame = 1)
clbpef <- function(x) {
  pred <- predict(lf, x, se.fit = T)
  pred$fit - ynew
  }
clblbf <- function(x) {
  pred <- predict(lf, x, se.fit = T)
  pred$fit - qt((1 + cl)/2, pred$df) * sqrt(pred$res^2 + pred$se^2) - ynew
  }
clbubf <- function(x) {
  pred <- predict(lf, x, se.fit = T)
  pred$fit + qt((1 + cl)/2, pred$df) * sqrt(pred$res^2 + pred$se^2) - ynew
  }
clbpe <- uniroot(clbpef, xrng)$root
clblb <- uniroot(clbubf, xrng)$root
clbub <- uniroot(clblbf, xrng)$root
c(clblb, clbpe, clbub)
}
