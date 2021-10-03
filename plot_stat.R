# set path
library(rstudioapi)
setwd(dirname(getActiveDocumentContext()$path))

# lib
library(tidyverse)
library(reshape2)

# load data
stat2021 <- read_csv('data/stat2021.csv')

# show total donasi in juta rupiah
stat2021[,2:3] <- stat2021[,2:3] / 1e6

# plot donasi
fig_donasi <- ggplot(data = melt(stat2021[,1:3], id = "Tahun")) +
  geom_bar(mapping = aes(x = Tahun, y = value, fill = variable), 
           color = "white",
           stat = "identity", position = position_dodge()) +
  scale_fill_manual(name = "", values = c("steelblue", "tomato")) +
  scale_x_continuous(breaks = stat2021$Tahun) +
  # labs("") +
  ylab("Total Donasi (dalam juta Rupiah)") +
  theme_classic()

# plot jumlah donatur
fig_donatur <- ggplot(data = stat2021) +
  geom_bar(mapping = aes(x = Tahun, y = JumlahDonatur), stat = "identity", fill = 'grey') +
  scale_x_continuous(breaks = stat2021$Tahun) +
  ylab("Jumlah Donatur (orang)") +
  theme_classic()

# save figs
w <- 8 # set fig width in inch

png(file = "fig/donasi.png",
    width = w, height = w/1.5, units = 'in', res = 300)#, 
    # useDingbats = F) 
fig_donasi
dev.off() 

png(file = "fig/donatur.png",
    width = w, height = w/1.5, units = 'in', res = 300)#, 
    # useDingbats = F) 
fig_donatur
dev.off() 
