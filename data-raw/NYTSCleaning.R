library(readxl)
library(tidyverse)

##### NYTS Data #####

# downloaded from https://www.cdc.gov/tobacco/data_statistics/surveys/nyts/data/index.html (2021)
nyts <- read_excel("nyts2021.xlsx")

# select relevant columns
nyts <- nyts %>% select(Location, QN1:QN5E, QN154:QN165, QN6, QN9, QN35, QN38, QN51, QN53, QN125:QN126, QN20AA:QN21AL, QN20BA:QN21BL, QN20CA:QN21CL)
nyts <- nyts %>% rename(location = Location, age = QN1, sex = QN2, grade = QN3, american_indian_or_alaska_native = QN5A, asian = QN5B, black_or_african_american = QN5C, native_hawaiian_or_other_pacific_islander = QN5D, white = QN5E)

# clean age, sex, and grade variables
nyts$age <- as.factor(nyts$age)
levels(nyts$age) <- c("9", "10", "11", "12", "13", "14", "15", "16", "17", "18", ">=19")

nyts$sex <- as.factor(nyts$sex)
levels(nyts$sex) <- c("Male", "Female")

nyts$grade <- as.factor(nyts$grade)
levels(nyts$grade) <- c("6th", "7th", "8th", "9th", "10th", "11th", "12th", "Ungraded or Other Grade")

# clean race and ethnicity variables
nyts <- nyts %>% mutate(hispanic = ifelse(if_any(c(QN4B:QN4E), ~ . == 1), 1, 0))
nyts$hispanic[nyts$QN4A == 1] <- 0

nyts <- nyts %>% mutate(race_and_ethnicity = case_when(hispanic == 1 ~ "Hispanic",
                                                       hispanic == 0 & white == 1 ~ "non-Hispanic White",
                                                       hispanic == 0 & black_or_african_american == 1 ~ "non-Hispanic Black",
                                                       hispanic == 0 & (american_indian_or_alaska_native == 1 | asian == 1 | native_hawaiian_or_other_pacific_islander == 1) ~ "non-Hispanic other race"))

nyts <- nyts %>%
  select(-c(QN4A:QN4E,american_indian_or_alaska_native:white,hispanic))


# clean language variable
nyts <- nyts %>% rename(otherlang = QN154)
nyts$otherlang <- as.factor(nyts$otherlang)
levels(nyts$otherlang) <- c("Yes", "No")

# clean lgbt variables
table(nyts$QN155, nyts$QN156)
nyts <- nyts %>% mutate(LGBT = case_when(QN155 == 2 | QN155 == 3 | QN156 == 2 ~ "Yes",
                                         QN155 == 4 | QN156 == 3 ~ "Not Sure",
                                         QN155 == 1 & QN156 == 1 ~ "No")) %>%
  select(-c(QN155, QN156))

# clean psych distress
nyts <- nyts %>% mutate(psych_distress = case_when(QN157A + QN157B + QN157C + QN157D - 4 >=0 & QN157A + QN157B + QN157C + QN157D - 4 <= 2 ~ "none",
                                                   QN157A + QN157B + QN157C + QN157D - 4 >=3 & QN157A + QN157B + QN157C + QN157D - 4 <= 5 ~ "mild",
                                                   QN157A + QN157B + QN157C + QN157D - 4 >=6 & QN157A + QN157B + QN157C + QN157D - 4 <= 8 ~ "moderate",
                                                   QN157A + QN157B + QN157C + QN157D - 4 >=9 & QN157A + QN157B + QN157C + QN157D - 4 <= 12 ~ "severe")) %>%
  select(-c(QN157A, QN157B, QN157C, QN157D))

# clean family affluence
nyts <- nyts %>% mutate(
  family_sum = rowSums(dplyr::select(.,c(QN161, QN162, QN163, QN164)), na.rm=TRUE)-4,
  family_affluence = case_when(family_sum >= 0 & family_sum <=5 ~ "low",
                               family_sum <=7 ~ "medium",
                               family_sum <=9 ~ "high")) %>%
  select(-c(family_sum, QN161, QN162, QN163, QN164))

# clean grades in past 12 months
nyts <- nyts %>% rename(grades_in_past_year = QN165)
nyts$grades_in_past_year <- as.factor(nyts$grades_in_past_year)
levels(nyts$grades_in_past_year) <- c("Mostly A's",
                                      "Mostly B's",
                                      "Mostly C's",
                                      "Mostly D's",
                                      "Mostly F's",
                                      "None of these grades",
                                      "Not Sure")

# clean days of tobacco use in past 30 days
nyts <- nyts %>% mutate(
  num_e_cigs = ifelse(QN6 == 2, 0, QN9),
  num_cigarettes = ifelse(QN35 == 2, 0, QN38),
  num_cigars = ifelse(QN51 == 2, 0, QN53)) %>%
  select(-c(QN6, QN9, QN35, QN38, QN51, QN53))

# clean perceived tobacco use
nyts <- nyts %>% rename(perceived_cigarette_use = QN125, perceived_e_cig_use = QN126)
nyts$perceived_cigarette_use = (nyts$perceived_cigarette_use - 1)/10
nyts$perceived_e_cig_use = (nyts$perceived_e_cig_use - 1)/10

