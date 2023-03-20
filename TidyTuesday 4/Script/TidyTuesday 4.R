#### I am currently practicing with different functions in scatterplots ####
### Created by: Leah Reichert #############
### Updated on: 2023-03-19 ####################


### Loading Libraries####
library(here)
library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggthemes)

### Load Data ### 
drugs <- read_csv("TidyTuesday 4/Data/drugs.csv")
View(drugs) # view data 

# Plot #
drugs %>%
  filter(therapeutic_area == "Melanoma") %>% # look at only drugs for melanoma 
  ggplot(aes(x = active_substance, 
                y = product_number)) +
geom_point(
  color = "purple", # outline color 
  fill = "#69b3a2", # inner color 
  shape = 22, # shape of marker 
  alpha = 0.5, # transparency 
  size = 7, 
  stroke = 2 # width 
) +
  labs(x = "Active Substance", # rename titles
       y = "Product Number"
       ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) # make x axis text vertical 
ggsave(here("TidyTuesday 4","Output","TidyTuesday 4.png"), 
       width = 7, height = 5)
         