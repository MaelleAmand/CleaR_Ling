
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@ TEST STATISTICS @@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# In this section, you will learn how to perform 
# - a correlation test.
# - chisquare test
# - an ANOVA

# 1) CORRELATION TEST: 2 NUMERIC variables
# ________________________________________________________________
# The correlation test is helpful to compare 2 NUMERIC variables and check if they are correlated.
# Examples: 
# - If the age of a participant (variable 1) determines the score in a fast reading task (variable 2)
# - If the mean intensity of a vowel changes (variable 1), F0 also changes (variable 2)
# - If the number of years studying a language (variable 1) is linked to the number of words you know in a foreign language (var 2)

cor.test(x,y)
cor.test(x1,y1)


# Let's do it with real data! 

#data 1 called "indoVowels". Let's use the formant frequencies of indonesian vowels included in the R package
# Install and load the {phonR} package

install.package(phonR)
library(phonR)

# 1) Load the data (using indoVowels but then use indo)
data(indoVowels)
# 2) Check what's inside:
head(indo)
# 3) Plot the vowels to see how it looks like:
with(indo, plotVowels(cbind(f1, f1a, f1b), cbind(f2, f2a, f2b), vowel,
                      group=gender, plot.tokens=TRUE, pch.tokens=NA,
                      alpha.tokens=0.3, plot.means=TRUE, pch.means=vowel,
                      var.col.by=vowel, var.sty.by=gender, pretty=TRUE,
                      diph.arrows=TRUE, diph.args.tokens=list(lwd=0.8),
                      diph.args.means=list(lwd=2)))

# Do a correlation test to see if a change in f1 is linked to a change in f2 (even though we know this is the case).
# to use a column (f1) from a dataset (indo), you often have to call it: indo$f1
# Complete the command accordingly:

cor.test(indo$f1,       )

# Copy and paste the results below. Once pasted, select the results and type CTRL+SHIFT+C. The results will be considered 
# as a commentary so R will not execute them as a function or a command.

# To interpret the p-value:
# 1) Make a hypothesis called H zero, which posits the absence of correlation: "F1 is NOT correlated with F2".
# 2) Look at the p-value: p-value = 1.616e-06  e-06 indicates that you actually have: 0.000001616 (shift the "." 6 times towards the left, 1.61*(1/10^6)).
# This indicates that the value is very small. In an article you can say p <.00001. 
# 3) If this p-value is below the critical value of 0.05, then we say that you cannot fail to reject H zero. Hence, "F1 IS correlated with F2".


# Your turn! Install the package {phonTools}, load the data called h95. 
# To understand what kind of data this is type: help(h95)
# Write down a few lines about what the data is about. Based on what you read in the help section.

# plot the data:
with(h95, plotVowels(f1, f2, vowel, plot.means=TRUE,
                      pch.means=vowel, ellipse.line=TRUE, var.col.by=vowel,
                      pretty=TRUE, alpha.tokens=0.3,
                      cex.means=2))


# Perform 3 correlation tests: 
______________________________________________
# 1) to see if duration is correlated with f0
# a) plot:
qplot(h95$dur, h95$f0)
# b) test:

# 2) to see if duration is correlated with f2
# a) plot:
qplot(h95                       )
# b) test:

# 3) to see if f1 is correlated with f2
# a) plot:
qplot(h95                       )
# b) test:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


2) Chi-square test: TWO NOMINAL variables
____________________________________________________________

A chi-square test is useful if you have two nominal variables and want to check if they are significantly linked. Constraint: normally, there must be at least 5 items in each condition.

Examples:

Based on a sample of people from Turin, do people with blue eyes generally have blond hair?

Is the verb « believe » generally followed by « that » or is it more generally followed by a subordinate clause ?

Is the use of the expression « camomillarsi » in Italian significantly linked to adolescent speech in a corpus of spontaneous speech by middle-aged and adolescent.

In a perception test of three vowels, with two/three groups of participants tested in different conditions, is there a significant difference of perception between the groups?


A) Let's do it with real data.
*********************************************
library(languageR)
data(finalDevoicing)

#Research question: we would like to know if final devoicing in Dutch depends on the type of consonant placed at the end of a word.
# Count the data first:
counts<- table(finalDevoicing$Obstruent,finalDevoicing$Voice)

# Plot with barplot:
barplot(prop.table(table(finalDevoicing$Voice, finalDevoicing$Obstruent),2)*100, legend=T, col=c("coral","turquoise"))

# Hypothesis 0: final devoicing is NOT affect by the type of consonant placed at the end of the word
# Hypothesis 1: .............................................................

# Test: 2 nominal data => Chi-square test needed
chisq.test(counts)

# or with full line of code:
chisq.test(table(finalDevoicing$Obstruent,finalDevoicing$Voice))

# Interpret p-value:


# Can you reject H0?


# Conclusion to your research question:



B) Let's do it with another set of real data.
*********************************************
# Source: http://www.sthda.com/english/wiki/chi-square-test-of-independence-in-r

# Import the data
file_path <- "http://www.sthda.com/sthda/RDoc/data/housetasks.txt"
housetasks <- read.delim(file_path, row.names = 1)
# head(housetasks)

