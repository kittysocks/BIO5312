library(tidyverse)

getwd()

path_to_csv <-"sparrows.csv"
print(path_to_csv)
sparrows <- read.csv(path_to_csv)

sparrows %>%
  head()

skull_scatterplot <- 
  sparrows %>%
  ggplot(aes(x=Skull_Width,y=Skull_Length))+
  geom_point(aes(color=Wingspread),size=Wingspread) +
  xlab("Skull Width of Sparrows") + ylab("Skull Length of Sparrows")
skull_scatterplot

