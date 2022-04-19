# Loading necessary packages and files
library(tidyverse); library(lubridate); library(trend); library(zoo)
library(Kendall); library(tseries)

spp.counts.Durham <- read.csv("./Data/Processed/Durham_spp_richness.csv")
event.counts.Durham <- read.csv("./Data/Processed/Durham_eventcount.csv")
spp.counts.Orange <- read.csv("./Data/Processed/Orange_spp_richness.csv")
event.counts.Orange <- read.csv("./Data/Processed/Orange_eventcount.csv")
spp.counts.Wake <- read.csv("./Data/Processed/Wake_spp_richness.csv")
event.counts.Wake <- read.csv("./Data/Processed/Wake_eventcount.csv")

# DURHAM TIME SERIES
  # Species richness by month
Durham.ts <- ts(spp.counts.Durham$spp_total, start = c(2010,1), frequency = 12)
Durham.decomp <- stl(Durham.ts, s.window = "periodic")
plot(Durham.decomp)

Durham.spp.trend <- Kendall::SeasonalMannKendall(Durham.ts) 
Durham.spp.trend
summary(Durham.spp.trend)

Durham_spp_plot <-
  ggplot(spp.counts.Durham, aes(x = MY, y = spp_total)) +
  geom_point() +
  geom_line() +
  labs(x = "Month/Year", y = "# of Species Observed") +
  geom_smooth(method = lm)
print(Durham_spp_plot)

  # Unique sampling events by month
Durham.event.ts <- ts(event.counts.Durham$event_total, start = c(2010,1), frequency = 12)
Durham.event.decomp <- stl(Durham.event.ts, s.window = "periodic")
plot(Durham.event.decomp)

Durham.event.trend <- Kendall::SeasonalMannKendall(Durham.event.ts) 
Durham.event.trend
summary(Durham.event.trend)

# ORANGE TIME SERIES
  # Species richness by month
Orange.ts <- ts(spp.counts.Orange$spp_total, start = c(2010,1), frequency = 12)
Orange.decomp <- stl(Orange.ts, s.window = "periodic")
plot(Orange.decomp)

Orange.spp.trend <- Kendall::SeasonalMannKendall(Orange.ts) 
Orange.spp.trend
summary(Orange.spp.trend)

Orange_spp_plot <-
  ggplot(spp.counts.Orange, aes(x = MY, y = spp_total)) +
  geom_point() +
  geom_line() +
  labs(x = "Month/Year", y = "# of Species Observed") +
  geom_smooth(method = lm)
print(Orange_spp_plot)

  # Unique sampling events by month
Orange.event.ts <- ts(event.counts.Orange$event_total, start = c(2010,1), frequency = 12)
Orange.event.decomp <- stl(Orange.event.ts, s.window = "periodic")
plot(Orange.event.decomp)

Orange.event.trend <- Kendall::SeasonalMannKendall(Orange.event.ts) 
Orange.event.trend
summary(Orange.event.trend)

# WAKE TIME SERIES
  # Species richness by month
Wake.ts <- ts(spp.counts.Wake$spp_total, start = c(2010,1), frequency = 12)
Wake.decomp <- stl(Wake.ts, s.window = "periodic")
plot(Wake.decomp)

Wake.spp.trend <- Kendall::SeasonalMannKendall(Wake.ts) 
Wake.spp.trend
summary(Wake.spp.trend)

Wake_spp_plot <-
  ggplot(spp.counts.Wake, aes(x = MY, y = spp_total)) +
  geom_point() +
  geom_line() +
  labs(x = "Month/Year", y = "# of Species Observed") +
  geom_smooth(method = lm)
print(Wake_spp_plot)

# Unique sampling events by month
Wake.event.ts <- ts(event.counts.Wake$event_total, start = c(2010,1), frequency = 12)
Wake.event.decomp <- stl(Wake.event.ts, s.window = "periodic")
plot(Wake.event.decomp)

Wake.event.trend <- Kendall::SeasonalMannKendall(Wake.event.ts) 
Wake.event.trend
summary(Wake.event.trend)



