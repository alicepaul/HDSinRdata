#' Data from TB study in South Africa (Kharitode Study)
#'
#' Demographic and health data collected from primary care clinic patients
#' presenting with TB symptoms in rural South Africa.
#'
#' @format A data frame with 1634 rows and 34 variables:
#' \describe{
#'   \item{consent}{Did the individual consent to participate in the study? (1 =
#'   Yes)}
#'   \item{new_suspect_fac}{Is the participant a patient recently tested for
#'   TB? (1 = Yes)}
#'   \item{ic_adult_fac}{Has informed consent been provided by the participant
#'   if age 18 or older? (1 = Yes; 2 = No; 77 = Under 18)}
#'   \item{ic_adol_fac}{Has parental consent and adolescent/child assent been
#'   provided if the participant is less than 18 years of age? (1 = Yes, 2 =
#'   No)}
#'   \item{facility_crf_complete}{Complete? (2 = Yes)}
#'   \item{xpert_status_fac}{Is the participant TB-negative or TB-positive? (1 =
#'   Positive; 2 = Negative)}
#'   \item{age_group}{Age group}
#'   \item{sex}{Sex (1 = Male; 2 = Female)}
#'   \item{hiv_status_fac}{What is your HIV status? (1 = Positive, 2 = Negative,
#'   3 = Unknown, 99 = Refused)}
#'   \item{other_conditions_fac___1}{Do you have any other medical conditions?
#'  -- None}
#'  \item{other_conditions_fac___3}{Do you have any other medical conditions?
#'  -- Diabetes}
#'  \item{other_conditions_fac___88}{Do you have any other medical conditions?
#'  -- Refused}
#'  \item{other_conditions_fac___99}{Do you have any other medical conditions?
#'  -- Missing}
#'  \item{symp_fac___1}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- Cough}
#'  \item{symp_fac___2}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- Fever}
#'  \item{symp_fac___3}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- Weight loss}
#'  \item{symp_fac___4}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- Drenching sweats at night}
#'  \item{symp_fac___5}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- Pain in my chest}
#'  \item{symp_fac___11}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- No symptoms}
#'  \item{symp_fac___99}{On the day of your clinic visit, which of the following
#'  symptoms did you have? -- Missing}
#'  \item{length_symp_unit_fac}{How long had you had that symptom before you
#'  came to clinic that day? Enter unit of response. (1 = Days, 2 = Weeks, 3 =
#'  Months, 4 = Years, 77 = Unknown)}
#'  \item{length_symp_mnt_fac}{How long had you had that symptom before you
#'  came to clinic that day? Length of time in months.}
#'  \item{length_symp_yr_fac}{How long had you had that symptom before you
#'  came to clinic that day? Length of time in years.}
#'  \item{length_symp_days_fac}{How long had you had that symptom before you
#'  came to clinic that day? Length of time in days.}
#'  \item{length_symp_wk_fac}{How long had you had that symptom before you
#'  came to clinic that day? Length of time in weeks.}
#'  \item{educ_fac}{What is the highest grade of education that you have
#'  attained? (0 = None; 1 = Grade 1; 2 = Grade 2; 3 = Grade 3; 4 = Grade 4; 5 =
#'  Grade 5; 6 = Grade 6; 7 = Grade 7; 8 = Grade 8; 9 = Grade 9; 10 = Grade 10;
#'  11 = Grade 11; 12 = Grade 12; 13 = Any postgraduate education; 14 = Attained
#'  postgraduate degree; 99 = Missing)}
#'  \item{on_arvs_fac}{Are	you	currently	taking	antiretrovirals	for	your	HIV?
#'  (1 = Yes; 2 = No; 77 = Don't know or not applicable)}
#'  \item{smk_fac}{Do you smoke tobacco? (1 = Yes; 2 = Not currently, but
#'  formerly; 3 = No, never; 88 = Refused; 99 = Missing)}
#'  \item{dx_tb_past_fac}{Have you ever been diagnosed with TB in the past? (1 =
#'  Yes, 2 = No, 77 = Don't know)}
#'  \item{seek_care_unit_fac }{If you were to develop a mild cough, how long
#'  would it likely be before you saw a doctor or other healthcare professional
#'  for a diagnosis? Unit of response. (1 = Days; 2 = Weeks; 3 = Months;
#'  4 = Years; 77 = Don't know)}
#'  \item{seek_care_days_fac}{If you were to develop a mild cough, how long would it likely be
#'  before you saw a doctor or other healthcare professional for a diagnosis?
#'  Length of time in days.}
#'  \item{seek_care_wks_fac}{If you were to develop a mild cough, how long would it likely be
#'  before you saw a doctor or other healthcare professional for a diagnosis?
#'  Length of time in weeks}
#'  \item{seek_care_mth_fac}{If you were to develop a mild cough, how long would it likely be
#'  before you saw a doctor or other healthcare professional for a diagnosis?
#'  Length of time in months.}
#'  \item{seek_care_yr_fac}{If you were to develop a mild cough, how long would it likely be
#'  before you saw a doctor or other healthcare professional for a diagnosis?
#'  Length of time in years.}
#' }
#'
#' @source Baik, Y., Rickman, H. M., Hanrahan, C. F., Mmolawa, L., Kitonsa, P.
#' J., Sewelana, T., Nalutaaya, A., Kendall, E. A., Lebina, L., Martinson, N.,
#' Katamba, A., & Dowdy, D. W. (2020). A clinical score for identifying active
#' tuberculosis while awaiting microbiological results: Development and
#' validation of a multivariable prediction model in sub-Saharan Africa. PLoS
#' medicine, 17(11), e1003420.
#' \doi{10.1371/journal.pmed.1003420}
#'
#' The data are held in the Johns Hopkins University
#' Data Services database and available at
#' \doi{10.7281/T1/W2AG3A}.
"tb_diagnosis_raw"

