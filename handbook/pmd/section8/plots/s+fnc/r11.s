function(x,p)
{
#
# Function to compute predicted values for a 1/1 rational function.  The
# argument x is a vector of predictor variable values.  p is a vector of
# parameter values.
#
y <- (p[1]+p[2]*x)/(1+p[3]*x)
y
}
