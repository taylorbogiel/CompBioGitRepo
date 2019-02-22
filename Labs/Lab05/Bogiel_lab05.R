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
