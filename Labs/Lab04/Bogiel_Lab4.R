#lab step 1 - write a "for loop" that prints the word "hi" to the console 10 times
for ( i in seq(1, 10) ) {print("hi")}
  
#lab step 2 - write a loop that prints Tim's total amount of money each week for 8 weeks
StartMoney <- 10
allowance <- 5
GumMoney <- 1.34 * 2
weeks <- seq(from = 1, to = 8, by = 1)
AllowanceAfterGum <- allowance - GumMoney
AllowanceTotal <- length(weeks)
savings <- rep(0, AllowanceTotal)
for ( i in 1:AllowanceTotal) {
  (savings[i] <- StartMoney + (AllowanceAfterGum * weeks[i]))
}
print(savings)

#lab step 3 - find expected population size for next 7 years
Pop <- 2000
Shrink <- .05
for ( i in seq(1, 7)) {
  Pop <- Pop - (Pop * Shrink)
  print(Pop)
}

#lab step 4 - predict the value of n[12]
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

#lab step 5a
step5a <- rep(0, 18)
print(step5a)

#lab step 5b
value <- 3
for ( i in seq(1, 18) ) {
 (step5a[i] <- value * i ) 
}
print(step5a)

#lab step 5c
step5c <- rep(0, 18)
#replace the first index position in the vector step5c to equal 1
step5c[1] <- 1
print(step5c)

#lab step 5d
for ( i in 2:length(step5c)) {
  step5c[i] <- 1 + (2 * step5c[i - 1])
}
print(step5c)

#lab step 6 - Fibonacci sequence
Fib <- rep(0, 20)
Fib[2] <- 1
#make a vector of the first 20 numbers where the first number is 0
for (r in 3:length(Fib)) {
  Fib[r] <- Fib[r - 2] + Fib[r - 1]
}
print(Fib)

#lab step 7 - redo lab step 4 
#step 4 is on lines 25-39
#create a time vector
t <- 1:12
#create a plot with time and abundance (t,n)
plot(t, n)
#shows abundance as it reaches K