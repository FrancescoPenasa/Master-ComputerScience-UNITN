# Write a function called "drawRegressionLine()" 
# for drawing a regression line through a scatterplot.
# This function should be specified as follows:
#   input:
#     x = a numeric vector specifying the x-coordinates of the scatter plot
#     y = a numeric vector specifying the y-coordinates of the scatter plotsuggested algorithm:
#   with the x and y coordinates, first produce a scatterplot 
#     (HINT: use the "plot()" function)
#   use the "lm()" function to regress the y variable on the x variable.
#   record the intercept and slope of the linear relationship between x and y 
#     (HINT: use the"coef()" function)
#   add a regression line to the scatter plot (HINT: use the "abline()" function)
#    return: coefs = a vector of length 2, storing the intercept and slope of the linear relationship
# Apply this function to the 'Height' (x axis) and 'Volume' (y axis) vectors in the 'trees' dataset
# and then to the 'waiting' (x axis) and 'eruptions' (y axis) vectors in the 'faithful' dataset.

drawRegressionLine <- function(x, y){
  plot(x,y)
  intercept <- lm(y~x)
  coef <- coef(intercept)
  abline(intercept, col="red", lwd=2)
  abline(coef, col="red", lwd=2)
  
  return(coef)
}

library(MASS)
x = trees$Height
y = trees$Volume

drawRegressionLine(x, y)

#scatter.smooth(x=x, y=y, main="Dist ~ Speed")
