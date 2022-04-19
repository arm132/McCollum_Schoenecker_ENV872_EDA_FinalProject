# Setting up library, ggplot theme
library(tidyverse); library(lubridate)

mytheme <- theme_classic(base_size = 14) +
  theme(axis.text = element_text(color = "black"), 
        legend.position = "right")
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
  
rm(Durham.1, Durham.2, spp.counts.1, spp.counts.2, event.counts.1, event.counts.2)

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

rm(Orange.1, Orange.2, or.spp.counts.1, or.spp.counts.2, or.event.counts.1, or.event.counts.2)

# Reading in, summarizing, and exploring Wake County data
Wake.1 <- read.csv("./Data/Processed/tidy_Wake_2010-2014.csv")
Wake.2 <- read.csv("./Data/Processed/tidy_Wake_2015-2017.csv")
Wake.3 <- read.csv("./Data/Processed/tidy_Wake_2018-2019.csv")

Wake.1$OBSERVATION.DATE <- as.Date(Wake.1$OBSERVATION.DATE, format = "%m/%d/%Y")
Wake.1 <- Wake.1 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

Wake.2 <- Wake.2 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

Wake.3 <- Wake.3 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))

wa.spp.counts.1 <- Wake.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))
wa.spp.counts.2 <- Wake.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))
wa.spp.counts.3 <- Wake.3 %>%
  group_by(COUNTY, MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))

spp.counts.Wake <- rbind(wa.spp.counts.1, wa.spp.counts.2, wa.spp.counts.3)
  # total number of species observed in Orange county each month of each year
  # write.csv(spp.counts.Wake, "./Data/Processed/Wake_spp_richness.csv")

ggplot(spp.counts.Wake) + geom_point(aes(x = MY, y = spp_total)) + 
  labs(x = "Month", y = "Species Richness")

wa.event.counts.1 <- Wake.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))
wa.event.counts.2 <- Wake.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))
wa.event.counts.3 <- Wake.3 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))

event.counts.Wake <- rbind(wa.event.counts.1, wa.event.counts.2, wa.event.counts.3)
  # total number of sampling events in Orange county each month of each year--
  # illustrates changes in the popularity/usage of eBird over time
  # write.csv(event.counts.Wake, "./Data/Processed/Wake_eventcount.csv")

ggplot(event.counts.Wake) + geom_point(aes(x = MY, y = event_total))
rm(Wake.1, Wake.2, Wake.3, wa.spp.counts.1, wa.spp.counts.2, wa.spp.counts.3, 
   wa.event.counts.1, wa.event.counts.2, wa.event.counts.3)

# Aggregating species and event counts for all three counties
spp.counts <- cbind(spp.counts.Durham[,2:3], spp.counts.Orange[,3], spp.counts.Wake[,3])
colnames(spp.counts) <- c("MY", "Durham", "Orange", "Wake")
spp.counts <- pivot_longer(spp.counts, cols = c("Durham", "Orange", "Wake"), names_to = "County")
  # write.csv(spp.counts, "./Data/Processed/Total_SppRichness.csv")

ggplot(spp.counts) + geom_point(aes(x = MY, y = value, col = County)) + 
  labs(x = "Month", y = "# of Species", col = "County") # Figure 1

event.counts <- cbind(event.counts.Durham[,2:3], event.counts.Orange[,3], event.counts.Wake[,3])
colnames(event.counts) <- c("MY", "Durham", "Orange", "Wake")
event.counts <- pivot_longer(event.counts, cols = c("Durham", "Orange", "Wake"), names_to = "County")
  # write.csv(event.counts, "./Data/Processed/Total_EventCounts.csv")

ggplot(event.counts) + geom_point(aes(x = MY, y = value, col = County)) + 
  labs(x = "Month", y = "# of USEs", col = "County") # Figure 2





