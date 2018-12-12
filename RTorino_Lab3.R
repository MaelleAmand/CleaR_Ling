# ******************************************************************
#   
#           ** TP4 : R for Arts students, linguists and phoneticians**
#                       (Maelle AMAND)
# 
# ******************************************************************
#  
# Linear regression models: level 1
#__________________________________________
# 

# Let us first use the datasets "anorexia" then "TitanicSurvical" 
# 
# 
# Install package {MASS} to get the anorexia data.
install.packages("MASS")

# Load package:
library(MASS)

# Load  data "anorexia"
data(anorexia)
attach(anorexia)

# Visualise the data
View(anorexia)


# To understand the data better, use:
help("anorexia")

# Ces données proviennent d'une expérience qui mesure l'amélioration du poids
# This data set comes from an experience measuring the improvement in weight of 
# young women suffering from anorexia (before and after treatment)
# The variable Treat has 3 levels:
# 1) Cont: Control group=> NO treatment
# 2) CBT: Cognitive and behaviour treatment
# 3) FT: The family got treatment too

# The variable Prewt indicates the weight (wt) before the treatment (pre) hence the name Prewt
# What about Postwt?

# How is weight measured in? Use the help section to answer this question.

# Find out the mean weight before treatment using mean()


#____________________________________________________________________________

# Find out the mean weight after treatment:


#____________________________________________________________________________

# Use the function summary() on the dataset
# Compare the means in the summary output and yours:


#____________________________________________________________________________
# The numbers under Treat indicate the number of times each level is found in a cell.


# The weith in lbs is not easily interpretable. Convert it in kg:
# 1 pound equals 0.45359237 kg. 
# Multiply Prewt et Postwt by 0.45359237.

Prewt <- Prewt*0.45359237
Postwt <- .....

# Check the weight now:
head(anorexia)


# Check the means with summary(). Is weight more easily interpretable?


# The patient with the minimum weight before treatment is 31.75 kg. Find where it is in the summary output.
# What is the highest weight values of the patients after treatment.
# Compare both minimum and maximum weight values in both before and after treatment.




# Let's build a variable called "wtdiff" which will be the difference of weight for each patient before and after treatment.
# NB: the control group is weighed a second time but did not receive treatment.

# I am going to do the reverse: I am going to add these weight values instead.
# Then I will bind/concatenate/add this variable to the data using cbind (column bind, just like book binding).
# Using my code below as a model,
# Bind the variable with the difference in weith instead!

wtAddition <- Postwt + Prewt
anorexia <- cbind(anorexia, wtAddition)
View(anorexia)

# Your turn!

wtdiff <-
# etc...

  
# What is the mean change in weight?

  
# Conclude: on average, patients gain ?????? kg.

# This includes the control group...which is not supposed to have gained weight.
# How do you think this impacts the average weight difference?



_________________________________________________________________________________




# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@ Linear Regression @@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


# Anorexia is used in the help section of R as an example for linear regression.
# A regression can help you assess the effect of one or more variables (NUMERIC or CATEGORICAL) 
# over another called "dependent" variable. 

# Ex: Did the patients gain weight after the treatment? (for those who did receive a treatment)
# We say we test the effect of the variable Treat over the variable weight.
# 

# 1) PLOT:
# use a boxplot!
# Let us observe the median weight in all three conditions BEFORE treatment:

boxplot(Prewt~Treat, data=anorexia, col=c(4,2,3), main="INITIAL weight by cohort (=group)")
# The box indicates that 50% of the patients' weight lie within the range comprised by the box.


# Let us observe the median weight in all three conditions AFTER treatment:

boxplot(Postwt~Treat, data=anorexia, col=c(4,2,3), main="FINAL weight by cohort (=group)")

############ BOXPLOT DEFINITION #############
# Boxplots are really useful to compare numeric values (y-axis, the weight) 
# in a series of groups (x-axis, treatment types)


