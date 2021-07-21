#Import the dataset and omit the NA's 
complete_heart <- na.omit(read.csv("C:/Users/miche/Desktop/STIC/Read File Examples/heart_missing.csv", na.strings = "NA"))
nrow(complete_heart)

#Plot cholesterol vs BMI
plot(complete_heart$BMI, complete_heart$chol)
linear_model <- lm(complete_heart$chol ~ complete_heart$BMI)
abline(linear_model)

#Does smoking modulate the relationship between cholesterol and BMI?
non_smokers <- subset(complete_heart, complete_heart$smoking == 0)
smokers <- subset(complete_heart, complete_heart$smoking == 1)

plot(smokers$BMI, smokers$chol)
plot(non_smokers$BMI, non_smokers$chol)

#We can compare the slopes and intercepts of these two lines
#Model stratifies by smoking status
model_smoker <- lm(smokers$BMI ~ smokers$chol)
summary(model_smoker)
model_non_smoker <- lm(non_smokers$BMI ~ non_smokers$chol)
summary(model_non_smoker)


