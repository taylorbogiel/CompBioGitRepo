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
AllRankings == DF_Rankings
  #tests if elements of the data matrix and data frame are equal (They all are)
all(AllRankings == DF_Rankings)
  #tests if all elements of the data matrix and data frame are equal (They all are)
typeof(AllRankings)
typeof(DF_Rankings)
  #shows the class of the data matrix and data frame ("double", or "list")

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

#lab step #16 access third row of AllRankings
AllRankings [3,]

#lab step #17 access the fourth column of DF_Rankings
DF_Rankings [, 4]

#lab step #18 access Self ranking for Episode V
DF_Rankings [5, 1]

#lab step #19 access Penny's ranking for Episode II
DF_Rankings [2, 2]

#lab step #20 access AllRankings for Episodes IV - VI
AllRankings [4:6, ]

#lab step #21 access AllRankings for Episodes II, V, and VII
AllRankings [c(2, 5, 7), ]

#lab step #22 access rankings for just Penny, Jenny, and Stewie for just Episodes IV and VI
AllRankings [c(4, 6), c(2, 3, 5)]

#lab step #23 switch Lenny's rankings for Episodes II and V
LennyII <- AllRankings [2, 4]
LennyII
  #create a new variable for Lenny's ranking of Episode II
  #this could also be done with LennyII <- AllRankings ["II", "Lenny"]
AllRankings [2, 4] = AllRankings [5, 4]
AllRankings [2, 4]
AllRankings [5, 4]
  #make Lenny's ranking of Episode II equal to Lenny's ranking of Episode V
AllRankings [5, 4] = LennyII
AllRankings [5, 4]
LennyII
AllRankings [2, 4]
  #make Lenny's ranking of Episode V equal to the new LennyII vector

#lab step #24 use names rather than indexes to access Penny's ranking from Episode III in the data matrix and data frame
AllRankings["III", "Penny"]
DF_Rankings["III", "Penny"]

#lab step #25 use names rather than indexes to undo lab step #23
AllRankings ["V", "Lenny"] = AllRankings [ "II", "Lenny"]
AllRankings ["II", "Lenny"] = LennyII
AllRankings ["V", "Lenny"]
LennyII
AllRankings ["II", "Lenny"]

#lab step #26 use the "$" operator to re-do lab the switch from lab step #23
DF_Rankings$Lenny [2] = DF_Rankings$Lenny [5]
DF_Rankings$Lenny [5] = LennyII
DF_Rankings [5, 4]
LennyII
DF_Rankings [2, 4]
  #Error in AllRankings$Lenny : $ operator is invalid for atomic vectors
  #Must use DF_Rankings instead of AllRankings