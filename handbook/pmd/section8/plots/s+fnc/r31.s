function(x,p)
{
#
# Function to compute predicted values for a 3/1 rational function.  The
# argument x is a vector of predictor variable values.  p is a vector of
# parameter values.
#
y <- (p[1]+p[2]*x+p[3]*x^2+p[4]*x^3)/(1+p[5]*x)
y
}
