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

#c. 
airbnb_top_neighborhoods <- airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)

#d.
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% 
  group_by(neighborhood) 

airbnb_top_neighborhoods %>% group_by(neighborhood)
  summarize(avg_square_feet = mean(square_feet, na.rm = T),
            avg_price = mean(price, na.rm = T),
            sd_price = sd(price, na.rm = T),
            max_price = max(price, na.rm = T),
            min_price = min(price, na.rm = T)) 

 


rm(airbnb_top_neighbrhoods)

