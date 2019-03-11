#LAB 4 - lab step 4 - predict the value of n[12]
#formula : n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1]) / K)
t <- 1
#time
K <- 10000
#carrying capacity
r <- 0.8
#growth rate
n <- rep(2500, 12)

#predict n[12]
for ( t in 2:12) {
  n[t] <- n [t - 1] + ( r * n [t - 1] * (K - n [t - 1]) / K)
}
print(n)

#LAB 4 - lab step 7 - redo lab step 4 
#step 4 is on lines 25-39
#create a time vector
t <- 1:12
#create a plot with time and abundance (t,n)
plot(t, n)
#shows abundance as it reaches K


#LAB 8 - lab step 3a - create a new script that contains the code from step 7 in lab 4

#step 3b - turn the logistic growth model into a function that takes "r" (intrinsic growth rate), "K" (carrying capacity), and initial population size as arguments
LogisticGrowthModel <- function(r, K, InitPop) {
  t <- 1:12
  #LAB 4 time vector
  n <- rep(InitPop, 12)
  #LAB 4 "2500" becomes "InitPop" to avoid magic numbers
  for ( t in 2:12) {
    n[t] <- n [t - 1] + ( r * n [t - 1] * (K - n [t - 1]) / K)
  }
  #LAB 4 Logistic Growth for loop
  return(n)
  #previous "print(n)" becomes "return(n)" in functions
}
LogisticGrowthModel(0.8, 10000, 2500)
#tests using LAB 4 values

#step 3c - add code to "LogisticGrowthModel" so it produces a plot of the data it generates
#axes should be labeled appropriately
LogisticGrowthModel <- function(r, K, InitPop, TotalGens) {
  n <- rep(InitPop, TotalGens)
  NumTimes <- 1:TotalGens
  #TotalGens replaces magic numbers
  for ( t in 2:12) {
    n[t] <- n [t - 1] + ( r * n [t - 1] * (K - n [t - 1]) / K)
  }
  plot(NumTimes, n)
  #NumTimes replaces LAB 4 "t"
  return(n)
}

#step 3d - write a line of code that calls the function using own parameter values
LogisticGrowthModel(0.5, 5000, 1500, 15)

#step 3e - write a line of code that writes the data set to a file
#data file should have 2 columns: "Generations", "Abundance"
#do this by creating a matrix to properly display columns
LogisticGrowthModel <- function(r, K, InitPop, TotalGens) {
  n <- rep(InitPop, TotalGens)
  NumTimes <- 1:TotalGens
  for ( t in 2:12) {
    n[t] <- n [t - 1] + ( r * n [t - 1] * (K - n [t - 1]) / K)
  }
  plot(NumTimes, n)
  LogisticGrowthMatrix <- cbind(NumTimes, n)
  colnames(LogisticGrowthMatrix) <- c("Generations", "Abundance")
  return(LogisticGrowthMatrix)
}

LogisticGrowthMatrix <- LogisticGrowthModel(0.5, 5000, 1500, 15)
#tests using step 3d values

write.csv(x = LogisticGrowthMatrix, file = "Bogiel_Lab08GrowthMatrix.csv")
#this is the actual code that writes the data to a file