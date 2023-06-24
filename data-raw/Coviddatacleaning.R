library(readxl)
library(tidyverse)
library(COVID19)

## Cases Data ##
covidcases <- COVID19::covid19(country="US",
                               level = 3,
                               start="2020-03-01",
                               end= "2020-09-01")
covidcases <- covidcases[!(covidcases$administrative_area_level_2 %in%
                             c("American Samoa", "Guam",
                               "Northern Mariana Islands",
                               "Puerto Rico",
                               "Virgin Islands")), ]
covidcases <- covidcases[ , c("date",
                              "confirmed",
                              "deaths",
                              "administrative_area_level_2",
                              "administrative_area_level_3")]

covidcases <- covidcases %>%
  group_by(administrative_area_level_2, administrative_area_level_3) %>%
  arrange(date) %>%
  mutate(daily_deaths = deaths - lag(deaths),
         daily_cases = confirmed - lag(confirmed)) %>%
  rename(state = administrative_area_level_2,
         county = administrative_area_level_3)

covidcases <- covidcases %>%
  mutate(daily_deaths = ifelse(is.na(daily_deaths),
                               deaths,
                               daily_deaths),
         daily_cases = ifelse(is.na(daily_cases),
                                         confirmed,
                                         daily_cases)) %>%
  select(-c(confirmed, deaths))

# save
usethis::use_data(covidcases, overwrite = TRUE)


## Mobility Data ##

# downloaded mobility data from https://github.com/descarteslabs/DL-COVID-19
#mobility <- read.csv("DL-us-mobility-daterow.csv")

# filter dates to 2020
# mobility <- mobility[mobility$date >= "2020-01-01" &
#                        mobility$date <= "2020-09-01",]

# select relevant columns
#mobility <- mobility %>% filter(admin1 != "")
#mobility <- mobility %>% select(-c(country_code, admin_level))

#write.csv(mobility, "mobility2020.csv", row.names = F)

mobility <- read.csv("mobility2020.csv")

mobility <- mobility %>% rename(state = admin1, county = admin2)
mobility$county <- na_if(mobility$county, "")

mobility <- mobility %>% select(-c(county, fips))
mobility <- mobility %>% group_by(state, date) %>%
  summarize(samples = sum(samples),
            m50 = mean(m50),
            m50_index = mean(m50_index))
#save
usethis::use_data(mobility, overwrite = TRUE)

## Lockdown Data ##
library(openxlsx)
lockdowndates <- read_excel("LockdownData.xlsx")

lockdowndates$Lockdown_Start[lockdowndates$Lockdown_Start != "None"] <-
  as.character(convertToDate(as.numeric(
    lockdowndates$Lockdown_Start[lockdowndates$Lockdown_Start != "None"])))
lockdowndates$Lockdown_End[lockdowndates$Lockdown_End != "None"] <-
  as.character(convertToDate(as.numeric(
    lockdowndates$Lockdown_End[lockdowndates$Lockdown_End != "None"])))

usethis::use_data(lockdowndates, overwrite = TRUE)

