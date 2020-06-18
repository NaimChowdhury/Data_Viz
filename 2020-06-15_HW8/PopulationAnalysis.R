mygitpath <- 'https://raw.githubusercontent.com/NaimChowdhury/Data_Viz/master/2020-06-15_HW8/PopulationEstimates.csv'
library(tidyverse)
# install.packages('maps')
library(maps)
population <- read_csv(mygitpath)

counties <- map_data("county")
