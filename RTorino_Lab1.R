# ******************************************************************
#   
#           ** TP1 : R for Arts students, linguists and phoneticians**
#                       (Maelle AMAND)
# 
# ******************************************************************
#  


# Originally, R was made for big calculi. 
# Early computers were often called:
# "number crunching machines".

# So let's start by using it as a claculator...

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@ Basic Maths @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

2+4

777*10

(5+5)*2

67*2

67/0.5


# Your turn, now ! Type a few basic maths formulae and observe the result :



# ________________________________________________________________
# ________________________________________________________________
# ________________________________________________________________

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@ CREATING VECTORS @@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


# Let's give a name to our multiplication : we say "you assign value(s) to a vector"

calcul1 <- 777*10

# Let's check if calcul1 does contain the result of the multiplication. Type :

calcul1

# Your turn, now ! Change the name of the vector and the multiplication : 



# ________________________________________________________________
# ________________________________________________________________
# ________________________________________________________________

# You can even assign a list of words to a vector. When you assign more than one elements 
# you can add a "c" followed by your content in parentheses c(....).   
# Since words are not recognised by default by this
# number crunching machine, we put them in betwee " ".
# Separate the words of the list using a comma.

words <- c("àncora","ancòra","nòcciolo","nocciòlo")
words


# You can even assign sentences to a vector. Just put the sentence  
# in between " ".

sentences <-c("Torino è una città che invita al rigore", "alla linearità, allo stile.", "Invita alla logica", "e attraverso la logica apre alla follia")
sentences


# Your turn ! Change the list of words and assign them to a vector.
# Do the same with sentences:



# ________________________________________________________________
# ________________________________________________________________
# ________________________________________________________________


# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@ MY FIRST FUNCTIONS @@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@ Descriptive statistics @@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Median, mean and mode: essential measures of tendency
# ________________________________________________________________


# R can compute the mean and the median of a list of numbers or of a dataset.
# Mean, median and mode help you get broad tendencies in your data. (cf. suggested videos 
# at the end of the section).

# 1) MEAN
# ________________________________________________________________

# First, prepare a vector that contains your list of numbers.
# Then ask R to compute the mean by typing the word mean and placing your vector in
# parentheses (cf. below).
# We say that we apply a function to a vector.


grades <- c(4,4,8,8,8,5,7,10,9.5)
mean(grades)

# Your turn, now ! Compute the mean by hand using R as a calculator, to check if the function mean is correct.
# Assign your mean to a vector called myMean 
# compare the results. (In bocca al lupo!)

myMean <- (4+4??????)/??
myMean


# 2) MEDIAN
# ________________________________________________________________

# The median is very useful because it is less severely impacted by extreme values
# 
# Experts in real estate...phoneticians suggest using the median rather than the mean:

A median is intrinsically understandable. 
It is the middle number when the values are put in order. End of story. 
– Well not quite – you do have that slightly tricky thing where the sample 
is even and you have to average the middle two terms, 
but apart from that it is easy! (...)
The median is “resistant” because it is not at the mercy of outliers. 
# https://creativemaths.net/blog/median/

# Here is the recipe to compute the median:

# A) Ingredients: chose numeric data (not words)

# B) Cooking: Order your "observations" from smaller to bigger 
(i.e. each item of your numeric data)
# B1) IF your data contains an odd number of "observations"
###### THEN the median is the mid number.
# B2) IF the number of observations is even, 
###### THEN you add the two mid numbers and divide them by 2.

# Your turn, now ! Spot the median in series1. Each time, apply the function median() 
# to your vector to check if you are right.
# The series are fake grades in historical linguistics (out of 20) in different groups.

series1 <- c(4,4,5,7,8,8,8,9.5,10)

series2 <- c(1,2,3,4,5,6,7)

series3 <- c(1, 2.285714, 3.571429, 4.857143, 6.142857, 7.428571, 8.714286, 10)

series4 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)


# Compare the mean and median of these marks in literary translation (from French to English). 
# Some students even got negative grades due to a high number of translation inadequacies.

# At first sight, what is the average mark?
# 3 students have extreme marks, which marks?

serie5 <- c(-70, -56, 2, 4, 4, 5, 5.25 , 5.5, 5.75, 6, 7, 8, 11.5, 15.75)

mean(serie5)
median(serie5)
# Compare the mean and median marks. Which one best represents the general trends in the class for this exam?


# When you have a list of numbers, the function summary() gives you additional info
# What is it? 
# Is the mean and median the same?

summary(serie5)

# Do the same for series 1 to 4







# Your turn ! Get the mean and median of a series of numbers of your choice !
# It can be the height of the participants of this workshop! 
# Apply the function summary() to your vector!




# BONUS
# the function sqrt() is sometimes useful. Can you guess what it does?
sqrt(25)



# You can also get the square or the cube of a number. 

3^2
6^2

# Your turn ! Chose a number and get the square of this number:




