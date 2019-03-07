#Problem 1 - write a function named triangleArea that calculates and returns the area of a triangle when given two arguments (base and height)
triangleArea <- function(base, height) {
 myArea <- (0.5 * base * height)
 #this is needed to make the return print out the end result
  return(myArea)
}
triangleArea(10, 9)
#when putting numbers into the function, they must be in the correct order unless you have named the variables
triangleArea(height = 9, base = 10)
#works the same way

#Problem 2 - write a function named myAbs() that calculates and returns absolute values
myAbs <- function(x) {
  x[(x < 0)] <- -x[(x < 0)]
  return(x) 
} 
#this only works if there are no NAs in the vector
#to make this work with NAs, x[(x < 0)] <- -x[which(x < 0)]
#this creates numerical indexing

myAbs(5)
myAbs(-2.3)
myAbs(x = c(1.1, 2, 0, -4.3, 9, -12))

#Problem 3 - write a function that returns a vector of the first N Fibonacci numbers, where n is any integer >= 3
myFib <- function(n, x) {
  Fib <- rep(0, n)
  #creates initial vector, filling all positions with zeroes
  Fib[2] <- 1
  #second index position must be equal to 1
  Fib[1] <- x
  #first index position must be equal to the value of x which must be 0 or 1
  for (r in 3:length(Fib)) {
    Fib[r] <- Fib[r - 2] + Fib[r - 1]
  } 
  return(Fib)
}

myFib(15, 0)

#to make a function to test if a value was above some threshold
testFn1 <- function(x, threshold = 0) {
  if (x > threshold) {
    return( TRUE) }
  else {
    return( FALSE)
  }
  }


#Problem 4a - write a function that takes two numbers as its arguments and returns the square of the difference between them
#for any two numbers x and y, function should calculate and return (x - y) ^ 2
mySqDiff <- function(x, y) {
  sqDiff <- ((x - y) ^ 2)
  return(sqDiff)
}
mySqDiff(3, 5)
mySqDiff(x = c(2, 4, 6), y = 4)

#Problem 4b - write a function of your own that calculates thea verage of a vector of numbers
myAverage <- function(vec) {
  Average <- {sum(vec) / length(vec)}
  return(Average)
}
myVec <- c(5, 15, 10)
myAverage(vec)
#demonstrate that this function works by calling it with  data from "DataForLab07.csv"
Lab07Data <- read.csv("DataForLab07.csv")
myAverage(Lab07Data$x)

#Problem 4c - write a function that calculates and returns the sum of squares for "DataForLab07.csv"
mySumSq <- function(x) {
  #calculate the mean of data set
  SumSqMean <- myAverage(x)
  #create a placeholder (0) variable for the sum of all squares to be replaced later in the loop
  SumSqSum <- 0
  for (n in 1:length(x)) {
    SumSqSum <- SumSqSum + (mySqDiff(x[n], SumSqMean))
  } 
  return(SumSqSum)
}
  #subtract the mean from each data point
  #square the difference
  #sum the differences

#demonstrate that this function works using "Lab07Data"
mySumSq(Lab07Data[,1])
