#Make sure we add na.strings = "" to our argument list
#This tells R that blank cells (empty quotes "") are because data is missing
data <- read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/Missing Data Example.csv", na.strings="")

#Let's take a look at our data
print(data)

#Review of summary function
#Notice on the right-most side, number of NA's is listed
summary(data$VITAMIN_D)
summary(data$HEIGHT)
summary(data$SEX)

#To remove all data, use na.omit(name of variable containing data)
na.omit(data)

#Let's store our data with all NA's omitted into a variable
all_NA_omitted <- na.omit(data)

#Now we only have 4 rows of data :(
print(all_NA_omitted)

#We may have ommited too many people there!
#What if we didn't want to omit all NAs?
#What if we only wanted to omit people whose VITAMIN_D and HEIGHT
#were unknown? We don't really care about if SEX is missing
omit_NA_if_unknown_vitD_height_data <- data[complete.cases(data[ , c("VITAMIN_D", "HEIGHT")]), ]

#Let's look at our data again
#Now there are 6 people! 
print(omit_NA_if_unknown_vitD_height_data)

################################################################################################################

#heart_missing dataset has missing values
heart_missing <- read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/heart_missing.csv", na.strings = "NA")
nrow(heart_missing) #303 people

#Let's exclude the people whose data is incomplete
complete_heart <- na.omit(heart_missing)
nrow(complete_heart) #294 people (9 people with missing data omitted) 

#We can combine the previous two functions into one single one
#We nest read.csv inside na.omit
complete_heart <- na.omit(read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/heart_missing.csv", na.strings = "NA"))
nrow(complete_heart)

#Some functions have an argument for na.rm
median(heart_missing$target)
median(heart_missing$target, na.rm = TRUE)
median(heart_missing$target)

#Numeric variables are by default continuous
#This makes sense for cholesterol
summary(complete_heart$chol)

#In this dataset, 0 = Female, 1 = Male
summary(complete_heart$sex)
#Wait! This doesn't make sense. What does mean 0.6832 even mean?
#sex is supposed to be a categorical variable
#So we can't calculate mean or median on it

#Previously, we used sum() to add up all the 1's which were males
#This method works, but it is tedious because if there were more options (0, 1, 2, 3, etc. )
#We would have to keep turning one group into 1 and them summing that vector up

#factor() is a function that gets a categorical version of a variable
?factor

#Now this is better
sex_factor <- factor(complete_heart$sex)
summary(sex_factor)

sex_factor <- factor(complete_heart$sex, labels = c("Female", "Male"))
summary(sex_factor)

#Let's try this for smoking (0 = non-smoker, 1 = smoker)
smoking_factor <- factor(complete_heart$smoking)
summary(smoking_factor)
#labels are optional but can be helpful to know what each number represents
smoking_factor <- factor(complete_heart$smoking, labels = c("non-smoker", "smoker"))
summary(smoking_factor)


#Let's group BMI by classifications of the World Health Organization
# <18.5 = underweight, >=18.5 to <25 = normal, >=25 to <30 = pre-obese, >=30 = obese
#There are two ways to do this
BMI_WHO <- factor(ifelse(complete_heart$BMI < 18.5, "underweight", ifelse(complete_heart$BMI < 25, "normal", ifelse(complete_heart$BMI < 30, "pre-obese", "obese"))))
summary(BMI_WHO)

BMI_WHO <- factor((complete_heart$BMI>=18.5) + (complete_heart$BMI>=25) + (complete_heart$BMI>=30), labels=c("Underweight","Normal","Pre-obese","Obese"))
summary(BMI_WHO)


#We use subset() to get a subset of our data
?subset

#If we were only interested in part of our data, we subset it
#BMI_obese_data contains people who are obese 
BMI_obese_data <- subset(complete_heart, BMI_WHO == "Obese")
View(BMI_obese_data)

#Use this new variable as a new dataset
mean(BMI_obese_data$chol)

#Other examples of subset:
#Create dataset non_smokers and dataset smokers
#Then compare mean cholesterol levels between them
smoking_factor <- factor(complete_heart$smoking, labels = c("non-smoker", "smoker"))
summary(smoking_factor)

#Either way here works because we have created smoker_factor
non_smokers <- subset(complete_heart, complete_heart$smoking == 0)
non_smokers <- subset(complete_heart, smoking_factor == "non-smoker")

#Either way here works because we have created smoker_factor
smokers <- subset(complete_heart, complete_heart$smoking == 1)
smokers <- subset(complete_heart, smoking_factor == "smoker")

summary(non_smokers$chol)
summary(smokers$chol)


#Another In-class exercise solution: ages across cholesterol groups 
chol_factor <- factor((complete_heart$chol >= 200) + (complete_heart$chol >= 240), 
                                  labels = c("desirable", "borderline high", "high"))

#Compare age in each cholesterol group
desirable_chol <- subset(complete_heart, chol_factor == "desirable")
summary(desirable_chol$age)
borderline_high_chol <- subset(complete_heart, chol_factor == "borderline high")
summary(borderline_high_chol$age)
high_chol <- subset(complete_heart, chol_factor == "high")
summary(high_chol$age)

#Compare BMI in each cholesterol group
summary(desirable_chol$BMI)
summary(borderline_high_chol$BMI)
summary(high_chol$BMI)


#Back to sleep dataset:
control_group <- subset(sleep, sleep$group == 1)
experimental_group <- subset(sleep, sleep$group == 2)
mean(control_group$extra)
mean(experimental_group$extra)
#In a future lecture, we'll learn how to actually 
#calculate the statistical significance of this difference 

