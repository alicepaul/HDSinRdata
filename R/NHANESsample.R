#' A sample of data from the National Health and Nutrition Examination Survey (NHANES)
#'
#' Lead, blood pressure, and demographic variables from NHANES 1999-2018, downloaded from the nhanesA package and
#' chosen in an effort to replicate the analyses conducted by
#' \url{https://www.frontiersin.org/articles/10.3389/fpubh.2022.836357/full}. Data was filtered to adults 20 years of age
#' or older with nonimissing blood lead level, blood pressure, and demographic information.
#'
#' @format A data frame with 31,265 rows and 15 variables:
#' \describe{
#'   \item{id}{Respondent sequence number ("SEQN" in NHANES)}
#'   \item{age}{Age ("RIDAGEYR" in NHANES: Best age in years of the sample person at time of HH screening.
#'   Individuals 85 and over are topcoded at 85 years of age up to 2006 and
#'   individuals 80 and over are topcoded at 80 years of age after 2006.)}
#'   \item{sex}{Gender ("RIAGENDR" in NHANES)}
#'   \item{race}{Race and ethnicity ("RIDRETH1" in NHANES)}
#'   \item{education}{Education Level ("DMDEDUC2" in NHANES: What is the highest grade or level of school you have completed
#'   or the highest degree you have received?)}
#'   \item{income}{Poverty income ratio (PIR): a ratio of family income to poverty threshold ("INDFMPIR" in NHANES)}
#'   \item{smoke}{Smoking status (Combination of SMQ020 (Have you smoked at least 100 cigarettes in your entire life?)
#'   and SMQ040 (Do you now smoke cigarettes?) in NHANES: equal to "Still Smoke" if respondent answered "Yes" to SMQ020
#'   and either "Every day" or "Some days" to SMQ040, equal to "Quit Smoke" if respondent answered "Yes" to SMQ020 and
#'   "Not at all" to SMQ040, and equal to "Never Smoke" otherwise.)}
#'   \item{year}{Year of the Study (Equal to the first year of the two year interval in which the response was recorded
#'   - NHANES surveys are grouped in two-year intervals)}
#'   \item{lead}{Lead (ug/dL): "LBXBPB" in NHANES unless the reported level of lead was less than the lower limit of detection (llod),
#'   as defined by the paper cited above, for the relevant year, in which case "LBXBPB" was replaced by llod/sqrt(2))}
#'   \item{bmi_cat}{Body Mass Index Category (kg/m^2): Based on "BMXBMI" in NHANES}
#'   \item{dbp}{Diastolic Blood Pressure (mmHg): Based on the four diastolic blood pressure readings ("BPXDI1", "BPXDI2", "BPXDI3", and "BPXDI4")
#'   in NHANES: if only one reading was nonmissing, this reading was used. Otherwise, if more than one reading was nonmissing, the first was discarded
#'   and the remaining readings were averaged.}
#'   \item{lead_quantile}{Quantile membership for blood lead levels based on the distribution of lead levels in the data}
#'   \item{sbp}{Systolic Blood Pressure (mmHg): Based on the four diastolic blood pressure readings ("BPXSY1", "BPXSY2", "BPXSY3", and "BPXSY4")
#'   in NHANES: if only one reading was nonmissing, this reading was used. Otherwise, if more than one reading was nonmissing, the first was discarded
#'   and the remaining readings were averaged.}
#'   \item{hyp}{Hypertension Status: Based on "BPQ020" (Have you ever been told by a doctor or other health professional that you had hypertension,
#'   also called high blood pressure?) and "BPQ040A" (Because of your high blood pressure/hypertension, have you ever been told to take prescribed medicine?)
#'   in NHANES. Equal to 1 if the respondent answered "Yes" to either of these questions, or, if data on either of these questions isn't answered, if sbp >= 130
#'   or dbp >= 80, and equal to 0 otherwise.}
#'   \item{alc}{Alcohol Use: Based on "ALQ120Q" (In the past 12 months, how often did you drink any type of alcoholic beverage?) up to 2016 and "ALQ121"
#'   (the same question, but used after 2016)  in NHANES. Equal to "Yes" if the respondent's answer to either of these questions was >0 and equal to "No" otherwise.}
#' }
#'
#'
#' @source \url{https://cran.r-project.org/web/packages/nhanesA/vignettes/Introducing_nhanesA.html}
"NHANESsample"
