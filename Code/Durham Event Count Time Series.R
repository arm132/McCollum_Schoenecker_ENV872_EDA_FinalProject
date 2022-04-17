# Time Series of Sampling Event Identifier
library(tidyverse); library(lubridate); library(trend); library(zoo)
library(Kendall); library(tseries)

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

event.counts.1 <- Durham.1 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))
event.counts.2 <- Durham.2 %>%
  group_by(COUNTY, MY) %>%
  summarize(event_total = length(unique(SAMPLING.EVENT.IDENTIFIER)))

event.counts.Durham <- rbind(event.counts.1, event.counts.2)
 #write.csv(event.counts.Durham, "./Data/Processed/Durham_eventcount.csv")

ggplot(event.counts.Durham) + geom_point(aes(x = MY, y = event_total))

Durham.event.ts <- ts(event.counts.Durham$event_total, start = c(2010,1), frequency = 12)
Durham.event.decomp <- stl(Durham.event.ts, s.window = "periodic")
plot(Durham.event.decomp)

Durham.event.trend <- Kendall::SeasonalMannKendall(Durham.event.ts) 
Durham.event.trend
summary(Durham.event.trend)


