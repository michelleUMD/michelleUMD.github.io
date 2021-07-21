View(DNase)
help(DNase)

#Conditional in which conc < 0.4 become 0, conc >= 0.4 become 1
q1 <- ifelse(DNase$conc < 0.4, 0, 1)

#Since all conc >= 0.4 are stored as 1, we can
#sum these up to get number of conc values that are >= 0.4
q2 <- sum(q1)
print(q2) #Not needed, but to see what the value

#One solution to question 3
if(q2 > 100) {
  print("Enough concentration values to do my experiment")
} else {
  print("Not enough data")
}

#Alternative:
if(q2 <= 100) {
  print("Not enough data")
} else {
  print("Enough concentration values to do my experiment")
}

