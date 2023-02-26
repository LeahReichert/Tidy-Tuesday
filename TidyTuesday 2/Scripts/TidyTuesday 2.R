#### I am currently practicing with themes and the filter function ####
### Created by: Leah Reichert #############
### Updated on: 2023-02-26 ####################

### Loading Libraries####
library(here)
library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggthemes)


### Load Data ### 
bob_ross <- read_csv("TidyTuesday 2/Data /bob_ross.csv")
View(bob_ross) # view data 

bob_ross%>%
  filter(season == "17")%>% #look at only sason 17 
  ggplot(aes(x = painting_title, y = painting_index,
             group = season == "17",
             color = episode))+
  geom_point()+
  geom_smooth()+
  labs(x = "Painting Title",
       y = "Painting Index"
       )+
  theme_fivethirtyeight()+
  theme(axis.title = element_text(size = 15,
                                  color = "purple"),
                                  panel.background = element_rect(fill = "gray"))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggsave(here("TidyTuesday 2","Output","TidyTuesday 2.png"),
       width = 7, height = 5)
  