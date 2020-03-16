# Consider the vector lines obtained with
lines <- c("ID\tName\tSurname\tAge",
          "1\tMarco\tRossi\t34",
          "2\tLuke\tSkywalker\t53")

lines
# Transform it into the matrix
x <- strsplit(lines, "\t")
m <- rbind(x[[1]])
for (i in 2:length(x)) {
  m <- rbind(m, x[[i]])
  print(m)
}

m

# == professor solutio == #
m <- matrix(unlist(strsplit(lines,"\t")), ncol=4, byrow=TRUE)
colnames(m) = m[1,]
m = data.frame(m[-1,])
