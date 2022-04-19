# Loading necessary packages and files
library(tidyverse); library(lubridate); library(trend); library(zoo)
library(Kendall); library(tseries)

Durham.1 <- read.csv("./Data/Processed/tidy_Durham_2010-2014.csv")
Orange.1 <- read.csv("./Data/Processed/tidy_Orange_2010-2014.csv")
Wake.1 <- read.csv("./Data/Processed/tidy_Wake_2010-2014.csv")

# Extra wrangling for analysis
total.1 <- rbind(Durham.1, Orange.1, Wake.1)

total.1$OBSERVATION.DATE <- as.Date(total.1$OBSERVATION.DATE, format = "%m/%d/%Y")
total.1 <- total.1 %>%
  mutate(MONTH = month(OBSERVATION.DATE)) %>%
  mutate(YEAR = year(OBSERVATION.DATE)) %>%
  mutate(MY = my(paste0(MONTH,"-",YEAR)))
spp.counts.total <- total.1 %>%
  group_by(MY) %>%
  summarize(spp_total = length(unique(COMMON.NAME)))

total.event.counts <- read.csv("./Data/Processed/Total_EventCounts.csv")
total.event.counts <- total.event.counts %>%
  group_by(MY) %>%
  summarize(total_events = sum(value))

# REGION-WIDE TIME SERIES
# Species richness by month
Total.ts <- ts(spp.counts.total$spp_total, start = c(2010,1), frequency = 12)
Total.decomp <- stl(Total.ts, s.window = "periodic")
plot(Total.decomp)

Total.spp.trend <- Kendall::SeasonalMannKendall(Total.ts) 
Total.spp.trend
summary(Total.spp.trend)

Total_spp_plot <-
  ggplot(spp.counts.total, aes(x = MY, y = spp_total)) +
  geom_point() +
  geom_line() +
  labs(x = "Month/Year", y = "# of Species Observed") +
  geom_smooth(method = lm)
print(Total_spp_plot)

# Unique sampling events by month
Total.event.ts <- ts(total.event.counts$total_events, start = c(2010,1), frequency = 12)
Total.event.decomp <- stl(Total.event.ts, s.window = "periodic")
plot(Total.event.decomp)

Total.event.trend <- Kendall::SeasonalMannKendall(Total.event.ts) 
Total.event.trend
summary(Total.event.trend)
