#Homework 2 Script
#Emma Joergensen

library(tidyverse)
library(dplyr)
library(pacman)
library(readr)
library(plyr)

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



