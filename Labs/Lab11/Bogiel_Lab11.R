#Lab 11
library("tidyverse")
library("dplyr")
library("ggplot2")
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
FBM <- summarise(group_by(NewWoodData, Family, Binomial), meanDiff = mean(Wood.density))
  #this has 8412 rows

#step 6a - make a new data frame that has the average density for each Family
FM <- summarise(group_by(NewWoodData, Family), meanDiff = mean(Wood.density))
  #this has 191 rows

#step 6b - sort the resultof 6a by MeanDensity
MF <- arrange(FM, meanDiff)

#step 6c - use results from 6b to answer:
  #What are the 8 families with the highest average densities?
  #what are the 8 families with the lowest average densities?
tail(MF, n = 8)
#Hypericacae, Zygophyllaceae, Irvingiaceae, Sarcolaenacae, Surianaceae, Linaceae, Bonnetiaceae, Quiinaceae  
head(MF, n = 8)
#Caricaceae, Paulowniaceae, Moringaceae, Hernandiaceae, Bixaceae, Muntingiaceae, Datiscaceae, Tetramelaceae

#Part 3 - 