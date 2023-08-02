library(tidyverse)
library(tidycensus)
library(stringr)
library(readxl)

# create a vector of desired Census variables using
# https://api.census.gov/data/2020/dec/dhc/variables.html

female_vars <- c(paste("P12_0", 30:38, "N", sep = ""), # All Female
                 paste("P12H_0", 30:38, "N", sep = ""),  # Hispanic Female
                 paste("P12I_0", 30:38, "N", sep = ""),  # White Female
                 paste("P12J_0", 30:38, "N", sep = ""),  # Black Female
                 paste("P12K_0", 30:38, "N", sep = ""),  # Native American Female
                 paste("P12L_0", 30:38, "N", sep = ""),  # Asian Female
                 paste("P12M_0", 30:38, "N", sep = ""),
                 # Native Hawaiian or Pacific Islander Female
                 paste("P12N_0", 30:38, "N", sep = ""),  # Other Female
                 paste("P12O_0", 30:38, "N", sep = "")) # Two or More

# get Texas data on the above variables from the 2020 decennial Census
df <- get_decennial(year=2020, state="TX", geography="county",
                    variables = female_vars, sumfile="dhc")

# reformat variables
tex_cens <- df %>%
  pivot_wider(names_from = variable, values_from = value) %>%
  select(-c(GEOID)) %>%
  rename(county = NAME)

tex_cens <- tex_cens %>% mutate(tot_pop = rowSums(tex_cens[ , paste("P12_0", 30:38, "N", sep = "")]),
         white = rowSums(tex_cens[ , paste("P12I_0", 30:38, "N", sep = "")]),
         hispanic = rowSums(tex_cens[ , paste("P12H_0", 30:38, "N", sep = "")]),
         black = rowSums(tex_cens[ , paste("P12J_0", 30:38, "N", sep = "")]),
         native_american = rowSums(tex_cens[ , paste("P12K_0", 30:38, "N", sep = "")]),
         asian = rowSums(tex_cens[ , paste("P12L_0", 30:38, "N", sep = "")]),
         other = rowSums(tex_cens[ , c(paste("P12M_0", 30:38, "N", sep = ""),
                                       paste("P12N_0", 30:38, "N", sep = ""),
                                       paste("P12O_0", 30:38, "N", sep = ""))]),
         county = str_replace(county, " County, Texas", "")) %>%
  select(-all_of(female_vars))


# add in a column for whether a county is rural or urban using
# https://www.tdhca.state.tx.us/home-division/docs/22-IndexCounties.pdf
tex_cens$urban <- "Rural"
urban_counties <- c("Lubbock", "Potter", "Randall", "Jones",
                    "Taylor", "Wichita", "Collin", "Dallas",
                    "Denton", "Ellis", "Grayson", "Hunt",
                    "Johnson", "Kaufman", "Parker", "Rockwall",
                    "Tarrant", "Wise", "Bowie", "Gregg", "Harrison",
                    "Smith", "Upshur", "Hardin", "Jefferson",
                    "Orange", "Brazoria", "Chambers", "Fort Bend",
                    "Galveston", "Harris", "Liberty", "Montgomery",
                    "Waller", "Bastrop", "Caldwell", "Hays",
                    "Travis", "Williamson", "Bell", "Brazos",
                    "Coryell", "Lampasas", "McLennan", "Bexar",
                    "Comal", "Guadalupe", "Kendall", "Medina",
                    "Nueces", "San Patricio", "Victoria",
                    "Cameron", "Hidalgo", "Webb", "Ector", "Martin",
                    "Midland", "Tom Green", "El Paso")

tex_cens$urban[tex_cens$county %in% urban_counties] <- "Urban"

# add in ITOP data from
# https://www.hhs.texas.gov/about/records-statistics/data-statistics/itop-statistics
tex_2021 <- read_excel("2021-itop-race-ethnicity-county.xlsx",
                       range="A3:I262")
tex_2021 <- tex_2021 %>%
  filter(!(County %in% c("TX Resident Total","Other Country","Not Stated",
                         "Unknown Texas County", "Other State"))) %>%
  rename(county = County, total_itop = Total, asian_itop = Asian,
         white_itop = White, hispanic_itop = Hispanic, black_itop = Black,
         native_american_itop = "Native American", other_itop = Other,
         not_stated_itop = "Not Stated")
tex_2021$year <- 2021

tex_2020 <- read_excel("2020-itop-race-ethnicity-county.xlsx",
                       range="A3:I262")
tex_2020 <- tex_2020 %>%
  filter(!(County %in% c("TX Resident Total","Other Country","Not Stated",
                         "Unknown Texas County", "Other State"))) %>%
  rename(county = County, total_itop = Total, asian_itop = Asian,
         white_itop = White, hispanic_itop = Hispanic, black_itop = Black,
         native_american_itop = "Native American", other_itop = Other,
         not_stated_itop = "Not Stated")
tex_2020$year <- 2020

tex_2019 <- read_excel("2019-itop-race-ethnicity-county.xlsx",
                       range="A3:I262")
