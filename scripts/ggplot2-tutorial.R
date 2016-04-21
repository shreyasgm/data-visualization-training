# Purpose: ggplot2 tutorial
# Author: Shreyas Gadgin Matha (shreyas.gm61@gmail.com)
# Date created: 2016-04-20
#---------------------------------------------------------------------
rm(list = ls())
#---------------------------------------------------------------------
# Load required packages
library(ggplot2)
#---------------------------------------------------------------------
#Set file paths

ROOT <- "C:/Users/Shreyas Gadgin Matha/Documents/Random/Data Visualization IFMR/data-visualization-training/"
OUTPUT <- paste0(ROOT,"output/")
#---------------------------------------------------------------------

#SCATTERPLOT
#-----------

plot(mtcars$hp,mtcars$mpg)

#ggplot
scatterplot <- ggplot(mtcars, aes(x = hp,y = mpg)) +
  geom_point()

#Add axis titles
scatterplot <- scatterplot +
  labs(title = "MPG vs HP",
       x = "HP",
       y = "Miles Per Gallon")

#Make legend discrete, and add regression line
mtcars$gear <- as.factor(mtcars$gear)

scatterplot <- ggplot(mtcars, aes(x = mpg,y = hp)) +
  geom_point(aes(colour = mtcars$gear)) +
  geom_smooth(method = "lm") +
  scale_colour_discrete(name = 'Gear',
                        breaks = c('3','4','5'),
                        labels = c('Low','Medium','High')) +
  labs(title = "MPG vs HP",
       x = "HP",
       y = "Miles Per Gallon")


#HISTOGRAM
#---------

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5)

#Add axis titles
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5) +
  labs(title = "Distribution - Miles Per Gallon",
       x = "Miles Per Gallon",
       y = "Count")

#Make graph look nicer
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5,
                 colour = "black",
                 fill = "white") +
  labs(title = "Distribution - Miles Per Gallon",
       x = "Miles Per Gallon",
       y = "Count")

ggsave(filename = paste0(OUTPUT,"mpgVsHp.png"),
       plot = scatterplot,
       width = 6,height = 5.4)



