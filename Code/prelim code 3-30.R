# Setting up library, ggplot theme
library(tidyverse); library(lubridate); library(trend); library(zoo)
library(Kendall); library(tseries)

mytheme <- theme_classic(base_size = 14) +
  theme(axis.text = element_text(color = "black"), 
        legend.position = "top")
theme_set(mytheme)

# Reading in, summarizing, and exploring Durham County data
Durham.1 <- read.csv("./Data/Processed/tidy_Durham_2010-2014.csv")
Durham.2 <- read.csv("./Data/Processed/tidy_Durham_2015-2019.csv")

Durham.1$OBSERVATION.DATE <- as.Date(Durham.1$OBSERVATION.DATE, format = "%m/%d/%Y")
Durham.1 <- Durham.1 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

Durham.2$OBSERVATION.DATE <- as.Date(Durham.2$OBSERVATION.DATE, format = "%m/%d/%Y")
Durham.2 <- Durham.2 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

spp.counts.1 <- Durham.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))
spp.counts.2 <- Durham.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))

spp.counts.Durham <- rbind(spp.counts.1, spp.counts.2)
  # total number of species observed in Durham county each month of each year
  # write.csv(spp.counts.Durham, "./Data/Processed/Durham_spp_richness.csv")

ggplot(spp.counts.Durham) + geom_point(aes(x = MY, y = spp_total)) + 
  labs(x = "Month", y = "Species Richness")

event.counts.1 <- Durham.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))
event.counts.2 <- Durham.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))

event.counts.Durham <- rbind(event.counts.1, event.counts.2)
  # total number of sampling events in Durham county each month of each year--
  # illustrates changes in the popularity/usage of eBird over time
  # write.csv(event.counts.Durham, "./Data/Processed/Durham_eventcount.csv")

ggplot(event.counts.Durham) + geom_point(aes(x = MY, y = event_total))
  
# Reading in, summarizing, and exploring Orange County data
Orange.1 <- read.csv("./Data/Processed/tidy_Orange_2010-2014.csv")
Orange.2 <- read.csv("./Data/Processed/tidy_Orange_2015-2019.csv")

Orange.1$OBSERVATION.DATE <- as.Date(Orange.1$OBSERVATION.DATE, format = "%m/%d/%Y")
Orange.1 <- Orange.1 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

Orange.2$OBSERVATION.DATE <- as.Date(Orange.2$OBSERVATION.DATE, format = "%m/%d/%Y")
Orange.2 <- Orange.2 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

or.spp.counts.1 <- Orange.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))
or.spp.counts.2 <- Orange.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))

spp.counts.Orange <- rbind(or.spp.counts.1, or.spp.counts.2)
  # total number of species observed in Orange county each month of each year
  # write.csv(spp.counts.Orange, "./Data/Processed/Orange_spp_richness.csv")

ggplot(spp.counts.Orange) + geom_point(aes(x = MY, y = spp_total)) + 
  labs(x = "Month", y = "Species Richness")

or.event.counts.1 <- Orange.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))
or.event.counts.2 <- Orange.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))

event.counts.Orange <- rbind(or.event.counts.1, or.event.counts.2)
  # total number of sampling events in Orange county each month of each year--
  # illustrates changes in the popularity/usage of eBird over time
  # write.csv(event.counts.Orange, "./Data/Processed/Orange_eventcount.csv")

ggplot(event.counts.Orange) + geom_point(aes(x = MY, y = event_total))

