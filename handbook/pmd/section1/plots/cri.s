cri <- function(sp)
        {
                vcv <- summary(lf)$cov
                df <- summary(lf)$df
                mse <- summary(lf)$sigma^2
                dx <- as.numeric(c(coef(lf)[2] + 2 * coef(lf)[4] * sp[1] + coef(
                        lf)[6] * sp[2], coef(lf)[3] + coef(lf)[6] * sp[1] + 2 *
                        coef(lf)[5] * sp[2]))
                V <- matrix(c(vcv[2, 2] + 4 * vcv[4, 4] * sp[1]^2 + vcv[6, 6] *
                        sp[2]^2, vcv[6, 6] * sp[1] * sp[2] + 4 * vcv[4, 5], vcv[
                        6, 6] * sp[1] * sp[2] + 4 * vcv[4, 5], vcv[3, 3] + vcv[
                        6, 6] * sp[1]^2 + 4 * vcv[5, 5] * sp[2]^2), nrow = 2)
                dx %*% solve(V) %*% dx - 2 * mse * qf(0.95, 2, df[2])
        }
