library(readxl)
library(openxlsx)
library(tidyverse)
library(COVID19)

## Cases Data ##

#download case data from the COVID19 package
covidcases <- COVID19::covid19(country="US",
                               level = 3,
                               start="2020-03-01",
                               end= "2020-09-01")

#filter to just the states
covidcases <- covidcases[!(covidcases$administrative_area_level_2 %in%
                             c("American Samoa", "Guam",
                               "Northern Mariana Islands",
                               "Puerto Rico",
                               "Virgin Islands")), ]

#select relevant variables
covidcases <- covidcases[ , c("date",
                              "confirmed",
                              "deaths",
                              "administrative_area_level_2",
                              "administrative_area_level_3")]


covidcases$week <- week(covidcases$date)

#create variables for daily cases and daily deaths
covidcases <- covidcases %>%
  filter(administrative_area_level_2 == "Massachusetts",
         administrative_area_level_3 == "Middlesex") %>%
  group_by(administrative_area_level_2, administrative_area_level_3, week) %>%
  arrange(date) %>%
  filter(row_number()==n()) %>%
  ungroup() %>%
  group_by(administrative_area_level_2, administrative_area_level_3) %>%
  mutate(weekly_cases = ifelse(is.na(lag(confirmed)),
                               confirmed,
                               confirmed - lag(confirmed)),
         weekly_deaths = ifelse(is.na(lag(deaths)),
                                deaths,
                                deaths - lag(deaths))) %>%
  rename(state = administrative_area_level_2,
         county = administrative_area_level_3) %>%
  select(-c(date, confirmed, deaths)) %>%
  ungroup()

#save
usethis::use_data(covidcases, overwrite = TRUE)


## Mobility Data ##

#downloaded mobility data from https://github.com/descarteslabs/DL-COVID-19
#the commented code here represent previous data cleaning steps conducted to
#reduce the size of the dataset so that it can be uploaded to github
#mobility <- read.csv("DL-us-mobility-daterow.csv")

# filter dates to 2020
# mobility <- mobility[mobility$date >= "2020-01-01" &
#                        mobility$date <= "2020-09-01",]

# select relevant columns
#mobility <- mobility %>% filter(admin1 != "")
#mobility <- mobility %>% select(-c(country_code, admin_level))

#write.csv(mobility, "mobility2020.csv", row.names = F)

#read in data
mobility <- read.csv("mobility2020.csv")

#rename variables
mobility <- mobility %>% rename(state = admin1, county = admin2)
mobility$county <- na_if(mobility$county, "")

#select variables of interest
mobility <- mobility %>% select(-c(county, fips))

#sum and average variables of interest across counties
mobility <- mobility %>% group_by(state, date) %>%
  summarize(samples = sum(samples),
            m50 = mean(m50),
            m50_index = mean(m50_index))
#save
usethis::use_data(mobility, overwrite = TRUE)

## Lockdown Data ##

#read in data
path <- "COVID-19 US state policy database 3_30_2022.xlsx"
cols <- as.character(read_excel(path, n_max = 1, col_names = FALSE))
lockdowndates <- read_excel(path, skip = 5, col_names = cols, na="0")

#select cols and get single start
lockdowndates <- lockdowndates %>%
  mutate(STAYHOME = as.character(STAYHOME),
         STAYHOMENOGP = as.character(STAYHOMENOGP),
         END_STHM = as.character(END_STHM)
         ) %>%
  mutate(Lockdown_Start = ifelse(is.na(STAYHOME), STAYHOMENOGP,
                                 STAYHOME)) %>%
  rename(State=STATE, Lockdown_End = END_STHM) %>%
  select(State, Lockdown_Start, Lockdown_End)

#convert NAs to None
lockdowndates[is.na(lockdowndates)] <- "None"

#save
usethis::use_data(lockdowndates, overwrite = TRUE)

