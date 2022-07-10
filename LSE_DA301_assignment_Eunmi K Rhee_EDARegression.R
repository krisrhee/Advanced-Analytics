
############### 4. Exploratory Data Analysis and Sales prediction
## Predicting sales next year for each video games for stores 
## in Europe and NA

# import libraries
# tidyverse package
library(tidyverse)
# Useful for importing data
library(readr) 
#Useful for data wrangling
library(dplyr) 
#Useful for data wrangling
library(tidyr) 
# Useful for creating tidy tables
library(knitr) 
# useful for working with vectors and functions
library(purrr)
# useful to create insightful summaries of data set
library(skimr)
# useful to create insightful reports on data set
library(DataExplorer)
# xxx
library(datarium)

# import CSV file into R
games <- read.csv (file.choose (), header = T)

# sense-check data set
as_tibble(games)
View(games)

##############################################################################
# 2. Understand data set

# sum of missing values 
sum(is.na (games))
# KR comments: No missing values

# get the gist of the data
summary(games)
DataExplorer::create_report(games)

# count unique values in columns
sapply(games, n_distinct)

#KR comments: Would like to use Platform, Year, and Genre 
# as independent categorical variables

#############################################
#Convert strings to factors for modelling 
# This is One Hot Encoding equivalent in Python
str(games)
games$Platform=as.factor(games$Platform)
games$Year=as.factor(games$Year)
games$Genre=as.factor(games$Genre)

#linear model
output=lm(NA_Sales~Platform+Year+Genre, data=games)
summary(output)

output1=lm(EU_Sales~Platform+Year+Genre, data=games)
summary(output1)


output2=lm(EU_Sales~Platform+Genre, data=games)
summary(output2)

# KR comments: 
#    For NA_Sales: R squared is a low 6.7% although the p-value is 2.2e-16
#    For EU_Sales: R squared is a low 3.9% although the p-value is 2.2e-16
#    For EU_Sales: Year has little significance in predicting the sales 
#    hence can drop the variable 
#############################################

