#Homework 2 Script
#Emma Joergensen

library(tidyverse)
library(dplyr)
library(pacman)
library(readr)

#1)
#a. import data
airbnb <- read_csv("assign_2-2.csv")

#b. view data
view(airbnb)
colnames(airbnb)

#c. rename "neighbourhood"