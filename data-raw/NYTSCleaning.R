library(readxl)
library(tidyverse)

##### NYTS Data #####

# downloaded from https://www.cdc.gov/tobacco/data_statistics/surveys/nyts/data/index.html (2021)
nyts <- read_excel("nyts2021.xlsx")

# select relevant columns
nyts <- nyts %>% select(Location, QN1:QN5E, QN154:QN165, QN6, QN9, QN35, QN38, QN51, QN53, QN62, QN64, QN67, QN69, QN73, QN74, QN75, QN76, QN77, QN78, QN79, QN80, QN81, QN82, QN84, QN85, QN87, QN88, QN89, QN125:QN126, QN20AA:QN21AL, QN20BA:QN21BL, QN20CA:QN21CL, QN20DA:QN21DL, QN20EA:QN21EL, QN20JA:QN21JL, QN20FA:QN21FL, QN20GA:QN21GL, QN20HA:QN21HL, QN20IA:QN21IL, QN20KA:QN21KL, QN20LA:QN21LL)
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
nyts <- nyts[, c(1:4, 295, 15:293)]


# clean language variable
nyts <- nyts %>% rename(otherlang = QN154)
nyts$otherlang <- as.factor(nyts$otherlang)
levels(nyts$otherlang) <- c("Yes", "No")

# clean lgbt variables
table(nyts$QN155, nyts$QN156)
nyts <- nyts %>% mutate(LGBT = case_when(QN155 == 2 | QN155 == 3 | QN156 == 2 ~ "Yes",
                                         QN155 == 4 | QN156 == 3 ~ "Not Sure",
                                         QN155 == 1 & QN156 == 1 ~ "No"))

nyts <- nyts[, c(1:6, 285, 9:284)]


# clean psych distress
nyts <- nyts %>% mutate(psych_distress = case_when(QN157A + QN157B + QN157C + QN157D - 4 >=0 & QN157A + QN157B + QN157C + QN157D - 4 <= 2 ~ "none",
                                                   QN157A + QN157B + QN157C + QN157D - 4 >=3 & QN157A + QN157B + QN157C + QN157D - 4 <= 5 ~ "mild",
                                                   QN157A + QN157B + QN157C + QN157D - 4 >=6 & QN157A + QN157B + QN157C + QN157D - 4 <= 8 ~ "moderate",
                                                   QN157A + QN157B + QN157C + QN157D - 4 >=9 & QN157A + QN157B + QN157C + QN157D - 4 <= 12 ~ "severe")) %>%
  select(-c(QN157A, QN157B, QN157C, QN157D))

# clean family affluence
nyts <- nyts %>% mutate(family_affluence = case_when(QN161 + QN162 + QN163 + QN164 - 4 >= 0 & QN161 + QN162 + QN163 + QN164 - 4 <=5 ~ "low",
                                                     QN161 + QN162 + QN163 + QN164 - 4 >= 6 & QN161 + QN162 + QN163 + QN164 - 4 <=7 ~ "medium",
                                                     QN161 + QN162 + QN163 + QN164 - 4 >= 8 & QN161 + QN162 + QN163 + QN164 - 4 <=9 ~ "high")) %>%
  select(-c(QN161, QN162, QN163, QN164))

nyts <- nyts[, c(1:7, 276, 277, 8:275)]

# clean grades in past 12 months
nyts <- nyts %>% rename(grades_in_past_year = QN165)
nyts$grades_in_past_year <- as.factor(nyts$grades_in_past_year)
levels(nyts$grades_in_past_year) <- c("Mostly A's", "Mostly B's", "Mostly C's", "Mostly D's", "Mostly F's", "None of these grades", "Not Sure")

# clean days of tobacco use in past 30 days
nyts <- nyts %>% rename(e_cigs = QN9, cigarettes = QN38, cigars = QN53, chewing_tobacco_snuff_or_dip = QN64, hookah_or_waterpipe = QN69, roll_your_own = QN74, pipes = QN76, snus = QN78, dissolvable = QN80, bidis = QN82, heated_tobacco_product = QN85, nicotine_pouch = QN88, any_tobacco_product = QN89)

