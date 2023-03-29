#### I am currently practicing with a new package I have never worked with before  ####
### Created by: Leah Reichert #############
### Updated on: 2023-03-28 ####################

### Loading Libraries ###
library(tidyverse)
library(here)
library(ggplot2)
library(dplyr)
library(emoGG)


### Load Data ###
horror_movies <- read_csv("TidyTuesday 5/Data/horror_movies.csv")
View(horror_movies)

### Plot Data ### 
filtered <- horror_movies %>%
  drop_na(collection,collection_name,tagline) %>%
  filter(original_language == "en" & genre_names == "Comedy, Horror" & release_date > "2000-01-01") #filter out to narrow it down
  
emoji_search("pumpkin") # find code for pumpkin 
  
 filtered %>%
  ggplot(aes(x = budget,
             y = popularity)) +
  geom_emoji(emoji = "1f383") + # use the pumpkin emoji to plot 
   geom_smooth()+
  labs(x = "Budget",
       y = "Popularity",
       title = "Horror/Comedey movies popularity vs. budget") + # graph labels 
   scale_y_continuous(limits = c(0,100))+ # chnage range to 0-100
   scale_x_continuous(breaks = c(0e+00, 1e+07, 2e+07, 3e+07),
                      labels = c("None","Low", "Moderate", "High"))+ #rename x axis
   theme_bw() +
   theme(panel.background = element_rect(fill = "black")) + # panel background 
   theme(plot.background = element_rect(fill = "darkorange")) + # chnage background 
   theme(axis.title = element_text(size = 20,
                                   color = "black")) + # axis title edits
   theme(axis.text = element_text(size = 15,
                                  color = "black")) #axis text edits
 ggsave(here("TidyTuesday 5","Output","TidyTuesday 5.png"), 
        width = 7, height = 5)
   
