library(readxl)
library(tidyverse)


# downloaded data from
# https://www.hhs.texas.gov/about/records-statistics/data-statistics/itop-statistics
istop.2016 <- read_excel("2016-itop-race-ethnicity-county.xlsx",
                         skip = 2,
                         col_names = TRUE) %>%
  mutate(Year = 2016)
istop.2017 <- read_excel("2017-itop-race-ethnicity-county.xlsx",
                         skip = 2,
                         col_names = TRUE) %>%
  mutate(Year = 2017)
istop.2018 <- read_excel("2018-itop-race-ethnicity-county.xlsx",
                         skip = 2,
                         col_names = TRUE) %>%
  mutate(Year = 2018)
istop.2019 <- read_excel("2019-itop-race-ethnicity-county.xlsx",
                         skip = 2,
                         col_names = TRUE) %>%
  mutate(Year = 2019)
istop.2020 <- read_excel("2020-itop-race-ethnicity-county.xlsx",
                         skip = 2,
                         col_names = TRUE) %>%
  mutate(Year = 2020)
istop.2021 <- read_excel("2021-itop-race-ethnicity-county.xlsx",
                         skip = 2,
                         col_names = TRUE) %>%
  mutate(Year = 2021)

#combine yearly data frames
ISTOP <- rbind(istop.2016,
               istop.2017,
               istop.2018,
               istop.2019,
               istop.2020)

#save
usethis::use_data(ISTOP, overwrite = TRUE)