nyts$e_cigs[nyts$QN6 == 2] <- 0
nyts$cigarettes[nyts$QN35 == 2] <- 0
nyts$cigars[nyts$QN51 == 2] <- 0
nyts$chewing_tobacco_snuff_or_dip[nyts$QN62 == 2] <- 0
nyts$hookah_or_waterpipe[nyts$QN67 == 2] <- 0
nyts$roll_your_own[nyts$QN73 == 2] <- 0
nyts$pipes[nyts$QN75 == 2] <- 0
nyts$snus[nyts$QN77 == 2] <- 0
nyts$dissolvable[nyts$QN79 == 2] <- 0
nyts$bidis[nyts$QN81 == 2] <- 0
nyts$heated_tobacco_product[nyts$QN84 == 2] <- 0
nyts$nicotine_pouch[nyts$QN87 == 2] <- 0
nyts$any_tobacco_product[nyts$QN6 == 2 & nyts$QN35 == 2 & nyts$QN51 == 2 & nyts$QN62 == 2 & nyts$QN67 == 2 & nyts$QN73 == 2 & nyts$QN75 == 2 & nyts$QN77 == 2 & nyts$QN79 == 2 & nyts$QN81 == 2 & nyts$QN84 == 2 & nyts$QN87 == 2] <- 0

nyts <- nyts %>% select(-c(QN6, QN35, QN51, QN62, QN67, QN73, QN75, QN77, QN79, QN81, QN84, QN87))

# clean perceived tobacco use
nyts <- nyts %>% rename(perceived_cigarette_use = QN125, perceived_e_cig_use = QN126)
nyts$perceived_cigarette_use = (nyts$perceived_cigarette_use - 1)/10
nyts$perceived_e_cig_use = (nyts$perceived_e_cig_use - 1)/10

# clean how they got them
nyts <- nyts %>%
  mutate(bought_myself = ifelse(if_any(c(QN20AA, QN20BA, QN20CA, QN20DA, QN20EA, QN20FA, QN20GA, QN20HA, QN20IA, QN20JA, QN20KA, QN20LA),  ~ . == 1), 1, 0),
         had_someone_else_buy = ifelse(if_any(c(QN20AB, QN20BB, QN20CB, QN20DB, QN20EB, QN20FB, QN20GB, QN20HB, QN20IB, QN20JB, QN20KB, QN20LB),  ~ . == 1), 1, 0),
         asked_someone_to_give_me_some = ifelse(if_any(c(QN20AC, QN20BC, QN20CC, QN20DC, QN20EC, QN20FC, QN20GC, QN20HC, QN20IC, QN20JC, QN20KC, QN20LC),  ~ . == 1), 1, 0),
         someone_offered = ifelse(if_any(c(QN20AD, QN20BD, QN20CD, QN20DD, QN20ED, QN20FD, QN20GD, QN20HD, QN20ID, QN20JD, QN20KD, QN20LD),  ~ . == 1), 1, 0),
         got_from_a_friend = ifelse(if_any(c(QN20AE, QN20BE, QN20CE, QN20DE, QN20EE, QN20FE, QN20GE, QN20HE, QN20IE, QN20JE, QN20KE, QN20LE),  ~ . == 1), 1, 0),
         got_from_a_family_member = ifelse(if_any(c(QN20AF, QN20BF, QN20CF, QN20DF, QN20EF, QN20FF, QN20GF, QN20HF, QN20IF, QN20JF, QN20KF, QN20LF),  ~ . == 1), 1, 0),
         took_them = ifelse(if_any(c(QN20AG, QN20BG, QN20CG, QN20DG, QN20EG, QN20FG, QN20GG, QN20HG, QN20IG, QN20JG, QN20KG, QN20LG),  ~ . == 1), 1, 0),
         some_other_way = ifelse(if_any(c(QN20AH, QN20BH, QN20CH, QN20DH, QN20EH, QN20FH, QN20GH, QN20HH, QN20IH, QN20JH, QN20KH, QN20LH),  ~ . == 1), 1, 0))

