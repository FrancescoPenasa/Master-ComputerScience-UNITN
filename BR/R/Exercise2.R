# Write a R function to rotate 
# a given matrix 90 degree clockwise rotation

rotate <- function(m){
  new_m <- m
  
  for (i in 1:nrow(m)) {
    new_m[,nrow(m)-i+1] <- m[i,]
  }
   
  return(new_m) 
}

m <- matrix(1:9, nrow=3, ncol=3)
m
m <- rotate(m)
m 