# Purpose: ggvis tutorial using IMR data from NRHM
# Author: Shreyas Gadgin Matha (shreyas.gm61@gmail.com)
# Date created: 2016-04-21
#---------------------------------------------------------------------
rm(list = ls())
#---------------------------------------------------------------------
# Load required packages

# check to see if packages are installed. Install them if they are not, then load them into the R session.

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("dplyr", "xts", "lubridate", "tidyr", "ggvis")
ipak(packages)
#---------------------------------------------------------------------
#Set file paths

ROOT <- "C:/Users/Shreyas Gadgin Matha/Documents/Random/Data Visualization IFMR/data-visualization-training/"
DATA <- paste0(ROOT,"data/")
OUTPUT <- paste0(ROOT,"output/")
#---------------------------------------------------------------------

#Read CSV file
imrData <- read.csv(paste0(DATA,'IMRsex2001-2012.csv'))

#Prepare data for analysis
imrData <- imrData %>%
  select(state = India.States.Uts,
         X2001.Total:X2012.Female) %>%  #Keep selected variables
  gather(yearSex,imr,X2001.Total:X2012.Female) %>%    #Reshape data
  separate(col = yearSex,
           into = c('year','sex'),
           sep = "\\.",
           remove = TRUE) %>%         #Split yearSex column into year and sex columns
  filter(sex != 'Total') %>%          #Remove observations of category 'Total'
  mutate(year = as.Date(paste0(substr(year,start = 2,stop = 5),'-12-31')))   #Remove 'X' at the beginning of year, convert variable into date.


#Plot bar graph
imrData %>%
  filter(state != 'INDIA',year == max(year)) %>%
  mutate(state = as.character(state)) %>%
  ggvis(x = ~state,y = ~imr) %>%
  layer_bars() %>%
  add_axis("x",title = "",
           properties = axis_props(labels = list(angle = 270,
                                                 dy = -5,
                                                 align = "right")))
