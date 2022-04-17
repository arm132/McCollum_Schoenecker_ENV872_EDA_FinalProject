library(tidyverse)

# Wranging eBird Durham County raw data
Durham.1 <- read.csv("./Data/Raw/eBird_Durham_2010-2014.csv")
Durham.2 <- read.csv("./Data/Raw/eBird_Durham_2015-2019.csv")

Durham.1 <- Durham.1 %>%
  select(COMMON.NAME, OBSERVATION.COUNT, COUNTY, LOCALITY:SAMPLING.EVENT.IDENTIFIER)
Durham.2 <- Durham.2 %>%
  select(COMMON.NAME, OBSERVATION.COUNT, COUNTY, LOCALITY:SAMPLING.EVENT.IDENTIFIER)

write.csv(Durham.1, "./Data/Processed/tidy_Durham_2010-2014.csv")
write.csv(Durham.2, "./Data/Processed/tidy_Durham_2015-2019.csv")

# Wranging eBird Orange County raw data
Orange.1 <- read.csv("./Data/Raw/eBird_Orange_2010-2014.csv")
Orange.2 <- read.csv("./Data/Raw/eBird_Orange_2015-2019.csv")

Orange.1 <- Orange.1 %>%
  select(COMMON.NAME, OBSERVATION.COUNT, COUNTY, LOCALITY:SAMPLING.EVENT.IDENTIFIER)
Orange.2 <- Orange.2 %>%
  select(COMMON.NAME, OBSERVATION.COUNT, COUNTY, LOCALITY:SAMPLING.EVENT.IDENTIFIER)

write.csv(Orange.1, "./Data/Processed/tidy_Orange_2010-2014.csv")
write.csv(Orange.2, "./Data/Processed/tidy_Orange_2015-2019.csv")

# Wranging eBird Wake County raw data
Wake.1 <- read.csv("./Data/Raw/eBird_Wake_2010-2014.csv")
Wake.2 <- read.csv("./Data/Raw/eBird_Wake_2015-2019.csv")

Wake.1 <- Wake.1 %>%
  select(COMMON.NAME, OBSERVATION.COUNT, COUNTY, LOCALITY:SAMPLING.EVENT.IDENTIFIER)
Wake.2 <- Wake.2 %>%
  select(COMMON.NAME, OBSERVATION.COUNT, COUNTY, LOCALITY:SAMPLING.EVENT.IDENTIFIER)

write.csv(Wake.1, "./Data/Processed/tidy_Wake_2010-2014.csv")
write.csv(Wake.2, "./Data/Processed/tidy_Wake_2015-2019.csv")