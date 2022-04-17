# Setting up library, ggplot theme
library(tidyverse); library(lubridate); library(trend); library(zoo)
library(Kendall); library(tseries)

mytheme <- theme_classic(base_size = 14) +
  theme(axis.text = element_text(color = "black"), 
        legend.position = "top")
theme_set(mytheme)

# Reading in and wrangling data
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
 #write.csv(spp.counts.Durham, "./Data/Processed/Durham_spp_richness.csv")

ggplot(spp.counts.Durham) + geom_point(aes(x = MY, y = spp_total)) + 
  labs(x = "Month", y = "Species Richness")

# Time Series Analysis of spp counts in Durham county
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
