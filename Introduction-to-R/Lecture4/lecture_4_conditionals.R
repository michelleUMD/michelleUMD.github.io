#Can have a lone if statement
#code inside if statement runs
#when the condition x > 0 is true
x <- 2
if(x > 0) {
  print("x is positive")
}

#if followed by else
#code in else runs if condition in if is false
x <- 2
if(x > 0) {
  print("x is positive")
} else {
  print("x is negative")
}

#if followed by else
#code in else runs if condition in if is false
x <- 2
if(x > 0) {
  print("x is positive")
} else if(x == 0) {
  print("x is zero")
} else {
  print("x is negative")
}


#If number of students in sleep
#is less than 20, dataset is too small
#else dataset is large
if(nrow(sleep) < 20) {
  print("dataset is too small")
} else {
  print("This is a large dataset")
}

#This is equivalent to the above
#what about if(nrow(sleep) > 20)?
#Notice we switched the conditions
#but also switched what gets printed
if(nrow(sleep) >= 20) {
  print("This is a large dataset")
} else {
  print("dataset is too small")
}


#else if condition checked after if condition
if(nrow(sleep) < 20) {
  print("dataset is too small")
} else if(nrow(sleep) < 30) { #has to be between [21, 30)
  print("Acceptable size")
} else if(nrow(sleep) < 40) {
  print("Medium size")
} else {
  print("This is a large dataset")
}


#And and Or examples
#And: both conditions need to be true
#Or: only one condition needs to be true
if(5 < 6 & 4 < 5) {
  print("Both conditions are true")
}
#Note: the first condition 5 < 2 is false
if(5 < 2 | 4 < 5) {
  print("At least one condition is true")
}

#ifelse() used with vectors
#Checks condition against every element
#in the vector
vector1 <- c(-4, -3, -2, -1, 0, 1, 2)
vector2 <- ifelse(vector1 < 0, -1, 1)

print(vector1)
print(vector2)

#Relating this back to sleep dataset:

#If group is 1, person is in control group
#If group is 2, person is in experimental group
group <- ifelse(sleep$group == 1, "control", "experimental")
print(group)


#How many people gained sleep in this dataset?
#If person gained sleep, store 1 in vector, else store 0
#Sum of this new vector is the number of 1's, which is 
#number of people who gained sleep
sleep_gained <- ifelse(sleep$extra > 0, 1, 0)
print(sleep_gained)
sum(sleep_gained)
