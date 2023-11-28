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
  group_by(administrative_area_level_2, administrative_area_level_3, week) %>%
  arrange(date) %>%
  filter(row_number()==1 | row_number()==n()) %>%
  ungroup() %>%
  group_by(administrative_area_level_2, administrative_area_level_3) %>%
  mutate(weekly_cases = ifelse(lead(confirmed) - confirmed == 0,
                               confirmed,
                               lead(confirmed) - confirmed),
         weekly_deaths = ifelse(lead(deaths) - deaths == 0,
                                deaths,
                                lead(deaths) - deaths)) %>%
  group_by(administrative_area_level_2, administrative_area_level_3, week) %>%
  slice(1) %>% select(-c(date, confirmed, deaths)) %>%
  rename(state = administrative_area_level_2,
         county = administrative_area_level_3) %>%
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

#read in data (created by hand in excel using the dates from ballotpedia)
lockdowndates <- read_excel("LockdownData.xlsx")

#convert the dates to the correct form
lockdowndates$Lockdown_Start[lockdowndates$Lockdown_Start != "None"] <-
  as.character(convertToDate(as.numeric(
    lockdowndates$Lockdown_Start[lockdowndates$Lockdown_Start != "None"])))
lockdowndates$Lockdown_End[lockdowndates$Lockdown_End != "None"] <-
  as.character(convertToDate(as.numeric(
    lockdowndates$Lockdown_End[lockdowndates$Lockdown_End != "None"])))

#save
usethis::use_data(lockdowndates, overwrite = TRUE)

