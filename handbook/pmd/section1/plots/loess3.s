function(x, y, xp, alpha = 0.25, dgr = 2)
{
	n <- length(x)
	q <- ceiling(alpha * n)	
	#output <- list(data = data.frame(xs = x, ys = y), coef = 1:(dgr + 1), pred = 1)
	output <- list()
	for(i in 1:length(xp)) {
		dixv <- abs(xp[i] - x)
		dqx <- sort(dixv)[q]
		sdist <- dixv/dqx
		wv <- tcwf(dixv, dqx)
		lf <- lm(y ~ poly(x, dgr), weights = wv)
		lcoef <- poly.transform(poly(x, dgr), coef(lf))
		pred <- (rep(xp[i], dgr + 1)^(0:dgr)) %*% lcoef
		output[[i]] <- list(data = data.frame(xs = x[sdist <= 1], ys = 
			y[sdist <= 1], dist = dixv[sdist <= 1], sdist = sdist[
			sdist <= 1], wt = wv[sdist <= 1]), coef = lcoef, pred
			 = pred)
	}
	output
}
