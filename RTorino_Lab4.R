# ******************************************************************
#   
#           ** TP4 : R for Arts students, linguists and phoneticians**
#                       (Maelle AMAND)
# 
# ******************************************************************
#  
# Logistic regression models: level 1
# __________________________________________
# Logistic regressions enable you to determine whether a binary variable is affected by a series of
# other variables in the data. They can be nominal or numeric or both. It also gives you the degree to which 
# these variables affect the data and if a combination of variables may affect the data.

# The affected variable has got several names depending on the textbooks:
#- response variable
#- dependent variable (DV)
#- Y variable
#- variable to be explained

# The variables that may have an effect on the response variable are called:
# - independant variables
# - X variables
# - explanatory variables

# It is important to remember these names.

# Examples of research questions are for instance, 
# - what seems to determine the fact that:
# => a score may be correct/incorrect
# => people may survive/die in an event
# => patients may vomit/not vomit after testing a drug
# => participants in a perception test will choose either phoneme A or phoneme B
# => In subordinate clauses, speakers may use either "that" or "which"
# => In a survey, people will answer either "yes" or "no"



# For this session, I will use the plosive data (Amand & Touhami 2018)

# The response variable is whether students release the plosive (coded "R") or not ("U")
# The potential explanatory variables 



# Load plosive data
#
attach(plosive)
View(plosive)
summary(plosive)

# Make sure every column is considered as a factor
plosive[sapply(plosive, is.character)] <- lapply(plosive[sapply(plosive, is.character)],
as.factor)

# PREPARATION IS KEY. KNOW YOUR DATA FIRST AND DO BASIC CHECKS

# PREPARATION for logistic regression:
__________________________________________
# Get the right reverence level. The reference is your baseline for your comparison.

plosive$release=relevel(plosive$release, ref="R") # French students are expected to release more often.
plosive$bef.aft=relevel(plosive$bef.aft, ref="before") # The baseline is the rate of release before training
plosive$type=relevel(plosive$type, ref="fin") # Where students are expected to release the most
plosive$groupe=relevel(plosive$groupe, ref="control") # The baseline group which will not receive training
plosive$phase=relevel(plosive$phase, ref="sentfinal") # Where students are expected to release the most


# CHECK before logistic regression:
__________________________________________
# 1) CHECK if initially, both groups of students had similar release rates 
# during the first recording. Since people are not the same in both groups, use a Chi-square test.
beforeOnly <- plosive[plosive$bef.aft=="before",]
table(beforeOnly$release,beforeOnly$groupe)

# H0:
chisq.test(table(beforeOnly$release,beforeOnly$groupe))

# Your conclusions?..............

# 1bis) CHECK if there is a difference between the control and the test group after the second recording:
afterOnly <- plosive[plosive$bef.aft=="after",]
# ... keep going!


# Your conclusions?..............


# 2) CHECK if, among the test group, students improved
# between their first and second recording. Since you are comparing the SAME people in 2 different conditions,
# using BINARY data both for the groups (before/after) and the release (U/R), use a mcnemar test.
# 

testOnly <- plosive[plosive$groupe=="test",]
table(testOnly$release, testOnly$bef.aft)
# H0:
mcnemar.test(table(testOnly$release, testOnly$bef.aft))
# Your conclusions?..............

# 2bis) Do students in the control group improve after the second recording?

controlOnly <- plosive[plosive$groupe=="control",]
table(....

#H0:
mcnemar.test(...

# Your conclusions?.............

# PLOTS:
__________________________________________
# Using this model, create a plot for each of the CHECK section above:

barplot(prop.table(table(beforeOnly$release,beforeOnly$groupe),2), 
        main="Before Training", legend=T, col=c("orange","lightgreen"))

		

# Use this plot to get a better overview of the data as a whole.
# I used all the main conditions of the study 
# - phonetic environment: "type"
# - groups: "groupe"
# - First or second recording: "bef.aft"
# - Reading task "phase"
# use summary(plosive) if needed

install.packages("party")
library(party)
tree1 <- ctree(release~type + bef.aft + groupe + phase, data=plosive)
plot(tree1)
# Phase is a bit redundant, get rid of it and keep "type" only:
tree2 <- ctree(release~type + bef.aft + groupe, data=plosive)
plot(tree2)

# Add the speaker's sex to explanatory variables. Can you see it on the plot?
# What can you conclude from this absence?

# Take some time to observe the data and prepare a oral description that you will give to your neighbour.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Now that you know your data better, use a logistic regression with random effects:



# Random effects take into account the slight variation due to the fact that people or stimuli taken
# are not perfectly identical.

# Fixed effects are the different effects that your are directly testing in your research question:
# effect of training, phonetic environment etc..


install.packages("lme4")

# Without interactions first:
glm1<- glmer(release~type+phase+bef.aft+groupe+sex + (1|speaker), data=plosive,family=binomial)
summary(glm1)
# Interpret results (come and ask me in class)

# With interactions now. It is useful to check if the speakers in the test group have improved in the second
# recording compared to the control group in the second recording:
glm2<- glmer(release~type+phase+bef.aft*groupe + (1|speaker), data=plosive,family=binomial)
summary(glm2)
# Interpret results (come and ask me in class)

# Which model is a better fit?
anova(glm1,glm2)


# If AIC value is lower in one model, the latter is deemed more adapted to the data.
# Your conclusions: which model should you choose?

# YOUR TURN 1 !

# Do a third and a fourth model taking out phase. One without interactions, one with interactions.
glm3 <- 

summary(...

glm4 <- 
....

# Which model is a better fit?
.....

# YOUR TURN 2 ! 

# You want to predict the performance of students when being taught how not to release all plosives 
# compared to students who haven't received the training.
# This type of data set is actually better for an ordinary logistic regression.

# Use the "afterOnly" subset of data to perform a similar model.
# Perform a mixed effects model using glmer. Careful, one variable will have to be taken out of the model

glmPred <- 


# Your new reference level for type is the environment which represents an average difficulty for the speakers
afterOnly$type=relevel(afterOnly$type, ref="heter")

