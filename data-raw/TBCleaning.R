suppressMessages(library(tidyverse))


mode_imputation <- function(x) {
  ux <- unique(x)
  mode <- ux[which.max(tabulate(match(x, ux)))]

  new_x <- replace_na(x, mode)
  return(new_x)
}

kharitode_preprocessing <- function(df) {
  # Select variables and rename
  df <- df %>% select(c(xpert_status_fac, age_group, sex, hiv_status_fac,
                              other_conditions_fac___3, symp_fac___1, symp_fac___2,
                              symp_fac___3, symp_fac___4, length_symp_wk_fac,
                              length_symp_days_fac, length_symp_unit_fac, smk_fac,
                              dx_tb_past_fac, educ_fac)) %>%
    rename(tb = xpert_status_fac, hiv_pos = hiv_status_fac,
           diabetes = other_conditions_fac___3, cough = symp_fac___1,
           fever = symp_fac___2, weight_loss = symp_fac___3,
           night_sweats = symp_fac___4, ever_smoke = smk_fac, past_tb = dx_tb_past_fac,
           education = educ_fac)

  df$tb <- case_when(df$tb == 1 ~ 1, df$tb == 2 ~ 0)
  df$male <- case_when(df$sex == 1 ~ 1, df$sex == 2 ~ 0)
  df$hiv_pos <- case_when(df$hiv_pos == 1 ~ 1, df$hiv_pos %in% c(2,77) ~ 0)
  df$ever_smoke <- case_when(df$ever_smoke %in% c(1,2) ~ 1,
                                df$ever_smoke == 3 ~ 0)
  df$past_tb <- case_when(df$past_tb == 1 ~ 1, df$past_tb == 2 ~ 0)

  # Categorize education to HS and above
  df$hs_less <- case_when(df$education <= 12 ~ 1,
                             df$education %in% c(13, 14) ~ 0,
                             TRUE ~ NA)
  df <- df %>% select(-c(education))

  # Categorize number of weeks
  df$two_weeks_symp <- case_when(df$length_symp_days_fac <= 14 |
                                      df$length_symp_wk_fac < 2 ~ 0,
                                    df$length_symp_unit_fac == 77 |
                                      df$length_symp_wk_fac == 999 ~ NA,
                                    TRUE ~ 1)
  df <- df %>% select(-c(length_symp_wk_fac, length_symp_days_fac,
                               length_symp_unit_fac, sex))

  # Total number of symptoms
  df$num_symptoms <- df$fever + df$weight_loss +
    df$cough+df$night_sweats
  df <- df %>% select(-c(night_sweats, weight_loss, cough, fever))

  # Exclude participants with no TB symptoms
  df <- df %>%
    filter(num_symptoms != 0)

  # All factors
  df[] <- lapply(df, function(x){return(as.factor(x))})
  df$age_group <- relevel(df$age_group, ref="[55,99)")

  # Single imputation (mode)
  df <- df %>%
    mutate_all(mode_imputation)

  return(df)

}

stomp_preprocessing <- function(df) {

  # Select variables and rename
  df <- df %>%
    select(why_a_case_xpert, com_why_a_case_xpert,
           why_a_ctrl_xpert, com_why_a_ctrl_xpert,
           age_group, sex_female, hivcat1, medical_conditions___3,
           cough = symptoms_past_week___1, fever = symptoms_past_week___3,
           night_sweats = symptoms_past_week___5, weight_loss,
           smoked_tobacco_in_past, treated_past, highest_grade_education,
           cough_weeks, weightloss_weeks, nightsweats_weeks, feverchills_weeks) %>%

    rename(hiv_pos = hivcat1, diabetes = medical_conditions___3,
           ever_smoke = smoked_tobacco_in_past, past_tb = treated_past) %>%

    mutate(tb = case_when(why_a_case_xpert == 1 | com_why_a_case_xpert == 1 ~ 1,
                          why_a_ctrl_xpert == 2 | com_why_a_ctrl_xpert == 2 ~ 0),
           male = case_when(sex_female == 1 ~ 0,
                            sex_female == 0 ~ 1),
           hs_less = case_when(highest_grade_education < 5 ~ 1,
                               highest_grade_education >= 5 ~ 0),
           num_symptoms = cough + fever + night_sweats + weight_loss,
           two_weeks_symp = case_when(cough_weeks >= 2 | weightloss_weeks >= 2 |
                             nightsweats_weeks >= 2 | feverchills_weeks >= 2 ~ 1,
                             TRUE ~ 0)) %>%

    select(tb, age_group, hiv_pos, diabetes, ever_smoke, past_tb, male, hs_less,
           two_weeks_symp, num_symptoms)


  # All factors
  df[] <- lapply(df, function(x){return(as.factor(x))})
  df$age_group <- relevel(df$age_group, ref="[55,99)")

  # Single imputation (mode)
  df <- df %>%
    mutate_all(mode_imputation)

  return(df)

}

# Clean Kharitode Data
kharitode_raw <- read.csv("data-raw/Kharitodestudy.csv")
kharitode_clean <- kharitode_preprocessing(kharitode_raw)

# Clean STOMP Data
stomp_raw <- read.csv("data-raw/STOMPstudy.csv")
stomp_clean <- stomp_preprocessing(stomp_raw)

# Combine datasets
kharitode_clean$country <- "South Africa"
stomp_clean$country <- "Uganda"
tb_diagnosis <- bind_rows(kharitode_clean, stomp_clean)

#save
usethis::use_data(tb_diagnosis, overwrite = TRUE)
