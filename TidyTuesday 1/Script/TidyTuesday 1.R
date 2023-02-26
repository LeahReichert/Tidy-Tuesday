### Today I am going to be working on my first tidy tuesday with age gap data ####
### Created by: Leah Reichert #############
### Updated on: 2023-02-17 ####################

#### Load Libraries ####
library(readr)
library(tidyverse)
library(here)
library(ggplot2)
library(dplyr)
library(calecopal)
library(ggthemes)

### Load Data ###
age_gaps <- read_csv("TidyTuesday 1/Data/age_gaps.csv")
glimpse(age_gaps) # view data 

  ggplot(data = age_gaps, # graph this data 
         mapping = aes(x= release_year, # data for x axis 
                       y = age_difference, # data for y axis 
                       group = character_1_gender,
                       color = age_difference)) +
  geom_bin2d()+ # type of graph 
    facet_wrap(~character_1_gender)+ # split the graph by gender
  labs(x="Release Year", #axis labels 
       y = "Age Difference" # axis labels 
       ) + 
    theme_bw() + # type of theme 
    theme(axis.title = element_text(size = 20,
                                    color="blue")) # change the axis titles 
ggsave(here("TidyTuesday 1","Output", "Hollywood Age Data.png"), #saved my work 
       width = 7, height = 5)

  


        


        

      
