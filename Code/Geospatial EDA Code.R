# Loading in packages and necessary files
library(tidyverse); library(lubridate); library(sf); library(leaflet); library(mapview)

mytheme <- theme_bw(base_size = 14) +
  theme(axis.text = element_text(color = "black"), 
        legend.position = "right")
theme_set(mytheme)

# Wrangling and creating shapefiles of eBird data
Durham.1 <- read.csv("./Data/Processed/tidy_Durham_2010-2014.csv")
Durham.2 <- read.csv("./Data/Processed/tidy_Durham_2015-2019.csv")
Durham.total <- rbind(Durham.1, Durham.2)
Orange.1 <- read.csv("./Data/Processed/tidy_Orange_2010-2014.csv")
Orange.2 <- read.csv("./Data/Processed/tidy_Orange_2015-2019.csv")
Orange.total <- rbind(Orange.1, Orange.2)
Wake.1 <- read.csv("./Data/Processed/tidy_Wake_2010-2014.csv")
Wake.2 <- read.csv("./Data/Processed/tidy_Wake_2015-2017.csv")
Wake.3 <- read.csv("./Data/Processed/tidy_Wake_2018-2019.csv")
Wake.total <- rbind(Wake.1, Wake.2, Wake.3)

Durham.sf <- Durham.total %>%
  group_by(LOCALITY.ID, LONGITUDE, LATITUDE) %>%
  summarize(spp_total = length(unique(COMMON.NAME))) %>%
  st_as_sf(coords = c("LONGITUDE", "LATITUDE"), crs = 4326)

Orange.sf <- Orange.total %>%
  group_by(LOCALITY.ID, LONGITUDE, LATITUDE) %>%
  summarize(spp_total = length(unique(COMMON.NAME))) %>%
  st_as_sf(coords = c("LONGITUDE", "LATITUDE"), crs = 4326)

Wake.sf <- Wake.total %>%
  group_by(LOCALITY.ID, LONGITUDE, LATITUDE) %>%
  summarize(spp_total = length(unique(COMMON.NAME))) %>%
  st_as_sf(coords = c("LONGITUDE", "LATITUDE"), crs = 4326)

rm(Durham.1, Durham.2, Durham.total, Orange.1, Orange.2, Orange.total, Wake.1, Wake.2, Wake.3, Wake.total)

# Mapping observation locations from eBird data
counties_sf<- st_read('./Data/Raw/cb_2018_us_county_20m.shp') %>% 
  filter(NAME == "Durham"|NAME == "Orange"|NAME == "Wake") %>%
  filter(STATEFP == 37)
counties_sf <- st_transform(counties_sf, crs = 4326)

ggplot() + geom_sf(data = counties_sf, aes(fill = NAME)) + 
  geom_sf(data = Durham.sf, size = 0.5) + 
  geom_sf(data = Orange.sf, size = 0.5) + 
  geom_sf(data = Wake.sf, size = 0.5) + labs(fill = "County")

