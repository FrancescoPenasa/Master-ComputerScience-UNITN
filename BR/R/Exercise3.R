# Write a double for loop which prints 
# 30 numbers (1:10, 2:11, 3:12).
# Those are three clusters of ten numbers each. 
# The first loop determines the number of 
# clusters (3) via its length; 
# the second loop the numbersto be 
# printed (1 to 10 at the beginning).
# Each cluster starts one number higher 
# than the previous one.

for (c in 1:3) {
  for (n in c:(9+c))
    print(n)
}