nyts$bought_myself[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$had_someone_else_buy[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$asked_someone_to_give_me_some[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$someone_offered[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$got_from_a_friend[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$got_from_a_family_member[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$took_them[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$some_other_way[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0


# clean where they bought them
nyts <- nyts %>%
  mutate(did_not_buy = ifelse(if_all(c(QN21AA, QN21BA, QN21CA, QN21DA, QN21EA, QN21FA, QN21GA, QN21HA, QN21IA, QN21JA, QN21KA, QN21LA),  ~ . == 1), 1, 0),
         bought_from_someone = ifelse(if_any(c(QN21AB, QN21BB, QN21CB, QN21DB, QN21EB, QN21FB, QN21GB, QN21HB, QN21IB, QN21JB, QN21KB, QN21LB),  ~ . == 1), 1, 0),
         bought_from_gas_station = ifelse(if_any(c(QN21AC, QN21BC, QN21CC, QN21DC, QN21EC, QN21FC, QN21GC, QN21HC, QN21IC, QN21JC, QN21KC, QN21LC),  ~ . == 1), 1, 0),
         bought_from_grocery_store = ifelse(if_any(c(QN21AD, QN21BD, QN21CD, QN21DD, QN21ED, QN21FD, QN21GD, QN21HD, QN21ID, QN21JD, QN21KD, QN21LD),  ~ . == 1), 1, 0),
         bought_from_drugstore = ifelse(if_any(c(QN21AE, QN21BE, QN21CE, QN21DE, QN21EE, QN21FE, QN21GE, QN21HE, QN21IE, QN21JE, QN21KE, QN21LE),  ~ . == 1), 1, 0),
         bought_from_mall = ifelse(if_any(c(QN21AF, QN21BF, QN21CF, QN21DF, QN21EF, QN21FF, QN21GF, QN21HF, QN21IF, QN21JF, QN21KF, QN21LF),  ~ . == 1), 1, 0),
         bought_from_vending_machine = ifelse(if_any(c(QN21AG, QN21BG, QN21CG, QN21DG, QN21EG, QN21FG, QN21GG, QN21HG, QN21IG, QN21JG, QN21KG, QN21LG),  ~ . == 1), 1, 0),
         bought_from_internet = ifelse(if_any(c(QN21AH, QN21BH, QN21CH, QN21DH, QN21EH, QN21FH, QN21GH, QN21HH, QN21IH, QN21JH, QN21KH, QN21LH),  ~ . == 1), 1, 0),
         bought_through_mail = ifelse(if_any(c(QN21AI, QN21BI, QN21CI, QN21DI, QN21EI, QN21FI, QN21GI, QN21HI, QN21II, QN21JI, QN21KI, QN21LI),  ~ . == 1), 1, 0),
         bought_through_delivery = ifelse(if_any(c(QN21AJ, QN21BJ, QN21CJ, QN21DJ, QN21EJ, QN21FJ, QN21GJ, QN21HJ, QN21IJ, QN21JJ, QN21KJ, QN21LJ),  ~ . == 1), 1, 0),
         bought_from_smoke_shop = ifelse(if_any(c(QN21AK, QN21BK, QN21CK, QN21DK, QN21EK, QN21FK, QN21GK, QN21HK, QN21IK, QN21JK, QN21KK, QN21LK),  ~ . == 1), 1, 0),
         bought_elsewhere = ifelse(if_any(c(QN21AL, QN21BL, QN21CL, QN21DL, QN21EL, QN21FL, QN21GL, QN21HL, QN21IL, QN21JL, QN21KL, QN21LL),  ~ . == 1), 1, 0))

nyts$did_not_buy[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 1
nyts$bought_from_someone[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_gas_station[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_grocery_store[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_drugstore[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_mall[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_vending_machine[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_internet[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_through_mail[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_through_delivery[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_from_smoke_shop[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0
nyts$bought_elsewhere[nyts$e_cigs == 0 & nyts$cigarettes == 0 & nyts$cigars == 0 & nyts$chewing_tobacco_snuff_or_dip == 0 & nyts$hookah_or_waterpipe == 0 & nyts$roll_your_own == 0 & nyts$pipes == 0 & nyts$snus == 0 & nyts$dissolvable == 0 & nyts$bidis == 0 & nyts$heated_tobacco_product == 0 & nyts$nicotine_pouch == 0] <- 0

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
nyts <- nyts %>% select(-c(QN20AA:QN21AL, QN20BA:QN21BL, QN20CA:QN21CL, QN20DA:QN21DL, QN20EA:QN21EL, QN20JA:QN21JL, QN20FA:QN21FL, QN20GA:QN21GL, QN20HA:QN21HL, QN20IA:QN21IL, QN20KA:QN21KL, QN20LA:QN21LL))

# save
usethis::use_data(nyts, overwrite = TRUE)
