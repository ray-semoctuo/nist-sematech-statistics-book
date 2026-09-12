set.seed(92)
n <- 21
x <- sort(runif(n,min=0,max=20))
yt <- 200 + (x/3-6)*(x-4)*(x-10)   
y <- yt + rnorm(n,sd=8)           
lf <- loess(y~x,span=1/3,degree=1,surface="direct")
xp <- seq(min(x),max(x),length=200)

postscript(file="loesscmp.ps")
plot(x,y)
lines(xp,predict.loess(lf,xp)) 
