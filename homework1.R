library(tidyverse)

path_to_csv <-"sparrows.csv"
print(path_to_csv)
sparrows <- read.csv(path_to_csv)

# Download the dataset sparrows.csv, and read the data frame into R. 
# Explore the data frame using functions such as head(), etc. What type/subtype 
# (i.e. numeric/discrete) of variable is each column? (2 pts)

head(sparrows)
median(sparrows$Weight)
ncol(sparrows)
nrow(sparrows)

#Sex is categorical (nominal)
#Age is categorical (nominal)
#Survival is categorical (nominal)
#All the other columns are numerical (continuous)


# b) Choose one numeric (not weight or wingspread, please) and one categorical
# variable each from this dataset. Perform the following tasks. Please limit your text
# responses to no more than 2 sentences. In addition, please ensure that your plots
# have appropriate axis labels (no dollar signs!).

# i) Make a boxplot and histogram of your chosen numeric variable. Given
# this visual information, which measure (mean or median) would you
# choose to represent the location of this distribution and why? (6 pts)

skulls <- sparrows$Skull_Length
bp1 <- boxplot(skulls, ylab = "Skull Measurement",xlab = "Distribution of Sparrow Skull Measurements",col="red")
h1 <- hist(skulls,xlab="Distribution of Sparrow Skulls", col="maroon",main="Skull distribution length")
#I think the mean is a better statistic to represent this distribution.

# ii) Make a barplot of your chosen categorical variable. Briefly describe how
# the resulting distributions compare. (4 pts)

age_table <-table(sparrows$Age)
age_table
barplot(age_table,col=c("yellow","blue"),
        xlab="Age of Sparrows",
        ylab="Number of Sparrows")
#There are more adults than young sparrows, almost half as many young to adults

# Use logical indexing and the functions min() and max() to determine the sex, age,
# and survival status for the bird with the longest and shortest wingspread. (5 pts)

longest <- max(sparrows$Wingspread)
shortest <-min(sparrows$Wingspread)
s_age <-sparrows$Age
s_sex <-sparrows$Sex
s_surv <-sparrows$Survival

long_age <- s_age[sparrows$Wingspread ==longest]
print(long_age) #Age of sparrow with longest wingspread
long_sex <-s_sex[sparrows$Wingspread == longest]
print(long_sex) #Sex of sparrow with longest wingspread
long_surv <-s_surv[sparrows$Wingspread==longest]
print(long_surv) #Survival status of sparrow with longest wingspread

short_age <-s_age[sparrows$Wingspread == shortest]
print(short_age) #Age of sparrow with shortest wingspread
short_sex <-s_sex[sparrows$Wingspread == shortest]
print(short_sex) #Sex of sparrow with shortest wingspread
short_surv <-s_surv[sparrows$Wingspread== shortest]
print(short_surv) #Survival status of sparrow with shortest wingspread

# Compare weight distributions, using both summary statistics and histograms,
# between birds which survived the storm and birds which died. Based on this
# descriptive information, do you think weight influenced sparrow survival? Why
# or why not? (5 pts)

s_weight <-sparrows$Weight
a="Alive"
b="Dead"
alive_weight <-s_weight[sparrows$Survival==a]
dead_weight <-s_weight[sparrows$Survival==b]

alive_weight_sum <- summary(alive_weight)
print(alive_weight_sum) #Summary of weight for alive birds
dead_weight_sum <- summary(dead_weight)
print(dead_weight_sum) #Summary of weight for dead birds

alive_weight_hist <- hist(alive_weight,xlab="Weight of Alive Sparrows",ylab="Frequency of Weight",
     main="Distribution of Alive Sparrows Weight",col=c("rosybrown",
                                                        "rosybrown1",
                                                        "rosybrown2",
                                                        "rosybrown3",
                                                        "rosybrown4"))
dead_weight_hist <- hist(dead_weight,xlab="Weight of Dead Sparrows",ylab="Frequency of Weight",
                       main="Distribution of Dead Sparrows Weight",col=c("palegreen",
                                                                          "palegreen1",
                                                                          "palegreen2",
                                                                          "palegreen3",
                                                                          "palegreen4"))


#For me, the hist() function was more descriptive to see how weight is influential
#of the survival status of the sparrows. The distribution of the alive sparrow's weight 
#can be shown that it might be bi-modal, with the two modes seeming to be 24/25 and 27.
#That means most of the alive sparrows were around 24/25 or 27.
#The histogram for the dead sparrows weight shows it's uni-modal with most of the sparrows
#being in the range of 24/25. 
#Alive sparrows were definitely heavier Dead sparrows were lighter
#The summary() showed that the means were almost identical.
