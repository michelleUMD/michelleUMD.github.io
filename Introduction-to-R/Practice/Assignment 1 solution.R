#ChickWeight is our dataset
#We can use help to learn about this dataset
help(ChickWeight)

#To see the dataset,
View(ChickWeight)


#Convert weight (grams) to kilograms
q1 <- ChickWeight$weight * 0.001
print(q1) #Not required, but if you wanted to see the actual value


#Find min, max, mean, median of weights in kg
q2a <- min(q1)
q2b <- max(q1)
q2c <- mean(q1)
q2d <- median(q1)
#Note: summary() computes all of these in one function
#But to separately refer to each min/max/etc value, call each function


#The number of weight measurements = number of rows
q3 <- nrow(ChickWeight)
print(q3)

