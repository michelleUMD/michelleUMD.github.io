#Package/library needed to read in Excel files
install.packages("readxl")
library(readxl)

#Function read_excel takes file path
#We can specify na values with argument na = "__" (DIFFERENT from na.strings like in read.table)
heart <- read_excel("C:/Users/miche
                    /Desktop/STIC/Read 
                    File Examples/heart_excel.
                    xlsx", na = "NA")
View(heart)















#All install.pacakge() and library() functions usually all go at the top of the script for organization
#But for demonstration purposes, in order of usage
install.packages("tableone")
library(tableone)

#To create a table 1 manually: as we have learned
#Note: sd() calculates standard deviation
num_participants <- nrow(heart)
print(num_participants)

?mean #another arguments allows us to remove NA values when calculating mean
mean_age <- mean(heart$age, na.rm = TRUE)
print(mean_age)
age_standard_deviation <- sd(heart$age, na.rm = TRUE)
print(age_standard_deviation)

num_males_females <- summary(factor(heart$sex))
print(num_males_females)

mean_cholesterol <- mean(heart$chol, na.rm = TRUE)
print(mean_cholesterol)
cholsterol_standard_deviation <- sd(heart$chol, na.rm = TRUE)
print(cholsterol_standard_deviation)

mean_resting_blood_presssure <- mean(heart$trestbps, na.rm = TRUE)
print(mean_resting_blood_presssure)
resting_blood_presssure_standard_deviation <- sd(heart$trestbps, na.rm = TRUE)
print(resting_blood_presssure_standard_deviation )
#... for many variables
#SO MUCH WORK!!








###############################################################################################
#Solution: tableone package has a function called CreateTableOne()
#vars = ALL variables you want to include in table
#data = variable containing your dataset
#includeNA = FALSE to not include, TRUE to include

#Right now sex is shown as 0 and 1, but we want to label it as female/male
heart$sex <- factor(heart$sex, labels = c("female", "male"))

#create the table, don't include missing data 
table1 <- CreateTableOne(vars = c("age", "sex", "chol", "trestbps"), data = heart, includeNA=FALSE)

#Print table
print(table1)

#Show all categories of categorical variables 
print(table1, showAllLevels = TRUE)












########################################################################################################
#In-class exercise solution

#Repeated from previous code, make sex into categorical variable 
heart$sex <- factor(heart$sex, labels = c("female", "male"))

#Create categorical BMI groupings according to WHO 
heart$BMI <- factor((heart$BMI >= 18.5) + (heart$BMI >= 25) + (heart$BMI >= 30), labels = c("Underweight", "Normal","Overweight","Obese"))
summary(heart$BMI)

#Create categorical smoking variable 
heart$smoking <- factor(heart$smoking, labels = c("non-smoker", "smoker"))
summary(heart$smoking)

table1 <- CreateTableOne(vars = c("age", "sex", "trestbps",  "BMI", "smoking"), 
                         data = heart, 
                         includeNA = TRUE) #Include number of NA's in case of non-response bias

print(table1, showAllLevels = TRUE)

#################################################################################################
#One last table 1, stratified by sex to see if sex is associated with the other variables
#You have learned most of this, but don't worry so much about being able to reproduce this on 
#the final exam, but rather understanding that packages make programmers' lives so much better

#strata = stratify by sex, does association exist?
table1_stratified <- CreateTableOne(vars = c("age", "trestbps",  "BMI", "smoking", "chol"), 
                                    data = heart, 
                                    strata = c("sex")) 

#exact = use fisher's exact test for BMI
print(table1_stratified,  exact = c("BMI"), showAllLevels = TRUE)

##################################################################################
#Interactive figures
install.packages("shiny")
library(shiny)
runExample("01_hello")



#The following code was obtained from this source
#https://shiny.rstudio.com/gallery/word-cloud.html

#install.packages(c("tm", "worldcloud", "memoise", "Rtools"))
library(tm)
library(wordcloud)
library(memoise)

# The list of valid books
books <<- list("A Mid Summer Night's Dream" = "summer",
               "The Merchant of Venice" = "merchant",
               "Romeo and Juliet" = "romeo")

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(book) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  if (!(book %in% books))
    stop("Unknown book")
  
  text <- readLines(sprintf("./%s.txt.gz", book),
                    encoding="UTF-8")
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})

# Text of the books downloaded from:
# A Mid Summer Night's Dream:
#  http://www.gutenberg.org/cache/epub/2242/pg2242.txt
# The Merchant of Venice:
#  http://www.gutenberg.org/cache/epub/2243/pg2243.txt
# Romeo and Juliet:
#  http://www.gutenberg.org/cache/epub/1112/pg1112.txt
# Server logic
server <- function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection)
      })
    })
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
}

ui <- fluidPage(
  # Application title
  titlePanel("Word Cloud"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("selection", "Choose a book:",
                  choices = books),
      actionButton("update", "Change"),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)


shinyApp(ui, server)




#Another example of COVID Case tracking
#https://vac-lshtm.shinyapps.io/ncov_tracker/?_ga=2.105758467.1856052981.1605744707-271721134.1602878123
#https://github.com/eparker12/nCoV_tracker
