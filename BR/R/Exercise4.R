# Get a histogram of the 'mpg' values of 'mtcars'.
# Which bin contains the most observations?
# Are there more automatic (0) or manual 
# (1) transmission-type cars in the dataset?
# Get a scatter plot of 'hp' vs 'weight' 
# and measure variable correlation.
head(mtcars)
help(mtcars)

# Get a histogram of the 'mpg' values of 'mtcars'.
# Which bin contains the most observations?
hist(mtcars$mpg, breaks=20)
as.data.frame(table(round(mtcars$mpg, digits = 0)))

# Are there more automatic (0) 
# or manual (1) transmission-type cars in the dataset?
if (sum(mtcars$am==0) >= sum(mtcars$am==1)){
  print("automatic")
} else {
  print("manual")
}

# Get a scatter plot of 'hp' vs 'weight' 
# and measure variable correlation.
plot(mtcars$hp, mtcars$wt, main="scatterplot", xlab="Gross horsepower", ylab="Weight (1000 lbs)",
col="red", pch=19)
cor.test(mtcars$hp, mtcars$wt)