The data is already built as a contingency table containing 13 housetasks and their distribution in the couple:

Rows are ....................
Columns are ................
The values (=numbers) are the frequencies/counts of .................... :

# Research question: ...........................................?



# 1) Plot the data:
a) Copy and paste the data into Excel. Do a barplot and a Radar plot. What conclusions can you draw from there regarding the tasks?
# To paste the data into Excel type the name of the data in R:
housetasks
# Select it, copy and paste it into Excel. Use the section "DATA"("Dati") in Excel, then "Text to columns" ("Testo in colone"). 

b) Balloon plot. This plot can be useful. The bigger the balloon, the more frequent the condition.
library("gplots")
# 1. convert the data as a table
dt <- as.table(as.matrix(housetasks))
# 2. Graph
balloonplot(t(dt), main ="housetasks", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)

# 2)Hypothesis:
# H0:
# H1:

# 3) Chi-square test:

chisq <- chisq.test(housetasks)
chisq

# 4) Can you reject H0?


# 5) Conclusion to your research question:

_____________________________________________________________________________
# MORE ADVANCED:

6) Situations where there is a significant association of the type of houswork and the people doing it:
library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)

The sign of the standardized residuals is also very important to interpret the association between rows and columns as explained in the block below.


Positive residuals are in blue. Positive values in cells specify an attraction (positive association) between the corresponding row and column variables.
In the image above, it’s evident that there are an association between the column Wife and the rows Laundry, Main_meal.
There is a strong positive association between the column Husband and the row Repair
Negative residuals are in red. This implies a repulsion (negative association) between the corresponding row and column variables. For example the column Wife are negatively associated (~ “not associated”) with the row Repairs. There is a repulsion between the column Husband and, the rows Laundry and Main_meal


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# 3) ANOVA: 1 NUMERIC variable 1 NOMINAL/QUALITATIVE/BINARY variable
# ________________________________________________________________
# References about anova: (wikihow)
https://www.wikihow.com/Conduct-Data-Analysis
# References for anova in R:
http://www.sthda.com/english/wiki/one-way-anova-test-in-r

# Anova is used for instance when you want to compare the average weight of several groups of people.
# It compares the mean weight in each group and tells you if AT LEAST ONE group has a significantly different mean weight compared to the other groups. 
# NUMERIC variable: weight
# NOMINAL variable: groups

# In phonetics it can be used to analyse:
# the duration of one type of vowels depending on the sex of the speaker OR the dialect of speakers OR any other category of speakers
# NUMERIC variable: duration
# NOMINAL variable: sex OR dialect OR any other category of speakers

#################################################################################################

# Let us use some real data in R!
___________________________________________________

# We will first take the data called "sleep". 

# Type help(sleep) to first get some info on the data. Read the description section. Group1 was given a certain type of drug, group2 was given another type of drug.
# Type head(sleep) to get a quick overview of the data.
# To see more, just type sleep.

# How many variables are there?

# your NUMERIC variable is:......??? and is measured in ?????
# your NOMINAL variable is:.....

# Write a possible research question:.........................


# 1) Plot the data first: NUMERIC data first and then NOMINAL data.
boxplot(sleep$extra~sleep$group)

# add colours
boxplot(sleep$extra~sleep$group, col=c("coral","lightblue"))
# add a title: Extra hours of sleep observed for each group
boxplot(sleep$extra~sleep$group, col=c("coral","lightblue"), main="Extra hours of sleep observed for each group")
# Interpret
# In the boxplot, the black line is the median. If the two black lines are nearly aligned, the drugs affect sleep in a similar way.

# Get the mean by group:
tapply(sleep$extra, sleep$group, mean)

# Your turn! Get the median by group:

............................................

# 2) Build a hypothesis: 
# H0: "The two different soporific drugs given to each group do NOT affect sleep DIFFERENTLY, i.e., after taking the drug, the two groups had similar sleep patterns, no matter the drug taken.
# H1: ......................
# 

# 3) Hypothesis-testing with ANOVA:
# Perform the ANOVA calling it anovaSleep (or another name of your choice). 
# Use the function aov() then paste the same elements that were inside the boxplot() function.
anovaSleep <- aov(                      )

# Copy the results given by command:
summary(anovaSleep)

# Results:

............................................

# Interpret the p-value. Can you reject H0?


# Answer your research question:



___________________________________________________________________
# We now take the data called "pb52".
# Load the data. Can you guess why this name was chosen using help(pb52)?


# How many variables are there? Type pb52 to check.

# Chose 1 numeric variable and a nominal variable to perform an ANOVA.

# your NUMERIC variable is:......??? and is measured in ?????
# your NOMINAL variable is:.....

# Plot your variables first. Is a difference between the groups you chose visible?

# Get the mean and median by group:


# Build your H0 and type it here: ____________
# H1:___________________

# Perform the ANOVA

# Interpret the p-value. Can you reject H0?

# Answer your research question:


___________________________________________________________________


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@ MY NEW SKILLS @@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Build a list of all the things you have learnt.

# If you are in a group, build questions around this lesson and give them to your neighbour.







