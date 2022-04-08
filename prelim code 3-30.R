library(tidyverse)
library(lubridate)
library(trend)
library(zoo)
library(Kendall)
library(tseries)

mytheme <- theme_classic(base_size = 14) +
  theme(axis.text = element_text(color = "black"), 
        legend.position = "top")
theme_set(mytheme)

Durham.1 <- read.csv("tidy_Durham_2010-2014.csv")
Durham.2 <- read.csv("tidy_Durham_2015-2019.csv")

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

ggplot(spp.counts.Durham) + geom_point(aes(x = MY, y = spp_total))

Durham.ts <- ts(spp.counts.Durham$spp_total, start = c(2010,1), frequency = 12)
Durham.decomp <- stl(Durham.ts, s.window = "periodic")
plot(Durham.decomp)

# Next step: import SGCN list, get SGCN counts for the different counties

