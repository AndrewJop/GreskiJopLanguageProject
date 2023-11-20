#Noah Greski and Andrew Jop
#Fall 2023
#R Example 1 Testing File
#All code is tested in R studio


#testing operators, printing, data types and assignments
a <- 10.5 #numeric type (double)
b <- 5 # numeric type (integer)
c <- 40
b <-30 #2nd assignment takes precedence
print (a + b - c)

d <- 10
d <- "Hello" #character type (string)
print(d) #types are not explicitly defined and d can be both numeric and character

e <- 0
f <- 1
flag <- FALSE #logical type

if(e < f){ #if statement
  flag = TRUE
} else{
  flag = FALSE
}

print(flag)

h <- 0:10 #sequence
print(h)

i <- seq(0, 20, by = 2) #sequence increment by 2
print(i)


j <- c('1', 'hello', 0.5, 'hi', FALSE) #c() function
#converts any type to character type if there are different datatypes
print(j)

#any variable is a vector
k <- c(0, 1, 2, 3, 4)
print (k[c(1, 5)]) #prints index at 1 and index at 5 of k

l <- c(-1, -2, -3) #adding two vectors together
m <- c(1, 2, 3)
print(l + m)










