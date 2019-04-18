#Lab 11
setwd("C:/Users/user/Desktop/School/Spring_2019/Computational_Biology/compBioSandbox/newGitRepo/Labs/Lab11")
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

#Part 3 - Plotting
#step 7 - plotting densities of most and least dense families with facets
  #make two figures using ggplot combined with the results of multiple previous problems
#Densities of individual species from the families with the highest average densities
#use step 6c to create a vector for the 8 families with the highest densities
Top8 <- tail(MF, n = 8)
#arrange them from highest to lowest
Top8.1 <- arrange(Top8, desc(meanDiff))

ggplot(Top8.1, aes(Family, meanDiff)) + geom_boxplot() + facet_wrap(facets = ~Family, scale = "free")
  #This is not giving the actual boxplots, need to figure this out
#Densities of individual species from the families with the lowest average densities
#use step 6c to create a vector for the 8 families with the lowest densities
Bottom8 <- head(MF, n = 8)

ggplot(Bottom8, aes(Family, meanDiff)) + geom_boxplot() + facet_wrap(facets = ~Family, scale = "free")
  #This is not giving the actual boxplots, need to figure this out
