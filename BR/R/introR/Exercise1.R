# Define a function that takes in input 
# a vector of strings and returns the number 
# of strings that contains any of the characters 
# "a","e","u".
f <- function(vec){
  return(length(grep('a|e|u', vec, ignore.case=TRUE))) 
}

vector <- c("area","ARE","sir","E","a")
f(vector)
