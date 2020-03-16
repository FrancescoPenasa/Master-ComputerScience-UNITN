f <- function(vec){
  return(length(grep('a|A|e|E|u|U', vec))) 
}

vector <- c("are","AC","uuuuuh","osso")
f(vector)