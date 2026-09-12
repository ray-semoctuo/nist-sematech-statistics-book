######################################################################
##
## weibull-8.4.1.3.R
##
## AUTHOR:       Antonio Possolo
## MODIFICATION: 2006 Nov 04
## HANDBOOK:     8.4.1.3. A Weibull maximum likelihood estimation example  
## http://www.itl.nist.gov/div898/handbook/apr/section4/apr413.htm

######################################################################
##
## LEFT SIDE BAR: Reliability analysis with a popular statistical
## software package

## TITLE: R Example

## R offers excellent capabilities for the analysis of lifetime
## (survival) or reliability data, including Kaplan-Maier estimation
## of survival probabilities, and maximum likelihood estimation for
## Gaussian, logistic, Student's t, exponential, Rayleigh, Weibull,
## lognormal, log-logistic, and extreme value distribution models, as
## well as for other, user-specified models.

## Use of R for Weibull plotting and model fitting will be illustrated
## using data from a previous example.

######################################################################
##
## SIDE BAR: Steps in a Weibull analysis using R software

## TITLE: Weibull Data Example
 
## Failure times were 55, 187, 216, 240, 244, 335, 361, 373, 375, and
## 386 hours, and 10 unfailed units were removed from test at 500
## hours. The following code implements the analysis, whose steps are
## discussed below.

## (1) Load package
require(survival)

## (2) Create survival object
failures = c(55, 187, 216, 240, 244, 335, 361, 373, 375, 386)
y = Surv(c(failures, rep(500, 10)), c(rep(1, length(failures)), rep(0, 10)))

## (3) Survival curve (Kaplan-Mier)
ys = survfit(y ~ 1, type="kaplan-meier")
summary(ys)
plot(ys, xlab="Hours", ylab="Survival Probability")

## (4) Weibull Probability Plot
p = ppoints(failures, a=0.3)
plot(failures, -log(1-p), log="xy",
     xlab="Hours", ylab="Cumulative Hazard")

## (5) Weibull Fit
yw = survreg(y ~ 1, dist="weibull")
summary(yw)

## (6) Log-likelihood and Akaike's Information Criterion
signif(summary(yw)$loglik, 5)
signif(extractAIC(yw), 5)

## (7) Maximum likelihood estimates
## For the Weibull model, survreg fits log(T) = log(eta) +
## (1/beta)*log(E), where E has an exponential distribution with mean 1
## eta = Characteristic life (Scale) (Dataplot's alpha)
## beta = Shape (Dataplot's gamma)

etaHAT <- exp(coefficients(yw)[1])
betaHAT <- 1/yw$scale
signif(c(eta=etaHAT, beta=betaHAT), 6)

## (8) Lifetime: expected value and standard deviation
muHAT = etaHAT * gamma(1 + 1/betaHAT)
sigmaHAT = etaHAT * sqrt(gamma(1+2/betaHAT) - (gamma(1+1/betaHAT))^2)
names(muHAT) = names(sigmaHAT) = names(betaHAT) = names(etaHAT) = NULL
signif(c(mu=muHAT, sigma=sigmaHAT), 6)

## (9) Probability density of fitted model
curve(dweibull(x, shape=betaHAT, scale=etaHAT),
      from=0, to=muHAT+6*sigmaHAT,
      xlab="Hours", ylab="Probability Density")

## (10) Weibull versus lognormal models
yl = survreg(y ~ 1, dist="lognormal")
signif(c(lognormalAIC=extractAIC(yl)[2], weibullAIC=extractAIC(yw)[2]), 5)

######################################################################
## ================================================================ ##
######################################################################



