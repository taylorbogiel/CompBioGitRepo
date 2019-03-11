# Lab08: Documentation and Metadata

## Objectives
1. Practice creating metadata files for your work
2. Practice using Markdown

## Step 1
Complete the Markdown tutorial available at [http://www.markdowntutorial.com/](http://www.markdowntutorial.com).

## Step 2
Re-write the README for class repo in markdown.

## Step 3
### A:Create a new script for Lab08 using code from Lab04.

### B:Turn the logistic growth model code into a function with arguments (r, K).
```
LogisticGrowthModel <- function(r, K, InitPop) {
  t <- 1:12
  n <- rep(InitPop, 12)
  for ( t in 2:12) {
    n[t] <- n [t - 1] + ( r * n [t - 1] * (K - n [t - 1]) / K)
  }
  return(n)
}
```

### C:Add code to the function to produce a plot of abundance over time.
```
LogisticGrowthModel <- function(r, K, InitPop, TotalGens) {
  n <- rep(InitPop, TotalGens)
  NumTimes <- 1:TotalGens
  for ( t in 2:12) {
    n[t] <- n [t - 1] + ( r * n [t - 1] * (K - n [t - 1]) / K)
  }
  plot(NumTimes, n)
  return(n)
}
```

### D:Write a line of code that calls the function with your chosen parameter values.
```
LogisticGrowthModel(0.5, 5000, 1500, 15)
```

### E:Write a line of code that writes the data set to a file. The data file should have two columns: "Generations", "Abundance"
#### Create a matrix to properly display columns
```
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
```

```
write.csv(x = LogisticGrowthMatrix, file = "Bogiel_Lab08GrowthMatrix.csv")
```

### F:Make a new [markdown](https://github.com/flaxmans/CompBio_on_git/blob/master/Labs/Lab08/Lab08_documentation_and_metadata.md) document explaining the script.
![Logistic Growth Plot](https://github.com/taylorbogiel/CompBioGitRepo/blob/master/Labs/Lab08/LogisticGrowthPlot.PNG?raw=true)

 Make a new markdown document explaining the script.
 This markdown document will be the metadata file that explains the script, the model it contains, what it does, and the specific data that were written to the data file.
 Use headings, bulleted lists, and other capabilities of markdown as you see fit.
 Make the document look good, easily readable, and functional.