# clean how they got them
nyts <- nyts %>%
  mutate(bought_myself = ifelse(if_any(c(QN20AA, QN20BA, QN20CA),  ~ . == 1), 1, 0),
         had_someone_else_buy = ifelse(if_any(c(QN20AB, QN20BB, QN20CB),  ~ . == 1), 1, 0),
         asked_someone_to_give_me_some = ifelse(if_any(c(QN20AC, QN20BC, QN20CC),  ~ . == 1), 1, 0),
         someone_offered = ifelse(if_any(c(QN20AD, QN20BD, QN20CD),  ~ . == 1), 1, 0),
         got_from_a_friend = ifelse(if_any(c(QN20AE, QN20BE, QN20CE),  ~ . == 1), 1, 0),
         got_from_a_family_member = ifelse(if_any(c(QN20AF, QN20BF, QN20CF),  ~ . == 1), 1, 0),
         took_them = ifelse(if_any(c(QN20AG, QN20BG, QN20CG),  ~ . == 1), 1, 0),
         some_other_way = ifelse(if_any(c(QN20AH, QN20BH, QN20CH),  ~ . == 1), 1, 0))

nyts$bought_myself[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$had_someone_else_buy[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$asked_someone_to_give_me_some[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$someone_offered[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$got_from_a_friend[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$got_from_a_family_member[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$took_them[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$some_other_way[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0


# clean where they bought them
nyts <- nyts %>%
  mutate(did_not_buy = ifelse(if_all(c(QN21AA, QN21BA, QN21CA),  ~ . == 1), 1, 0),
         bought_from_someone = ifelse(if_any(c(QN21AB, QN21BB, QN21CB),  ~ . == 1), 1, 0),
         bought_from_gas_station = ifelse(if_any(c(QN21AC, QN21BC, QN21CC),  ~ . == 1), 1, 0),
         bought_from_grocery_store = ifelse(if_any(c(QN21AD, QN21BD, QN21CD),  ~ . == 1), 1, 0),
         bought_from_drugstore = ifelse(if_any(c(QN21AE, QN21BE, QN21CE),  ~ . == 1), 1, 0),
         bought_from_mall = ifelse(if_any(c(QN21AF, QN21BF, QN21CF),  ~ . == 1), 1, 0),
         bought_from_vending_machine = ifelse(if_any(c(QN21AG, QN21BG, QN21CG),  ~ . == 1), 1, 0),
         bought_from_internet = ifelse(if_any(c(QN21AH, QN21BH, QN21CH),  ~ . == 1), 1, 0),
         bought_through_mail = ifelse(if_any(c(QN21AI, QN21BI, QN21CI),  ~ . == 1), 1, 0),
         bought_through_delivery = ifelse(if_any(c(QN21AJ, QN21BJ, QN21CJ),  ~ . == 1), 1, 0),
         bought_from_smoke_shop = ifelse(if_any(c(QN21AK, QN21BK, QN21CK),  ~ . == 1), 1, 0),
         bought_elsewhere = ifelse(if_any(c(QN21AL, QN21BL, QN21CL),  ~ . == 1), 1, 0))

nyts$did_not_buy[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 1
nyts$bought_from_someone[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_gas_station[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_grocery_store[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_drugstore[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_mall[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_vending_machine[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_internet[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_through_mail[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_through_delivery[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_from_smoke_shop[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0
nyts$bought_elsewhere[nyts$num_e_cigs == 0 & nyts$num_cigarettes == 0 & nyts$num_cigars == 0] <- 0

nyts$bought_from_someone[nyts$did_not_buy == 1] <- 0
nyts$bought_from_gas_station[nyts$did_not_buy == 1] <- 0
nyts$bought_from_grocery_store[nyts$did_not_buy == 1] <- 0
nyts$bought_from_drugstore[nyts$did_not_buy == 1] <- 0
nyts$bought_from_mall[nyts$did_not_buy == 1] <- 0
nyts$bought_from_vending_machine[nyts$did_not_buy == 1] <- 0
nyts$bought_from_internet[nyts$did_not_buy == 1] <- 0
nyts$bought_through_mail[nyts$did_not_buy == 1] <- 0
nyts$bought_through_delivery[nyts$did_not_buy == 1] <- 0
nyts$bought_from_smoke_shop[nyts$did_not_buy == 1] <- 0
nyts$bought_elsewhere[nyts$did_not_buy == 1] <- 0

nyts$did_not_buy[nyts$bought_from_someone == 1 | nyts$bought_from_gas_station == 1 | nyts$bought_from_grocery_store == 1 | nyts$bought_from_drugstore == 1 | nyts$bought_from_mall == 1 | nyts$bought_from_vending_machine == 1 | nyts$bought_from_internet == 1 | nyts$bought_through_mail == 1 | nyts$bought_through_delivery == 1 | nyts$bought_from_smoke_shop == 1 | nyts$bought_elsewhere == 1] <- 0

# remove irrelevant columns
nyts <- nyts %>% select(-c(QN20AA:QN21AL, QN20BA:QN21BL, QN20CA:QN21CL, ))

# save
usethis::use_data(nyts, overwrite = TRUE)