# Let's do a bit of deduction !
# We know that 4^2 can help you compute the square of 4, 
# How would you get the result for 4 cubed using RStudio?



# Quick fix video:

# Two minute video to understand how the median mean and modes are computed
# https://www.youtube.com/watch?v=h-OdMTsPE7I
#________________________________________________________________

# Deeper understanding:

# Useful 10 minute introductory videos with baby steps to understanding mean/median/mode
# If you "hate" maths:
# https://www.youtube.com/watch?v=kn83BA7cRNM

# If you're ok with maths:
# https://www.youtube.com/watch?v=h8EYEJ32oQ8
#______________________________________________________________________
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@  FIRST GRAPHS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# A) Only with numeric data (= quantitative data)

# With ONE series of numbers you can either do a scatter plot or a histogram:
# 
# First assign your values to a vector and use the funtion plot().

x <- c(1,2,3,3,3,3,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,8,9,10)
plot(x)

# INTERPRETATION: the vertical axis (x-axis) represents the order of each item in the list (it is called "index" on the plot).
# The vertical axis (y-axis) represents the actual values of the idems of your list.

# With ONE series of numbers you can draw an histogram. It tells you how many times a certain value is present in the data. 

# 

hist(x)
hist(x, col="lightblue")

# INTERPRETATION: 
# The width of the bar represents the range of values comprised in the bar 
# (a bit like the age of people transformed into age groups: 11-20 years old, 21-30 years old...).
# The height of the bar indicates the number of observations that are comprised in the range. 
# Check if this is indeed the case !



# ☆ ∩∩ （ • •）☆
# ┏━∪∪━━━━━━━━┓
# ☆
# ❝ ggplot2 is kawai!❞
# ┗━━━━━━━━━━━┛
# {ggplot2} is a package that revolutionised data visualisation in R. Its soft colours over a grey background is very popular.
# It was designed by Hadley Wickham  (for more info: https://ggplot2.tidyverse.org/) and "gg" stands for grammar of graphics, on which it is based. 

1) Level 1: starts with qplot() before ggplot()
# Observe:
# Look at qplot examples: https://ggplot2.tidyverse.org/reference/qplot.html

# Do:
# For a cute or "kawai" graph, use the function qplot()
# qplot() of the package ggplot2.
# The "q" of qplot() means "quick" plot.
# To use this function, install the package  called ggplot2 
# You need internet for the function install.package()

install.packages("ggplot2")

# Then activate it using: library(ggplot2):
library(ggplot2)

# We say that packages are stored into a library.  
# When you go to a library, you don't use all the books at the same time. You get them one by one.
# This is the same for RStudio, except that some basic packages are activated by default when you open RStudio.

# plot:

qplot(x)

# This is also a histogram, what difference do you see with the first histogram (apart from the colour? ;p)


qplot(x)

# Your turn! Create a histogram with a series of numbers. 
# Name that vector x1
# Use hist(), then qplot() to plot x1




#________________________________________________________________

# # With TWO series of numbers (two variables) you can also do a scatter plot:
# 
# First prepare your two variables
# Then us the function plot() again. Here is an example:

x <- c(1,2,3,3,3,3,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,8,9,10)
y <- c(2,3,4,5,7,7,6,6,6,6,6,6,5,5,5,5,5,4,4,4,3,3,3,3,2,1)
plot(x,y)
qplot(x,y)


# What happens if you type this instead: plot(y,x) ? Is it the same for
qplot(y,x) ?




# Change the last value of vector y from 1 to 10. Do the graph again.
# Observe the difference difference.



# Your turn ! Create 2 vectors containing a series of numbers each.
# Call them x2 et y2. Use plot() and qplot()


# Customise your qplot:
qplot(x,y)

# In the line of code below, add a comma after y and then type geom=c("point", "line")
# Redo the line of code, get rid of "point" but keep "line". 
# Redo the line of code once more but get rid of "line" but keep "point". What does the command geom=c("point", "line") 
# enable you to do?
# change the color of your line by adding , col="blue"




#___________________________________________________________________________________
# You can also do a line graph:
plot(x)
plot(x,type="l") # "l" is an abbreviation for line.
plot(x,type="l", col="red") # observe what happens if you add col="red"




# Create a line graph with your vector called x2 then y2



# In the line: plot(x2,type="l") substitue "l" for "o" and type the new command below.
# New command :


# ...................
# Execute the command. (ctrl+ENTER)
# What is new on the graph?


# Level 2, ggplot graphs



# _________________________________________________________________
# :¨·.·¨:
# `·. ★The goal is to turn data into information, 
#       and information into insight.★°*ﾟ
#                           
#                               (Carly Fiorina, Former CEO of HP)
# _________________________________________________________________


# B) GRAPHS WITH NOMINAL DATA (QUALITATIVE/COUNT DATA)

# When you build a list containing words you need to put these words in between quotation marks.

