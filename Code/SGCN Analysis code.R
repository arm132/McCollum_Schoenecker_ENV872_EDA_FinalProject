# SGCN Analysis
library(tidyverse); library(lubridate)

# Wrangling SGCN data
SGCN <- read.csv("./Data/Raw/xAPPENDIX-PA1-All-SGCN-by-taxonomic-group-2020-update_FINAL_v3.csv")
SGCN_birds <- SGCN[c(56:148),c(1:4)]
colnames(SGCN_birds) <- c("Scientific Name", "Common Name", "Order", "Family")
  # write.csv(SGCN_birds, "./Data/Processed/NC_SGCN_birds.csv")
SGCN_birds <- read.csv("./Data/Processed/NC_SGCN_birds.csv")
SGCN_bird_list <- SGCN_birds$Common.Name

# Calculating SGCN counts by county
  # DURHAM
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

Durham.total <- rbind(Durham.1, Durham.2)
Durham.total <- Durham.total %>%
  mutate(SGCN = ifelse(COMMON.NAME %in% SGCN_bird_list, "Y", "N"))

Durham.SGCN <- unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y"])

test.thing <- Durham.total %>%
  group_by(YEAR) %>%
  summarize(SGCN_total = length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y"])))

# The not as elegant way since pipe isn't working...

length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2010]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2011]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2012]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2013]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2014]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2015]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2016]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2017]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2018]))
length(unique(Durham.total$COMMON.NAME[Durham.total$SGCN == "Y" & Durham.total$YEAR == 2019]))

Du.SGCN.counts <- c(34, 50, 40, 35, 36, 43, 35, 40, 43, 47)
Du.SGCN.years <- c(2010:2019)
Du.SGCN.by.year <- cbind(Du.SGCN.years, Du.SGCN.counts)
colnames(Du.SGCN.by.year) <- c("Year", "SGCN_total")
  # write.csv(Du.SGCN.by.year, "./Data/Processed/Durham_SGCNcounts.csv")

Du.SGCN <- read.csv("./Data/Processed/Durham_SGCNcounts.csv")

  # ORANGE COUNTY
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

Orange.total <- rbind(Orange.1, Orange.2)
Orange.total <- Orange.total %>%
  mutate(SGCN = ifelse(COMMON.NAME %in% SGCN_bird_list, "Y", "N"))

Orange.SGCN <- unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y"])

# The not as elegant way since pipe isn't working...

length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2010]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2011]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2012]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2013]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2014]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2015]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2016]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2017]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2018]))
length(unique(Orange.total$COMMON.NAME[Orange.total$SGCN == "Y" & Orange.total$YEAR == 2019]))

Or.SGCN.counts <- c(26, 23, 25, 29, 31, 33, 32, 32, 33, 31)
Or.SGCN.years <- c(2010:2019)
Or.SGCN.by.year <- cbind(Or.SGCN.years, Or.SGCN.counts)
colnames(Or.SGCN.by.year) <- c("Year", "SGCN_total")
  # write.csv(Or.SGCN.by.year, "./Data/Processed/Orange_SGCNcounts.csv")

Or.SGCN <- read.csv("./Data/Processed/Orange_SGCNcounts.csv")
 
# WAKE COUNTY
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

Wake.total <- rbind(Wake.1, Wake.2, Wake.3)
Wake.total <- Wake.total %>%
  mutate(SGCN = ifelse(COMMON.NAME %in% SGCN_bird_list, "Y", "N"))

Wake.SGCN <- unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y"])

# The not as elegant way since pipe isn't working...

length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2010]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2011]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2012]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2013]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2014]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2015]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2016]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2017]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2018]))
length(unique(Wake.total$COMMON.NAME[Wake.total$SGCN == "Y" & Wake.total$YEAR == 2019]))

Wa.SGCN.counts <- c(38, 42, 46, 49, 43, 48, 49, 45, 48, 50)
Wa.SGCN.years <- c(2010:2019)
Wa.SGCN.by.year <- cbind(Wa.SGCN.years, Wa.SGCN.counts)
colnames(Wa.SGCN.by.year) <- c("Year", "SGCN_total")
  # write.csv(Wa.SGCN.by.year, "./Data/Processed/Wake_SGCNcounts.csv")

Wa.SGCN <- read.csv("./Data/Processed/Wake_SGCNcounts.csv")

# Aggregating SGCN counts for all three counties
SGCN.total <- cbind(Du.SGCN[,2:3], Or.SGCN[,3], Wa.SGCN[,3])
colnames(SGCN.total) <- c("Year", "Durham", "Orange", "Wake")
SGCN.total <- pivot_longer(SGCN.total, cols = c("Durham", "Orange", "Wake"), 
                           names_to = "County")

ggplot(SGCN.total) + geom_point(aes(x = Year, y = value, col = County)) + 
  geom_line(aes(x = Year, y = value, col = County)) + 
  scale_x_discrete(name = "Year", limits = c(2010, 2012, 2014, 2016, 2018)) + 
  ylab("# of SGCN")                                                                                   
