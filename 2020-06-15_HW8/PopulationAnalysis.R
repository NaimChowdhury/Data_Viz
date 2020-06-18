mygitpath <- 'https://raw.githubusercontent.com/NaimChowdhury/Data_Viz/master/2020-06-15_HW8/PopulationEstimates.csv'
library(tidyverse)
# install.packages('maps')
library(maps)

# loading dataset through hyperlink
population <- read_csv(mygitpath)

# the package already has a set of counties
counties <- map_data("county")

population$Area_Name = str_replace_all(population$Area_Name,"[^[:graph:]]", " ") 

population_sub <- population %>% 
  mutate(county = tolower(Area_Name)) %>% 
  mutate(state = tolower(State)) %>% 
  select(state, county)


