#Lesson 2 Code

#This is a built-in dataset 
#extra = increase/decrease in hours of sleep
#group = treatment group
#ID = student identifier
print(sleep)

#Create variable data
#data is a copy of the sleep data
#so printing it will print the same numbers
data <- sleep
print(data)

#PEMDAS: 3/2 first, then *4, then 5 + __ - 5
#Answer is 6
print(5 + 3    / 2 * 4 - 5)

#Vectors: can assign them to variables
#And use math on them
nums <- c(1, 2, 3, 4)
print(nums * 2)

nums_doubled <- nums * 2
print(nums_doubled)


#These are all vectors part of the sleep 
#dataset that we can print out
print(sleep$extra)
print(sleep$group)
print(sleep$ID)

#Create vector that stores sleep$extra as minutes
sleep_difference_minutes <- sleep$extra * 60

