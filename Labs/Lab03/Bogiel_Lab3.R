#lab step #3 create variable for number of bags of chips and number of guests
ChipNumber <- 5
Guests <- 8
#lab step #5 create variable for average chips per guest
AverageChipsEaten <- 0.4
#lab step #7 calculate expected leftover chips including self
TotalChipsEaten <- (Guests + 1) * AverageChipsEaten
LeftoverChips <- ChipNumber - TotalChipsEaten

#lab step #8 make 5 vectors ranking each Star Wars movie
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#lab step #9 index Penny and Lenny's ranking for Episode IV
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#lab step #10 concatenate all sets of rankings into a single data object
AllRankings <- cbind(Self, Penny, Jenny, Lenny, Stewie)

#lab step #11 these three data objects are different
AllRankings
str(PennyIV)
str(Penny)
str(AllRankings)
#PennyIV shows "num 3", Penny shows num [1:7] 5 7 6 3 1 2 4 (all the rankings just by Penny), and AllRankings shows each person and their rankings

#lab step #12 make a data frame for the 5 vectors
DF_Rankings <- data.frame(Self, Penny, Jenny, Lenny, Stewie)
as.DF_Rankings <- as.data.frame(AllRankings)

#lab step #13
dim(AllRankings)
dim(DF_Rankings)
#shows the dimensions of the data matrix and data frame
str(AllRankings)
str(DF_Rankings)
#shows the data matrix and the data frame in the console
typeof(AllRankings)
typeof(DF_Rankings)
#shows the class of the data matrix and data frame ("double", or "list")

##figure out the "=="

#lab step #14 name episodes
I <- "I"
II <- "II"
III <- "III"
IV <- "IV"
V <- "V"
VI <- "VI"
VII <- "VII"

EpisodeNames <- c(I, II, III, IV, V, VI, VII)

#lab step #15 name rows of objects created in steps #10 & #12
row.names(AllRankings) <- EpisodeNames
row.names(DF_Rankings) <- EpisodeNames

#lab step #16 find third row of AllRankings
AllRankings [2,]
