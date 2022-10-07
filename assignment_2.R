library(tidyverse)

airbnb = read_csv("assign_2-2.csv")

airbnb = rename(airbnb, neighborhood = neighbourhood)

neighborhoods = airbnb %>% 
  select(neighborhood) %>% 
  group_by(neighborhood) %>% 
  count()

neighborhoods = neighborhoods %>% filter(is.na(n) == F) %>% arrange(-n) %>% head(20)

airbnb_top_neighborhoods = airbnb %>% 
  filter(neighborhood %in% neighborhoods$neighborhood)

summary_stats_top_neighborhoods = airbnb_top_neighborhoods %>% 
  group_by(neighborhood) %>% 
  summarize(avg_square_feet = mean(square_feet, na.rm = T),
            avg_price = mean(price, na.rm = T),
            sd_price = sd(price, na.rm = T),
            max_price = max(price, na.rm = T),
            min_price = min(price, na.rm = T)) %>% 
  arrange(-avg_square_feet)

highest_avg_square_feet = summary_stats_top_neighborhoods$avg_square_feet[1]

second_avg_price = summary_stats_top_neighborhoods$avg_price[2]
