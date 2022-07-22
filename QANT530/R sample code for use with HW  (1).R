############################################################
### R code for optional exploration associated with HW 2 ##
### file assumes use of a dataset entitled ATTITUDE      ##
### containing variables rating and learning
###########################################################

#### Load packages####
install.packages("ggplot2")
install.packages("e1071")
install.packages("tidyverse")
library(ggplot2)
library(e1071)
library("tidyverse")


###load attitude dataset into R from text file stored on your PC####

attitude<-read.table("<insert your directory location of file here.  Use forward slashes>", TRUE)

####Save output from R to PC###
write.table(Output,"<Enter save to location. Use backward slash>, sep="\t")


##**************************************************************
#numerical summary for one variable named rating contained in the dataset named attitude
summary(attitude$rating)

#numerical summary for all variables in the attitude dataset
summary(attitude)

#Additional numerical summaries
kurtosis(attitude$rating)
skewness(attitude$rating)
sd(attitude$rating)
range(attitude$rating)
mean(attitude$rating)



#*****************************************************

#Generate Histogram

hist(attitude$rating, 
     main = "Chart Title", 
     xlab = "Horizontal Axis title")

#************************************************

#Generate Correlation table

cor(attitude, method = "pearson", use = "complete.obs")

#***********************************************************

# Generate Scatter plot

ggplot(data = attitude) + 
  geom_point(mapping = aes(x = rating, y = complaints))

#****************************************************
## Residuals
## Generate residuals for response variable complaints and explanatory variable rating
## in attitude dataset. Residuals are saved in Attitude_residuals
#lm(response variable ~ explanatory variables, data = dataset)

Regres_Attitude <-lm(complaints ~ rating, attitude)
Attitude_residuals <- resid(Regres_Attitude)

### Generate residual vs predicted (response variable) plot

plot(attitude$complaints, Attitude_residuals,
        main = "Residual Plot",
        xlab = "Ratings",
        ylab = "Residuals")
abline(h=0, col="blue")
#****************************************************************************
# Transformations

#to add column 'growth' into the dataset attitude as a result of subtraction
## any mathematical operation can be applied. Multiple columns can be added within
## the parenthesis

mutate(attitude,
  growth = rating - complaints,
growth2 = growth / learning
)

#**************************************************************************
## Simple linear regression

#lm(response variable ~ explanatory variables, data = dataset)
#Generate simple regression equation coefficients

Simple_Regression_Model <-lm(complaints ~ rating, attitude)
Simple_Regression_Model

#Generate simple regression numerical summaries
summary(Simple_Regression_Model)

#plot regression line

plot(attitude$rating, attitude$complaints,
abline(lm(attitude$complaints ~ attitude$rating)))


