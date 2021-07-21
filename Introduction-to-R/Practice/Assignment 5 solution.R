#Question 1: install.packages(), then library()
#Installation, only needed once for your computer, unless you uninstall R
install.packages("ggplot2") 
#Load package, need to run this line everytime you open your script 
library(ggplot2)


#Question 2: no correct answer, so here's an example
bsci238c <- data.frame(facts = c("R is the best language", 
              "That random pizza analogy with functions",
              "Michelle is a strange person"), 
              value = c(60, 5, 40))
ggplot(bsci238c, aes(x="", y = value, fill = facts)) +
  geom_bar(width = 1, stat = "identity") +
  labs(title = "Things I learned in BSCI238c") + 
  coord_polar(theta = "y", start=0)

#Question 3: no correct answer, so here's an example
#3a
install.packages("cowsay")
library("cowsay", quietly = TRUE, warn.conflicts = FALSE)

#3b
#cowsay produces cat facts

#3c & 3d
#You can run this say function any number of times, 
#and it will produce a different cat fact
say("catfact", "cat")



