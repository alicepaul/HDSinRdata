#' Data from Alter et al. (2021): Hierarchical Clustering by Patient-Reported Pain Distribution Alone Identifies Distinct
#' Chronic Pain Subgroups Differing by Pain Intensity, Quality, and Clinical Outcomes
#'
#' Information from patient-reported pain assessments using the Collaborative Health Outcomes Information Registry (CHOIR)
#' at baseline and at a 3-month follow-up.
#'
#' @format A data frame with 21,659 rows and 93 variables.
#' \describe{
#'   \item{PATIENT_NUM}{Deidentified study identification number}
#'   \item{X101-X238}{Body Region Selected = 1; not selected = 0}
#'   \item{PAIN_INTENSITY_AVERAGE}{Pain intensity NRS (0-10)}
#'   \item{PROMIS_PHYSICAL_FUNCTION}{PROMIS physical function T-score, range 0-100}
#'   \item{PROMIS_PAIN_BEHAVIOR}{PROMIS pain behavior T-score, range 0-100}
#'   \item{PROMIS_DEPRESSION}{PROMIS depression T-score, range 0-100}
#'   \item{PROMIS_ANXIETY}{PROMIS anxiety T-score, range 0-100}
#'   \item{PROMIS_SLEEP_DISTURB_V1_0}{PROMIS sleep disturbance T-score, range 0-100}
#'   \item{PROMIS_PAIN_INTERFERENCE}{PROMIS pain interference, range 0-100}
#'   \item{GH_MENTAL_SCORE}{PROMIS global mental health, range 0-100}
#'   \item{GH_PHYSICAL_SCORE}{PROMIS global physical health, range 0-100}
#'   \item{AGE_AT_CONTACT}{Age at baseline assessment extracted from EMR}
#'   \item{BMI}{Body Mass Index at baseline extracted from EMR}
#'   \item{CCI_TOTAL_SCORE}{Charlson Comorbidity Index extracted from EMR}
#'   \item{PAIN_INTENSITY_AVERAGE.follow_up}{Pain intensity NRS at follow up (range 0 - 10)}
#'   \item{BODYREGIONSUM}{Number of body regions selected on the body map}
#'   \item{PAT_SEX}{Patient reported gender, "male" or "female", derived from EMR}
#'   \item{PAT_RACE}{Patient reported race, 17 categories, EMR derived}
#'   \item{CCI_bin}{Binary Charlson Comorbidity Index: "No comorbidity" CCI score = 0; "Any comorbidity" CCI score > 0}
#'   \item{medicaid_bin}{Medicaid payor: "yes" or "no"}
#' }
#'
#' Note that, as described in the paper, PROMIS is short for Patient-Reported Outcomes Measurement Information System:
#' the source of the validated instruments for pain assessment used in the adaptive computerized test given to patients
#' in accordance with the Initiative on Methods, Measurement, and Pain Assessment in Clinical Trials (IMMPACT). EMR refers
#' to the electronic medical record in the University of Pittsburgh's Patient Outcomes Repository for Treatment registry (PORT).
#'
#'
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0254862}
"pain"
