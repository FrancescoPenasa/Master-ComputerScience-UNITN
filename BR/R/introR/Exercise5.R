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
  # with the x and y coordinates, first produce a scatterplot
  plot(x,y, main="scatterplot", xlab="Variable x", ylab="Variable Y", pch=19, col="blue")
  
  # regress the y variable on the x variable.
  linearModel <- lm(y~x)
  
  # record the intercept and slope of the linear relationship between x and y 
  coefficients <- coef(linearModel)
  
  # add a regression line to the scatter plot
  abline(linearModel, col="red", lwd=2)
  # abline(coefficients[1], coefficients[2])
  return(coefficients)
}

drawRegressionLine(trees$Height, trees$Volume)
drawRegressionLine(faithful$waiting, faithful$eruptions)

#scatter.smooth(x=x, y=y, main="Dist ~ Speed")