# The box indicates that 50% of the patients' weight lie within the range comprised by the box.
# The black bar is the median.
# The whiskers indicate that between 90% and 100% of the weight is comprised within that range.
# If you see dots beyond the whiskers, it means you have outliers/extreme/atypical values.
# Cf: image: http://4.bp.blogspot.com/-8D73Wz4iWRQ/ThL5tF0thAI/AAAAAAAAP18/ykE4aRBtSew/s1600/Boite+moustache+commentaires.png
# Quartiles explained: http://web.mnstate.edu/peil/MDEV102/U4/S36/S363.html
# General explanation in Italian: http://www.umbertosantucci.it/atlante/diagramma-a-scatola-e-baffi/

# Which group gained more weight?
# After treatment, in which group do you see the minimum and maximum weights?


# Before performing a linear regression, indicate what you are comparing. You need a BASELINE
# We compare weight gain by patients who received a treatment compared to those who didn't 
# i.e. the control group.
# The control group called "Cont" in the data will be our baseline, also known as REFERENCE LEVEL.

# Let's change Treat to make sure that "Cont" is the reference level.

anorexia$Treat <- relevel(anorexia$Treat, ref = "Cont")


# Let's make our our first linear model. Same code as the boxplot:


model1<- glm(wtdiff~Treat, data=anorexia)
summary(model1)

# the output in summary answers the following questions:
# Comparted to the control group who did not receive treatment, 
# do patients gain more weight in both conditions?

# 1) Do a bit of "stargazing" near TreatCBT. 
# First conclusion:
# On line CBT, there is 1 star, which means that weight gain for those who did a 
# cognitive and behavioural treatment is slightly different from the control group.
# Give the p-value:

# 2) Do a bit of "stargazing" near  TreatFT:
# What can you say conclude for now?
# # Give the p-value:


# There can only be a maximum of 3 stars.
# You get a significant effect if in column Pr(>|t|), 
# the digit is below 0.05. This value is known as the p-value).
# the threshold itself is called the critical value. It means that 
# If your p-value is exaclty 0.05, you still have 5% probability (hence the p), of being 
# wrong if you say that the effect is significant.

# Check if p-value < 0.05. 
# Compare the 2 p-valeurs for CBT & FT :
# Between 0.032827 & 0.000161, what is the smallest number ?

# We still don't know how much weight is gained...or lost!


#________________________________________________________________________
# Check the column "Estimate"
# The second line indicates the average difference in kg between the control group and the group CBT. 
# Here is how to interpret this line:
# On average, the patients having received the CBT treatment gaint 1.8kg 
# (roughtly 2kg) more than the patients with no treatment.

# Your turn! Do the same for the patients whose family also got a treatment  FT:



#______________________________________________________________


# Do a linear regresssion to test if INITALLY, there wasn't already a difference in weight 
# between the patients placed in various groups. Call the model: model2

# Do a linear regresssion to test if, in the SECOND weight measurement, 
# there is indeed a significant difference in weight 
# between the patients placed in various groups. Call the model: model3


model2<- glm(???~Treat, data=anorexia)
summary(model2)


model3 <- 

  # @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ QUIZ @@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
# How to install and load a package in R ?
  
  
# How do you load pre-installed data in R ? 

  
# How to add an extra column to a dataset in R ?

# In the data axorexia, how do you get the difference betweent Prewt et Postwt?

# You now know how to add or subtract variables. Can you multiply and divide variabeles?
# Try with Prewt et Postwt !

# In a boxplot, 50% of the data is .......? The black line is ......?
# The first quartile is based on .......
# The third quartile is based on ......


# Where do you have to check in the summary output of a linear model? 
# (when you are a beginner)

# What is the reference level?

# If the p-value in Pr(>|t|) is 0.08, is the effect significant?
# What is the threshold? How do you call it?

# Write a little paragraph interpreting the output of the first linear model made on the data
# "anorexia".
summary(model1)
# 
# Call:
#   glm(formula = Poidsdiff ~ Treat, data = anorexia)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -6.3757  -1.9592  -0.2477   2.4642   6.8843  
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  20.0097     0.6163  32.467  < 2e-16 ***
#   TreatCBT      1.8486     0.8487   2.178 0.032827 *  
#   TreatFT       3.9137     0.9802   3.993 0.000161 ***


# Congratulazioni!!
