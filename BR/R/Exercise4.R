# Get a histogram of the 'mpg' values of 'mtcars'.
# Which bin contains the most observations?
# Are there more automatic (0) or manual 
# (1) transmission-type cars in the dataset?
# Get a scatter plot of 'hp' vs 'weight' 
# and measure variable correlation.

library(MASS)

barplot(mtcars$mpg)

which.max(mtcars$mpg)

if (length(mtcars$vs == 0) >= length(mtcars$vs == 1)){
  print("automatic")
} else {
  print("manual")
}

x <- mtcars$hp
y <- mtcars$wt
plot(x, y, xlab="hp", ylab="weight")
cor.test(x, y)
