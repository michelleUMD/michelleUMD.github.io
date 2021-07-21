#Code from assignment 3
#Read in data
finch_beaks_1975 <- read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/finch_beaks_1975.csv", na.strings = "Missing")
View(finch_beaks_1975)
finch_beaks_2012 <- read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/finch_beaks_2012.csv", na.strings = "NA")
View(finch_beaks_2012)

#New datasets with NA values omitted
finch_beaks_1975 <- na.omit(finch_beaks_1975)
finch_beaks_2012 <- na.omit(finch_beaks_2012)

#Fortis species only
fortis_1975 <- subset(finch_beaks_1975, finch_beaks_1975$species == "fortis")
fortis_2012 <- subset(finch_beaks_2012, finch_beaks_2012$species == "fortis")

#Question 1
plot(x = fortis_1975$blength, y = fortis_1975$bdepth, 
     main = "1975 beak depth vs beak length",
     xlab = "beak length (mm)",
     ylab = "beak depth (mm)")

plot(x = fortis_2012$blength, y = fortis_2012$bdepth, 
     main = "2012 beak depth vs beak length",
     xlab = "beak length (mm)",
     ylab = "beak depth (mm)")
# In 2012, there appears to be greater variation/scatter in 
# points with higher beak length and depth

#Question 2
q2a <- lm(fortis_1975$blength ~ fortis_1975$bdepth)
print(q2a)
q2b <- lm(fortis_2012$blength ~ fortis_2012$bdepth)
print(q2b)

#Question 3
summary(q2a)
summary(q2b)

q3a <- 0.75347 
q3b <- 3.65342
q3c <- 0.6826 	#If you put the adjusted R^2 that's also fine 
q3d <- 0.80216 
q3e <- 3.60861
q3f <- 0.5289	#If you put the adjusted R^2 that's also fine 

#Slope for 1975: 0.75347
#Slope for 2012: 0.80216    
#Slope increased, but pretty similar

#Intercept for 1975: 3.65342
#Intercept for 2012: 3.60861
#Intercept slightly decreased, also pretty similar 

#R^2 for 1975: 0.6826 
#R^2 for 2012: 0.5289
#R^2 slightly decreased 


##########################################################################################
#Note: for questions 4-5, I wasn't clear that these were supposed to be for fortis only
#So, if you did the analysis on the whole dataset that's also fine
#Normally, you would want to stratify by species to control for differences between species
##########################################################################################

#Question 4
mean(fortis_1975$blength)
mean(fortis_2012$blength)
#Is the difference between these two statistically significant?

t.test(x= fortis_1975$blength, 
       y = fortis_2012$blength, 
       alternative = "two.sided", 
       var.equal = TRUE)
q4 <- 0.513 #Not statistically significant, cannot conclude difference in mean beak length
        
#Question 5
mean(fortis_1975$bdepth)
mean(fortis_2012$bdepth)
#Is mean in 2012 < mean in 1975?

#alternative = "greater" becasue we hypothesize fortis_1975$bdepth > fortis_2012$bdepth
#you can also switch x and y and then have "less" as your alternative hypothesis 
t.test(x = fortis_1975$bdepth, 
       y = fortis_2012$bdepth, 
       alternative = "greater", 
       var.equal = TRUE)
q4 <- 2.308e-12
#Reject null hypothesis, beak depth in 2012 likely less than that of 1975
#Note that you can directly store scientific notation into variables 