sex <- c("Uomo","Uomo","Uomo","Uomo","Uomo", "Donna", "Donna", "Donna")
sex

# To use them in statistics, you need to count how many men and how many women there is in the data.
# This is why qualitative data is also called "count data".

# Firstly, count the data and assign it into a vector called counts. The table you get is called a "frequency table".
counts<- table(sex)
counts

# Seconly, plot the frequency table:
barplot(counts)
pie(occurrences)

# Graph with percentages. prop.table() gives you a total out of 1. Multiply it all by 100 and you get percentages.
percentage <- prop.table(table(sexe))*100
percentage

barplot(percentage)
pie(percentage)

# Your turn ! Create a new list and make a graph with counts and with percentages:



# QUICK QUIZ :

# What are these functions for? table(), barplot(), 
# pie() et prop.table(table())

# table() ......................................................

# barplot() ....................................................

# pie() ........................................................

# prop.table(table()) ..........................................

# To get percentages, how to you do?

____________________________________________________________________________________________________________________________________________________________________________

# Real data!

# Use the data set "finaldevoicing" in Dutch. The aim of this data is to understand what triggers final devoicing based on word stress, the type of final consonant etc..
# Ex: hond (meaning dog) is sometimes pronounced /hont/
# Listen to a few words from the data using google translate: 
https://translate.google.fr/?rlz=1C1CHBF_frFR812FR812&um=1&ie=UTF-8&hl=en&client=tw-ob#nl/it/hond%0Atred%0Arib%0Apeg%0A%0A

install.packages("languageR")
library(languageR)

data(finalDevoicing)
help(finalDevoicing)
# Visualise part of the data using either
head(finalDevoicing)
# or
View(finalDevoiceing)

# Each column is called a variable. Try to discuss with a partner to find what each variable refers to.
# First hint: "Voice" means that the final consonant is either "voiced" or "voiceless". The different options in a variable with 
# nominal data are called levels in statistics.

# Use table() and prop.tables() to find what may be best to present certain aspects of the data:
# I chose the column Voice and Obstruent. You can't always put them directly as "Voice" and "Obstruent" since R supposes
# that different datasets may be active in R at the same time and they may contain identical names. 
# Us the name of the dataset first, then add a $ then the name of the variable. Ex: finalDevoicing$Voice 


# Count data:
table(finalDevoicing$Voice, finalDevoicing$Obstruent)

# Percentages. Which code gives clearer results?

prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),2)*100
addmargins(prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),2)*100)
# Plot
barplot(prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),2)*100, legend=T, col=c("coral","turquoise"))

prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),1)*100 
addmargins(prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),1)*100)
# Plot
barplot(prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),1)*100, legend=T, c("coral","turquoise"))

# Your turn, discuss with a partner to find what else may seem to affect final devoicing in Dutch. 
# Adapt the codes above to visualise other variables, but always keeping the variable Voice.

# Count data:

------------------------------------------------------------------------
# Percentages:

------------------------------------------------------------------------

# Plot:

------------------------------------------------------------------------

Well done!


# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@ GENERAL QUIZ @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# What are these functions for? mean() et sqrt()

# Answer: ..........................................

# If you want the sum of a list, which is the most probably function below?
# (go on! Have a try at them all!)

# a) somme() b) SUM() c) sum() d) Sum()

# Anwer: ..........................................


# In the line of code below, what is the vector ?

sex <- c("Uomo","Uomo","Uomo","Uomo","Uomo", "Donna", "Donna", "Donna")

# Answer : ..........................................



# Which graphs enable you to represents 1 or 2series of numbers ?

# Reponse: ..........................................



# Comment peut-on creer un graphique avec une ligne ?

# Answer: ..........................................


# Replace the question marks by the right symbol:

# Ex: mots <- c(?homme?, ?femme?.....)



# What function enables you to create a barplot?

# Answer: ..........................................


# What function enables you to create a pie chart?

# Answer: ..........................................


# How to you count the occurrences of one or two series of words?

# Answer: ..........................................

# How do you convert the count data into percentages ?

# Reponse: ..........................................




# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@ MY SKILLS AT THE END OF THE SESSION @@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


# I know how to: 
# Do basic calculi with R : Yes/ No
# Do the mean of a series of numbers : Yes/ No
# Get the sumb of a series of numbers: Yes/ No
# Get the square root of a series of numbers: Yes/ No

# I know how to: 
# Use the function summary(): Yes/ No
# Create a vector: Yes/ No
# Assign nominal data to a vector: Yes/ No

# I can make a graph with :
# A series of numbers: Yes/ No
# 2 series of numbers:  Yes/ No
# A series of nominal data: Yes/ No
# 2 series of nominal data: Yes/ No

# I can also:
# Install and load a package: Yes/ No
# Load some pre-installed data in R: Yes/ No
# Use the help function to understand the data: Yes/ No

# How many "Yes" do you have ? How many "No" ?