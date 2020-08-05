m <- cbind(c(1,2,3), c(1,2,3), c(1,2,3))
v <- c(2,4,6)

m*2
m*v
m*m
v*m
m%*%v
m%*%m

doe <- list("john", 28, F)
doe

doe <- list(name="john", age=28, married=F)
doe$name
class(doe)

doe <- unlist(doe)
class(doe)
doe


d <- data.frame(n1 = c(3,2,1), n2=c("a","b", "c"), n3=c(T,T,F))
class(d)
typeof(d)
d

d[3,2]
d["1", "n2"] # first row and second column
d[,"n2"] # just the second column

d[,2]
d[,2, drop=FALSE]
d["1" , , drop=FALSE]

d
d$n2
as.integer(d$n2)

cbind(d$n1, d$n2)
# d$n2 has been transformed into integer, because it was factor(enumeration)
# be careful
cbind(d$n1, as.character(d$n2))
# or 
d <- data.frame(n1 = c(3,2,1), n2=c("a","b", "c"), n3=c(T,T,F), stringsAsFactors = F)



x <- matrix(1:9, nrow = 3, ncol =3, dimnames = list(c("X", "Y", "Z"), c("A", "B", "C")))
x
apply(x, 1, sum)
apply(x, 2, sum)


vals <- rnorm(1200, mean=72, sd=3.2 )
hist(vals, breaks=23)
