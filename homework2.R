library(tidyverse)

path_to_csv <-"sparrows.csv"
print(path_to_csv)
sparrows <- read.csv(path_to_csv)

x <-sparrows %>%
  ggplot(aes(x=Skull_Length,y=Skull_Width)+geom_point()+geom_line())

x
