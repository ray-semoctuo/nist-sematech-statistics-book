function(x,p)
{
#
# Function to compute predicted values for a 1/3 rational function.  The
# argument x is a vector of predictor variable values.  p is a vector of
# parameter values.
#
y <- (p[1]+p[2]*x)/(1+p[3]*x+p[4]*x^2+p[5]*x^3)
y
}
