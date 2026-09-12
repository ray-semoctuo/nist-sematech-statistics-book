xrng <- c(100,600)
cl <- 0.99
clbpef <- function(x) {
pred <- predict(lf,x,se.fit=T)
       pred$fit - ynew
        }
clblbf <- function(x) {
pred <- predict(lf,x,se.fit=T)
       pred$fit - qt((1 + cl)/2, pred$df) * sqrt(pred$res^2 + pred$se^2) - ynew
        }
clbubf <- function(x) {
pred <- predict(lf,x,se.fit=T)
       pred$fit + qt((1 + cl)/2, pred$df) * sqrt(pred$res^2 + pred$se^2) - ynew
        }
clbpe <- uniroot(clbpef, xrng)$root
clblb <- uniroot(clbubf, xrng)$root
clbub <- uniroot(clblbf, xrng)$root
