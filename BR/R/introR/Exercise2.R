# Write a R function to rotate 
# a given matrix 90 degree clockwise rotation

rotate <- function(m){
  new_m <- m
  dim(new_m) <- c(ncol(m),nrow(m))
  
  for (i in 1:nrow(m)) {
    new_m[,nrow(m)-i+1] <- m[i,]
  }
   
  return(new_m) 
}

m <- matrix(1:8, nrow=2, ncol=4)
m
m <- rotate(m)
m 


# ===== gabri solution ======
rotate <- function(m){
r <- cbind(m[1,])
if(nrow(m) > 1){
  for (i in 2:(nrow(m))){
    r <- cbind(m[i,],r)
  }
}
return(r)
}

# ===== professor solution =========
m <- matrix(1:9, 3)
# reverse the columns and the transpose it
rotate <- t(apply(m,2,rev))
