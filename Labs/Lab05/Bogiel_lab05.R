#Part 1
#lab step 1 - assign x as variable, write if-else statement for x>5
x <- 13
if(x > 5){
  print("x is greater than 5")
} else { 
  print("x is not greater than 5")
}

#lab step 2a - import file, use a for() loop to replace negative values with NA
Vector1 <- read.csv("Vector1.csv")
#create a vector containing the values from the x column
x <- Vector1$x
#use a for loop to replace negative "x" with "NA"
for (i in 1:length(x)) {
  if(x[i] < 0)  {
    x[i] <- NA
}
}
#since this is a vector, accessing elements within it is only done with a single index
View(x)

#lab step 2b - use vectorized code to use "logical" indexing replacing NA with NaN
x[is.na(x)] <- NaN
View(x)

#lab step 2c - change all the NaN values with zero using a "which()" statement and integer indexing
x[which(is.nan(x))] <- 0
View(x)

#lab step 2d - determine how many of the imported data values fall between 50 and 100
xFiftyHundred <- length(which(x > 50 & x < 100))
#this uses the which() function and the length() function all in one line
#the which() function gives a vector of logicals
#the length() function counts the "TRUE"s
View(xFiftyHundred)

#lab step 2e - create a vector that has all values from Vector1 between 50 and 100
FiftyToOneHundred <- Vector1[Vector1 > 50 & Vector1 < 100]
View(FiftyToOneHundred)

#lab step 2f - use write.csv() to save the vector to a file named "FiftyToOneHundered.csv"
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#lab step 3 - import the data on CO2 emmisions from last week's lab
CO2Vec <- read.csv("CO2_data_cut_paste.csv")

#lab step 3a - what was the first year for which data on "Gas" emmisons were non-zero
FirstGas <- which(CO2Vec$Gas > 0)[1]
#indexing the 1 gives the first position in this new variable
CO2Vec$Year[FirstGas]
#indexing the new variable gives the result of the "Year" column from the position given by the first indexing

#lab step 3b - During which years were "Total" emissions between 200 and 300 million metric tons of carbon
TotalEmissions200to300 <- which(CO2Vec$Total > 200 & CO2Vec$Total < 300)
#gives the positions where the 200 > Total > 300
CO2Vec$Year[TotalEmissions200to300]

#Part 2
# n[t] <- n[t - 1] + (r * n[t - 1]) - (a * n[t - 1] * p[t - 1])
# p[t] <- p[t - 1] + (k * a * n[t - 1] * p[t - 1]) - (m * p[t - 1])
#lab step 1 - set up parameter values
totalGenerations <- 1000
initPrey <- 100
#initial prey abundance at time t = 1
initPred <- 10
#initial predator abundance at time t = 1
a <- 0.01
#attack rate
r <- 0.2
#growth rate of prey
m <- 0.05
#mortality rate of predators
k <- 0.1
#conversion constant of prey into predators

#lab step 2 - create a "time" vector and 2 additional vectors to store results: one for the values of n over time, the other to store values of p
time <- c(1:totalGenerations)
n <- rep(initPrey, totalGenerations)
p <- rep(initPred, totalGenerations)
#remember to name vectors "n" and "p" rather than "nOverTime" and "pValues" to be consistent with formula in Lotka-Volterra model

#lab step 3 - write a loop that implements the calculations
for (t in 2:totalGenerations) {
  n[t] <- n[t - 1] + (r * n[t - 1] - a * n[t - 1] * p[t - 1])
  p[t] <- p[t - 1] + (k * a * n[t - 1] * p[t - 1] - (m * p[t - 1]))
}

#lab step 4 - add some if statements to check for negative numbers in each generation
View(n)
View(p)

for (t in 2:totalGenerations) {
  n[t] <- n[t - 1] + (r * n[t - 1] - a * n[t - 1] * p[t - 1])
  p[t] <- p[t - 1] + (k * a * n[t - 1] * p[t - 1] - (m * p[t - 1]))
  if (n[t] < 0){
    n[t] = 0
  }
  if (p[t] < 0){
    p[t] = 0
  }
}

#lab step 5 - make a plot of the abundances  of prey and predators over time
plot(time, n)
lines(time, p)

#lab step 6a - create a matrix of the results named "myResults" in which the first column is named "TimeStep", the second column is named "PreyAbundance", and the third column is named "PredatorAbundance"
myResults <- cbind(time, n, p)
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredAbundance")
#colnames is a function for columns, rownames is the corresponding function for rows
View(myResults)

#lab step 6b - write this matrix to a csv in Lab05 working directory with the command write.csv(x = myResults, file = "PredPreyResults.csv")
write.csv(x = myResults, file = "PredPreyResults.csv")
