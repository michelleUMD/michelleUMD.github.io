#Question 1:
finch_beaks_1975 <- read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/finch_beaks_1975.csv", na.strings = "Missing")
View(finch_beaks_1975)
finch_beaks_2012 <- read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/finch_beaks_2012.csv", na.strings = "NA")
View(finch_beaks_2012)

#New datasets with NA values omitted
finch_beaks_1975 <- na.omit(finch_beaks_1975)
finch_beaks_2012 <- na.omit(finch_beaks_2012)

#Question 2:
#Since data in the species column are characters (words), 
#We do not need to call factor() on this column
q2a <- summary(finch_beaks_1975$species)
print(q2a)
q2b <- summary(finch_beaks_2012$species)
print(q2b)


#Question 3
#Start off by subsetting data to separate species out
fortis_1975 <- subset(finch_beaks_1975, finch_beaks_1975$species == "fortis")
scandens_1975 <- subset(finch_beaks_1975, finch_beaks_1975$species == "scandens")

fortis_2012 <- subset(finch_beaks_2012, finch_beaks_2012$species == "fortis")
scandens_2012 <- subset(finch_beaks_2012, finch_beaks_2012$species == "scandens")

q3a <- mean(fortis_2012$blength) - mean(fortis_1975$blength)
print(q3a) #mean beak length shorter by 0.04 mm
q3b <- mean(scandens_2012$blength) - mean(scandens_1975$blength)
print(q3b) #mean beak length shorter by -0.7 mm

#Question 4
#First use boolean logic to separate continuous bdepth into three groups
#Then use factor to turn it into a categorical variable
#Finally, call summary() on it to get the distribution 
q4a <- summary(factor((scandens_1975$bdepth >= 9) + (scandens_1975$bdepth > 10), labels = c("too narrow", "most fit", "too wide")))
print(q4a)
q4b <- summary(factor((scandens_2012$bdepth >= 9) + (scandens_2012$bdepth > 10), labels = c("too narrow", "most fit", "too wide")))
print(q4b)
