#' Data from TB studies in South Africa and Uganda
#'
#' Demographic and health data collected from primary care clinic patients
#' presenting with TB symptoms in rural South Africa (Kharitode study) and urban
#' Uganda (STOMP study).
#'
#' @format A data frame with 1762 rows and 11 variables:
#' \describe{
#'   \item{tb}{TB test result (1 = positive, 0 = negative)}
#'   \item{age_group}{Age group}
#'   \item{hiv_pos}{Answer to the question "What is your HIV status?"
#'   (1 = positive, 0 = negative)}
#'   \item{diabetes}{Self-reported history of diabetes (1 = diabetes, 0 = no
#'   diabetes)}
#'   \item{ever_smoke}{Answer to the question "Do you smoke tobacco?" (1 = "yes"
#'   or "not currently, but formally", 0 = "no, never")}
#'   \item{past_tb}{Answer to the question "Have you ever been diagnosed with TB
#'   in the past?" (1 = yes, 0 = no)}
#'   \item{male}{Sex (1 = male, 0 = female)}
#'   \item{hs_less}{Answer to the question "What is the highest grade of
#'   education that you have attained?" (1 = Grade 12 or lower, 0 = Any
#'   postgraduate education or higher)}
#'   \item{two_weeks_symp}{Answer to the question "How long had you had a TB
#'   symptom (cough, fever, night sweats, weight loss) before you came to
#'   clinic?" (1 = >2 weeks, 0 = <2 weeks)}
#'   \item{num_symptoms}{Number of TB symptoms (cough, fever, night sweats,
#'   weight loss)}
#'   \item{country}{Country in which data were collected (South Africa =
#'   Kharitode study, Uganda = STOMP study)}
#' }
#'
#' @source Baik, Y., Rickman, H. M., Hanrahan, C. F., Mmolawa, L., Kitonsa, P.
#' J., Sewelana, T., Nalutaaya, A., Kendall, E. A., Lebina, L., Martinson, N.,
#' Katamba, A., & Dowdy, D. W. (2020). A clinical score for identifying active
#' tuberculosis while awaiting microbiological results: Development and
#' validation of a multivariable prediction model in sub-Saharan Africa. PLoS
#' medicine, 17(11), e1003420.
#' \url{https://doi.org/10.1371/journal.pmed.1003420}
#'
#' The data are held in the Johns Hopkins University
#' Data Services database and available at
#' \url{https://doi.org/10.7281/T1/W2AG3A}.
"tb_diagnosis"

