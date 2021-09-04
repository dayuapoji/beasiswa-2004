# set path
library(rstudioapi)
setwd(dirname(getActiveDocumentContext()$path))

# lib
library(tidyverse)

# load data
donatur <- read_csv('data/donatur.csv')

# create txt files containing list of donors each year
for (year in colnames(donatur)) {
  list <- donatur[year] %>% drop_na(.) %>% t(.)
  write.table(list, paste0("list/donatur",year,".txt"), sep = ", ",
              row.names = F, col.names = F)
}


