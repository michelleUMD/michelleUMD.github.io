#################################################
#read file with read.table()                    #
#################################################
help(read.table) 

#First parameter is a file path
#header by default false, but can set to true if there is a header row
txt_file <-read.table(file = "C:\\Users\\miche\\Desktop\\STIC\\Read File Examples\\read_table_example.txt", header = TRUE)
print(txt_file)

#################################################
#Read in a file with function read.csv()        #
#################################################
help(read.csv)

#Parameters: takes a file path
csv_file <- read.csv("C:\\Users\\miche\\Desktop\\STIC\\Read File Examples\\read_csv_example.csv")
print(csv_file)

#accessing row and column elements
print(txt_file[1,1])
print(txt_file[1,])
print(txt_file[,1])

#equivalent to txt_file[, 1]
print(txt_file$Column1)


heart <- read.csv("C:\\Users\\miche\\Desktop\\STIC\\Read File Examples\\heart.csv")
#Will print many rows
print(heart)
#Like print() but opens a new window
View(heart)

#Generate summary of the age column
#These two are equivalent
summary(heart$age)
summary(heart[,1])

#sex_MF stores "M" if sex is 1, "F" if sex is 0
sex_MF <- ifelse(heart$sex == 1, "M", "F")
print(sex_MF)

#Since males = 1, we can sum this
num_males <- sum(heart$sex)
print(num_males)
#Assuming there are only 1's and 0's in the dataset, 
#subtract number of males from total people to get number of females
num_females <- nrow(heart) - sum(heart$sex)
print(num_females)

#Number of smokers (smoking = 1 if person is a smoker)
num_smokers <- sum(heart$smoking)
print(num_smokers)

#How many people above the mean age?
mean_age <- mean(heart$age)
above_mean_age <- ifelse(heart$age > mean_age, 1, 0)
sum(above_mean_age)
