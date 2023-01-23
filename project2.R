library(OptimalDesign)
# Initialize parameters
theta1 <- 1
theta2 <- 1/2
theta3 <- 1
# define regressor vector using linearized model
M <- function(x){
  a1 <- theta3*x*exp(-theta1*x);
  a2 <- -theta3*x*exp(-theta2*x);
  a3 <- exp(-theta2*x)- exp(-theta1*x)
  matriz <- matrix(nrow=length(x), ncol=3, c(a1,a2, a3), byrow=TRUE);
  matriz
}
########### Question 2 Calculate Information matrix
x <- 1/2
infmat <- t(M(x))%*%((M(x))) 
#            [,1]        [,2]        [,3]
#[1,]  0.09196986 -0.11809164  0.05224356
#[2,] -0.11809164  0.15163266 -0.06708205
#[3,]  0.05224356 -0.06708205  0.02967700
############# Question 3 approximated design
x0 <- seq(0,1,0.01) # interval 0 to 1 discretized
Fx <- matrix(0, nrow = length(x0), ncol = 3)
for (i in 1:length(x0)){
  Fx[i,1] <- M(x0[i])[1,1];
  Fx[i,2] <- M(x0[i])[1,2];
  Fx[i,3] <- M(x0[i])[1,3];
}

# get weights
w <- od_REX(Fx)$w.best # Trials with weights 1/3 at 0.23, 0.67 and 1.00 each


#check GET
Fx.lin <- Fx_cube(~x1, lower = 0, upper = 1, length(x0))
od_plot(Fx, w, Fx.lin[,2], w.lim = Inf)

############ Question 4 exact design

# Compute the 3-point exact D-optimal design to be saturated
w <- od_KL(Fx, 3, t.max=5)$w.best # Perform 1/3 of trials with 0.23 0.67 and 1.00 each

# Check GET 
od_plot(Fx, w, Fx.lin[, 2])