tex_2019 <- tex_2019 %>%
  filter(!(County %in% c("TX Resident Total","Other Country","Not Stated",
                         "Unknown Texas County", "Other State"))) %>%
  rename(county = County, total_itop = Total, asian_itop = Asian,
         white_itop = White, hispanic_itop = Hispanic, black_itop = Black,
         native_american_itop = "Native American", other_itop = Other,
         not_stated_itop = "Not Stated")
tex_2019$year <- 2019
tex_2019$county[tex_2019$county == "Mcculloch"] <- "McCulloch"
tex_2019$county[tex_2019$county == "Mclennan"] <- "McLennan"
tex_2019$county[tex_2019$county == "Mcmullen"] <- "McMullen"

tex_2018 <- read_excel("2018-itop-race-ethnicity-county.xlsx",
                       range="A3:I262")
tex_2018 <- tex_2018 %>%
  filter(!(County %in% c("TX Resident Total","Other Country","Not Stated",
                         "Unknown Texas County", "Other State"))) %>%
  rename(county = County, total_itop = Total, asian_itop = Asian,
         white_itop = White, hispanic_itop = Hispanic, black_itop = Black,
         native_american_itop = "Native American", other_itop = Other,
         not_stated_itop = "Not Stated")
tex_2018$year <- 2018

tex_2017 <- read_excel("2017-itop-race-ethnicity-county.xlsx",
                       range="A3:I262")
tex_2017 <- tex_2017 %>%
  filter(!(County %in% c("TX Residents","Other Country","Not Stated",
                         "Unknown Texas County", "Other State"))) %>%
  rename(county = County, total_itop = Total, asian_itop = Asian,
         white_itop = White, hispanic_itop = Hispanic, black_itop = Black,
         native_american_itop = "Native American", other_itop = Other,
         not_stated_itop = "Not Stated")
tex_2017$year <- 2017

tex_2016 <- read_excel("2016-itop-race-ethnicity-county.xlsx",
                       range="A3:I262")
tex_2016$County <- str_to_title(tex_2016$County)
tex_2016 <- tex_2016 %>%
  filter(!(County %in% c("Tx Resident Total","Other Country","Not Stated",
                         "Tx Unknown County", "Other State"))) %>%
  rename(county = County, total_itop = Total, asian_itop = Asian,
         white_itop = White, hispanic_itop = Hispanic, black_itop = Black,
         native_american_itop = "Native American", other_itop = Other,
         not_stated_itop = "Not Stated")
tex_2016$year <- 2016
tex_2016$county[tex_2016$county == "Dewitt"] <- "DeWitt"
tex_2016$county[tex_2016$county == "Mcculloch"] <- "McCulloch"
tex_2016$county[tex_2016$county == "Mclennan"] <- "McLennan"
tex_2016$county[tex_2016$county == "Mcmullen"] <- "McMullen"


tex_itop <- rbind(tex_2016,
                  tex_2017,
                  tex_2018,
                  tex_2019,
                  tex_2020,
                  tex_2021)

tex_itop <- left_join(tex_itop, tex_cens, by="county")

# create rates
tex_itop <- tex_itop %>%
  mutate(total_rate = 1000*total_itop/tot_pop,
         white_rate = 1000*white_itop/white,
         black_rate = 1000*black_itop/black,
         hispanic_rate = 1000*hispanic_itop/hispanic,
         asian_rate = 1000*asian_itop/asian,
         native_american_rate = 1000*native_american_itop/native_american,
         other_rate = 1000*other_itop/other) %>%
  select(-c(tot_pop, white, black, hispanic, asian,
            native_american, other, not_stated_itop))

tex_itop$total_rate[is.nan(tex_itop$total_rate) |
                      is.infinite(tex_itop$total_rate)] <- 0
tex_itop$white_rate[is.nan(tex_itop$white_rate) |
                      is.infinite(tex_itop$white_rate)] <- 0
tex_itop$black_rate[is.nan(tex_itop$black_rate) |
                      is.infinite(tex_itop$black_rate)] <- 0
tex_itop$hispanic_rate[is.nan(tex_itop$hispanic_rate) |
                         is.infinite(tex_itop$hispanic_rate)] <- 0
tex_itop$asian_rate[is.nan(tex_itop$asian_rate) |
                      is.infinite(tex_itop$asian_rate)] <- 0
tex_itop$native_american_rate[is.nan(tex_itop$native_american_rate) |
                                is.infinite(tex_itop$native_american_rate)] <- 0
tex_itop$other_rate[is.nan(tex_itop$other_rate) |
                      is.infinite(tex_itop$other_rate)] <- 0

# downloaded from
# https://www.ers.usda.gov/data-products/rural-urban-continuum-codes/
urb_rural <- read_excel("ruralurbancodes2013.xls")

urb_rural <- urb_rural %>% filter(State == "TX")
urb_rural$County_Name <- gsub(pattern = " County",
                              replacement = "",
                              x = urb_rural$County_Name)
tex_itop <- left_join(tex_itop, urb_rural, by = c("county" = "County_Name")) %>%
  mutate(county_type = case_when(RUCC_2013 < 4 ~ "Urban",
                   RUCC_2013 > 3 & RUCC_2013 < 8 ~ "Suburban",
                   RUCC_2013 > 7 ~ "Rural")) %>%
  select(-c(FIPS, State, Population_2010, RUCC_2013, Description))

#save
usethis::use_data(tex_itop, overwrite = TRUE)


