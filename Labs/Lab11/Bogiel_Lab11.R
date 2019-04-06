#Lab 11
library("tidyverse")
library("dplyr")
#Part 1 - Download DryadData and turn it into a csv, then import data
WoodData <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

#Part 2 - find and remove the row with no density entered
which(is.na(WoodData$Wood.density))
#12150
NewWoodData <- WoodData[-c(12150),]

#Find the mean of each species' density measurements
#New data frame must have:
  #each species listed only once
  #the "Family" and "Binomial" information for each species
  #the mean of the "Density" measurements for each species
FBM <- summarise(group_by("NewWoodData", "Family", "Binomial", "Wood.density"))
