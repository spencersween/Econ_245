#Homework 2 Script
#Emma Joergensen

library(tidyverse)


#1) setting up data

#a. import data
airbnb <- read_csv("assign_2-2.csv")

#b. view data
#view(airbnb) this will break the autograder
#colnames(airbnb)

#c. rename "neighbourhood"
airbnb <- airbnb %>%
  rename(neighborhood = "neighbourhood")


#2) piping practice/summary stats

#a. count neighborhoods
neighborhoods <- count(airbnb, neighborhood)

#b. arrange top 20 neighborhoods in descending order
neighborhoods <- na.omit(neighborhoods)
neighborhoods <- head(arrange(neighborhoods,desc(n)), n = 20)

#c. airbnb with top 20 neighborhoods only
airbnb_top_neighborhoods <- airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)

#d.summary statistics for top 20 neighborhoods
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% 
  group_by(neighborhood) %>%
  summarize(avg_square_feet = mean(square_feet, na.rm = TRUE),
            avg_price = mean(price, na.rm = TRUE),
            sd_price = sd(price, na.rm = TRUE),
            max_price = max(price, na.rm = TRUE),
            min_price = min(price, na.rm = TRUE)) %>%
  arrange(desc(avg_square_feet))

 
#e. find and save the highest average square feet
highest_avg_square_ft <-max(summary_stats_top_neighborhoods$ avg_square_feet, na.rm = TRUE)

#f. find and save the second highest average price
second_avg_price <- sort(summary_stats_top_neighborhoods$avg_price, decreasing=T)[2]

