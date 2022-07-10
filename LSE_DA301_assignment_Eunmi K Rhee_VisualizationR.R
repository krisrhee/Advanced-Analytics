
############### 3. Visualize data to gather insights
library(ggplot2)
library (dplyr)
## check working directory 
getwd()
setwd("C:/Users/Kristina/OneDrive/바탕 화면/LSE/Advanced Analytics/Assignments")
lego <- read.csv("lego.csv", header = TRUE)

## Explore the data set
head(lego)

## Convert data frame to a tibble
as_tibble(lego)


## Use the glimpse() function
glimpse(lego)

## Use the summary() function
summary(lego)

## Return a frequency table for the 'ages' column
table(lego$ages)

## [1] Specify X as ages, y as list_price, and 
## wages as the data source (the x-axis variable is passed first, followed by the y-axis, and then the source of the data is specified):
qplot(ages, num_reviews, data = lego)

## Using ggplot
ggplot(lego, aes(x = ages, y= num_reviews)) + geom_point()

## group age
Age <- cut(lego$ages, c(seq(0, 35 , by = 5), Inf), include.lowest = TRUE)

## identify number of reviews by age group
agg_age= aggregate(num_reviews ~ Age, lego, sum)
agg_age

## show in bar chart
ggplot(agg_age, aes(x = Age, y= num_reviews)) + geom_bar(stat="identity")


############### 4. Most popular and most expensive 
### Most popular(most  number of reviews) who are younger than 25 years old
lego_mod <- filter(lego, lego$ages<25 
                       & lego$num_reviews==max(lego$num_reviews))
print("Most popular lego sets purchased by customers under 25:")
print (lego_mod)
summary(lego_mod)

       
### Most expensive who are at least 25 years old(>25)       
#filter rows where ages >25
lego_mod2 <- filter(lego, lego$ages>25)
head (lego_mod2)

#find rows with max list price
lego_mod3 <-lego_mod2[which.max(lego_mod2$list_price),]
print.data.frame(lego_mod3)

#format table
knitr::kable(lego_mod3)

highest <- max(lego_mod2$list_price)
cat("The most expensive lego set bought by customers over 25 is:", highest)


