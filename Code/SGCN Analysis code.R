# SGCN Analysis
library(tidyverse); library(lubridate); library(trend); library(zoo)
library(Kendall); library(tseries)

Durham.1 <- read.csv("./Data/Raw/tidy_Durham_2010-2014.csv")
Durham.2 <- read.csv("./Data/Raw/tidy_Durham_2015-2019.csv")

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

SGCN <- read.csv("./Data/Raw/xAPPENDIX-PA1-All-SGCN-by-taxonomic-group-2020-update_FINAL_v3.csv")
SGCN_birds <- SGCN[c(56:148),c(1:4)]
colnames(SGCN_birds) <- c("Scientific Name", "Common Name", "Order", "Family")
#write.csv(SGCN_birds, "./Data/Processed/NC_SGCN_birds.csv")
SGCN_bird_list <- SGCN_birds$`Common Name`

Durham.total <- rbind(Durham.1, Durham.2)
Durham.total <- Durham.total %>%
  mutate(SGCN = ifelse(COMMON.NAME %in% SGCN_bird_list, "Y", "N"))

Durham.SGCN <- unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y"])

test.thing <- Durham.total %>%
  group_by(YEAR) %>%
  summarize(SGCN_total = length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y"])))

Durham.SGCN.by.year <- Durham.total %>%
  group_by(YEAR) %>%
  summarize(SGCN_total = length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y"])))

# The not as elegant way since pipe isn't working...
Durham.SGCN.2010 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2010]))
Durham.SGCN.2011 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2011]))
Durham.SGCN.2012 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2012]))
Durham.SGCN.2013 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2013]))
Durham.SGCN.2014 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2014]))
Durham.SGCN.2015 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2015]))
Durham.SGCN.2016 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2016]))
Durham.SGCN.2017 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2017]))
Durham.SGCN.2018 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2018]))
Durham.SGCN.2019 <- length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2019]))

Durham.SGCN.by.year <- rbind(Durham.SGCN.2010, Durham.SGCN.2011, Durham.SGCN.2012, 
                             Durham.SGCN.2013, Durham.SGCN.2014, Durham.SGCN.2015,
                             Durham.SGCN.2016, Durham.SGCN.2017, Durham.SGCN.2018,
                             Durham.SGCN.2019)
Durham.SGCN.by.year <- as.data.frame(Durham.SGCN.by.year) 

Durham.SGCN.by.year <- Durham.SGCN.by.year %>%
  mutate(YEAR = c(2010:2019))

rownames(Durham.SGCN.by.year) <- c(1:10)
colnames(Durham.SGCN.by.year) <- c("SGCN_Total", "Year")
#write.csv(Durham.SGCN.by.year, "./Data/Processed/Durham_SGCNcounts.csv")

Durham.SGCN.by.year <- read.csv("./Data/Processed/Durham_SGCNcounts.csv")

ggplot(Durham.SGCN.by.year) + geom_point(aes(x = Year, y = SGCN_Total), col = "black", size = 2) + 
  geom_line(aes(x = Year, y = SGCN_Total), col = "blue") + 
  scale_x_discrete(name = "Year", limits = c(2010, 2012, 2014, 2016, 2018)) + 
  ylab("Number of SGCN")

                                                                                    