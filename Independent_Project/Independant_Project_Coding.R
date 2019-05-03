#Independant Project
setwd("C:/Users/user/Desktop/School/Spring_2019/Computational_Biology/compBioSandbox/newGitRepo/Independent_Project")
library("tidyverse")
library("dplyr")
library("ggplot2")
library("plyr")
library("stringr")
library("tidyr")
library("sqldf")
library("statnet")
library("FSA")
library("PerformanceAnalytics")
library("psych")


### Import data sets ###
DataSet1 <- read.table("01_Dryad_DJ12_groups (1).csv", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#D/M/Y T, calf = Y/N, behavioral state, interaction, ID
#Behavioral state:
  #D = Travelling
  #DP = Travelling and foraging
  #DS = Travelling and socializing
  #PS = Foraging and socializing
    #This was an assumption as it may be a typo
    #It was not included in the information about the data set
    #This one result will be excluded due to uncertainty
  #P = Foraging
  #S = Socializing
#Interaction:
  #S = Y
  #N = N
DataSet2 <- read.table("02_Dryad_DJ12_homerange.csv", header = FALSE, sep = ";")
#Homerange overlap values
  #0 = no overlap
  #1 = completely overlapped
DataSet3 <- read.table("03_Dryad_DJ12_id_cov.csv", header = TRUE, sep = ";", dec = ",")
#Covariables of photo-identified individuals
#Id, Feq_Int, SEX, age, HR
  #Freq_Int = (fp)frequency of participation(0-100%)
  #SEX:
    #M = male
    #F = females
    #I = undetermined individuals
  #Age = adult/senior
  #HR = home range area (km^2)
    #estimated with 95% probability contour for each individual
DataSet4 <- read.csv("04_Dryad_DJ12_relatedness_Q.csv")
  #Pairwise genetic relatedness

#GAI formulas:
#SRI(all behavior) ~ FP + HRO
#SRI(cooperative foraging) ~ HRO
#SRI(non-cooperative foraging) ~ FP + HRO
#SRI(non-foaging) ~ FP + HRO
  #where SRIx = context-dependent SRI matrix
  #FP = Euclidean distance of fp (foragint tactics)
  #HRO = home range overlap

#Other usefull stuff:
#specialized foraging tactic = (high fp, low hr)
#network assortativity:
  #p[r(^w)(\/c,fp)]
  #hr[r(^w)(\/c,fp)]

### Formatting ###
#Rename the columns in DataSet3 to be consistant with DataSet1
colnames(DataSet3) <- c("IDs", "Freq_Int", "Sex", "Age", "HR")
#Change " " to "," in order to later separate the IDs
DataSet1$IDs <- gsub(" ", ",", DataSet1$IDs)
#Any rows containing "NA" in DataSet3 need to be removed in order to accurately determine SRI values.
if (any(is.na(DataSet3))){
  DataSet3 <- na.omit(DataSet3)
}

#Create a new data set with only necessary columns
NewSet1 <- DataSet1[,c(3,4,5)] 
#Separate IDs column into individual rows with corresponding Behavior and Interaction variables
NewSet1_IDs <- separate_rows(NewSet1, IDs)
#Remove rows caused by blank space at the end of IDs in original data set
NewSet1_IDs <- NewSet1_IDs[!(NewSet1_IDs$IDs == ""),]
  #This will make it easier to calculate all SRIs other than (all behavior)

### Obtaining Cooperative Foraging Values ###
#Create a list of all IDs specific to cooperative foraging
CF_IDs <- NewSet1_IDs$IDs[ ((NewSet1_IDs$Behaviour == "DP" | NewSet1_IDs$Behaviour == "P") & NewSet1_IDs$Interaction == "S") ]

### Obtaining Non-Cooperative Foraging Values ###
#Create a list of all IDs specific to non-cooperative foraging
NCF_IDs <- NewSet1_IDs$IDs[ ((NewSet1_IDs$Behaviour == "DP" | NewSet1_IDs$Behaviour == "P") & NewSet1_IDs$Interaction == "N") ]

### Obtaining Non-Foraging Values ###
#Create a list of all IDs specific to non-foraging
NF_IDs <- NewSet1_IDs$IDs[ (NewSet1_IDs$Behaviour == "D" | NewSet1_IDs$Behaviour == "DS" | NewSet1_IDs$Behaviour == "S") ]

### Obtaining All Behavior Values ###
#Create a list of all IDs specific to all behaviors
AB_IDs <- NewSet1_IDs$IDs[ ((NewSet1_IDs$Behaviour == "DP" | NewSet1_IDs$Behaviour == "P" | NewSet1_IDs$Behaviour == "D" | NewSet1_IDs$Behaviour == "DS" | NewSet1_IDs$Behaviour == "S") & NewSet1_IDs$Interaction == "S" | NewSet1_IDs$Interaction == "N") ]

### Creating a function to run correlation tests ###
Correlation_Test <- function(ID_List, F_Label){
  #The two inputs must be ID_List and F_Label
    #ID_Lists:
      #CF_IDs
      #NCF_IDs
      #NF_IDs
      #AB_IDs
    #F_Labels must correstpond to ID_List:
      #CF
      #NCF
      #NF
      #AB
  #Create a vector of unique IDs specific to the type of foraging
  Unique_ID <- unique(ID_List)
  #Encode the new vector as a factor to ensure they are ordered the same way as DataSet3 for later merging
  Unique_ID <- factor(Unique_ID, levels = DataSet3$IDs, ordered = TRUE)
  #Sort the new vector in the same order as "IDs" in DataSet3
  Unique_ID <- sort(Unique_ID)
  #Turn vector into a data frame for easier merging
  Unique_ID <- as.data.frame(Unique_ID, stringsAsFactors = FALSE)
  #Rename column to match DataSet3
  colnames(Unique_ID) <- c("IDs")
  #Merge "IDs" column from Unique_CF with corresponding "Freq_Int" and "HR" columns from DataSet3
  F_Label <- sqldf("SELECT IDs, Freq_Int, HR
                   FROM DataSet3
                   JOIN Unique_ID USING(IDs)")
  #Remove "L" to make "IDs" a numeric variable
  F_Label$IDs <- gsub("L", "", F_Label$IDs)
  #Make "IDs" column numeric to run correlation test
  F_Label$IDs = as.numeric(F_Label$IDs)
  #Run coorelation test
  CF_Test <- corr.test(F_Label,
                       use = "pairwise",
                       method = "spearman",
                       adjust = "none")
  #To see confidence intervals of the correlations, print with the "short = FALSE" option
  print(CF_Test, short = FALSE)
  return()
}

Correlation_Test(CF_IDs, CF) 
#Returns cooperative foraging correlation in console
Correlation_Test(NCF_IDs, NCF)
#Returns non-cooperative foraging correlation in console
Correlation_Test(NF_IDs, NF)
#Returns non-foraging correlation in console
Correlation_Test(AB_IDs, AB)
#Returns all behavior correlation in console