library(readxl)
library(tidyverse)

## Cases Data ##

## downloaded US casedata from https://covid19datahub.io/articles/data.html "Download by Country"
#covidcases <- read.csv("USA.csv")

# filter to just US
#covidcases <- covidcases[!(covidcases$administrative_area_level_2 %in% c("American Samoa", "Guam", "Northern Mariana Islands", "Puerto Rico", "Virgin Islands", "")), ]

# select columns of interest
#covidcases <- covidcases[ , c("date", "confirmed", "deaths",
#                              "administrative_area_level_2", "administrative_area_level_3")]

# filter dates to 2020
#covidcases <- covidcases[covidcases$date >= "2020-01-01" & covidcases$date <= "2020-12-31",]

#save
#write.csv(covidcases, "uscovidcases.csv", row.names = F)

covidcases <- read.csv("uscovidcases.csv")
covidcases <- covidcases %>% filter(!is.na(confirmed))

# get daily cases
covidcases <- covidcases %>% group_by(administrative_area_level_2, administrative_area_level_3) %>% mutate(daily_cases = confirmed - lag(confirmed))

# get daily deaths
covidcases <- covidcases %>% group_by(administrative_area_level_2, administrative_area_level_3) %>% mutate(daily_deaths = deaths - lag(deaths))

for (i in 1:nrow(covidcases)) {
  if (is.na(covidcases$daily_cases[i])) {
    covidcases$daily_cases[i] <- covidcases$confirmed[i]
  }
  if (is.na(covidcases$daily_deaths[i])) {
    covidcases$daily_deaths[i] <- covidcases$deaths[i]
  }
}

# rename columns
covidcases <- covidcases %>% rename(state = administrative_area_level_2, city = administrative_area_level_3)
covidcases <- covidcases %>% select(-c(confirmed, deaths))
covidcases$city <- na_if(covidcases$city, "")

# save
usethis::use_data(covidcases, overwrite = TRUE)

## Mobility Data ##

# downloaded mobility data from https://github.com/descarteslabs/DL-COVID-19 , https://github.com/descarteslabs/DL-COVID-19/blob/master/DL-us-mobility-daterow.csv
#mobility <- read.csv("DL-us-mobility-daterow.csv")

# filter dates to 2020
#mobility <- mobility[mobility$date >= "2020-01-01" & mobility$date <= "2020-09-01",]

# select relevant columns
#mobility <- mobility %>% filter(admin1 != "")
#mobility <- mobility %>% select(-c(country_code, admin_level))

#write.csv(mobility, "mobility2020.csv", row.names = F)

mobility <- read.csv("mobility2020.csv")

mobility <- mobility %>% rename(state = admin1, county = admin2)
mobility$county <- na_if(mobility$county, "")

#save
usethis::use_data(mobility, overwrite = TRUE)

## Lockdown Data ##
lockdowndates <- read_excel("LockdownData.xlsx")
usethis::use_data(lockdowndates, overwrite = TRUE)

