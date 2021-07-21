#Lecture 3 sample code

#sleep is a built-in dataset
View(sleep)
?sleep
#sleep$extra stores hours difference in sleep
#students experienced after taking a certain drug

#Functionsbelow take vectors as parameters
mean(sleep$extra)
median(sleep$extra)
min(sleep$extra)
max(sleep$extra)

#we can store the result into a variable
sleep_diff_summary <- summary(sleep$extra)

#Can read more about functions in documentation
help(mean)


#Why is the first one bad?
mean_calculation_bad <- sum(sleep$extra)/20
print(mean_calculation_bad)

mean_calculation_good <- sum(sleep$extra)/nrow(sleep)
print(mean_calculation_good)

#Do not hardcode:
#Easy place for mistakes to occur
#If dataset changes, your hard-coded value will not change 

