#### I am currently practicing with making graphs becasue I wasn't proud of my first attempt  ####
### Created by: Leah Reichert #############
### Updated on: 2023-03-08 ####################

### Loading Libraries ###
library(here)
library(tidyverse)
library(maps)
library(mapdata)
library(ggthemes)
library(calecopal)
library(mapproj)
library(ggmap)

### Load Data ##
numbats <- read_csv("TidyTuesday 3/Data /numbats.csv")
View(numbats) # View data 

### Plot Data ###
numbats_clean <- numbats %>%
  drop_na()  # remove na 

glimpse(numbats_clean) # view data 
australia <- get_map("Australia", zoom = 4) # layer by australia
WP<- data.frame(lon = 116, lat = -32.6)
Map1 <- get_map(WP, zoom = 17)
  ggmap(Map1)+ 
    geom_point(data = numbats_clean, # 2nd layer plot type 
               aes(x = decimalLongitude,
                   y = decimalLatitude,
               color = hour)) +
    facet_wrap(~month) +
    labs(x = "Longitude",
         y = "Latitude",
         title = "Numbat Spottings in Australia")
  ggsave(here("TidyTuesday 3","Output","TidyTuesday 3.png"), 
         width = 7, height = 5)
