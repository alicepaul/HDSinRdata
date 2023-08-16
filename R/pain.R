#' Data from Alter et al. (2021)'s Study on Patient-Reported Pain
#'
#' Information from patient-reported pain assessments using the Collaborative
#' Health Outcomes Information Registry (CHOIR) at baseline and at a 3-month
#' follow-up.
#'
#' @format A data frame with 21,659 rows and 92 variables. Data and variable
#' descriptions were downloaded from the "S1 Dataset".
#' \describe{
#'   \item{PATIENT_NUM}{Deidentified study identification number}
#'   \item{X101}{Body Region Selected = 1; not selected = 0}
#'   \item{X102}{Body Region Selected = 1; not selected = 0}
#'   \item{X103}{Body Region Selected = 1; not selected = 0}
#'   \item{X104}{Body Region Selected = 1; not selected = 0}
#'   \item{X105}{Body Region Selected = 1; not selected = 0}
#'   \item{X106}{Body Region Selected = 1; not selected = 0}
#'   \item{X107}{Body Region Selected = 1; not selected = 0}
#'   \item{X108}{Body Region Selected = 1; not selected = 0}
#'   \item{X109}{Body Region Selected = 1; not selected = 0}
#'   \item{X110}{Body Region Selected = 1; not selected = 0}
#'   \item{X111}{Body Region Selected = 1; not selected = 0}
#'   \item{X112}{Body Region Selected = 1; not selected = 0}
#'   \item{X113}{Body Region Selected = 1; not selected = 0}
#'   \item{X114}{Body Region Selected = 1; not selected = 0}
#'   \item{X115}{Body Region Selected = 1; not selected = 0}
#'   \item{X116}{Body Region Selected = 1; not selected = 0}
#'   \item{X117}{Body Region Selected = 1; not selected = 0}
#'   \item{X118}{Body Region Selected = 1; not selected = 0}
#'   \item{X119}{Body Region Selected = 1; not selected = 0}
#'   \item{X120}{Body Region Selected = 1; not selected = 0}
#'   \item{X121}{Body Region Selected = 1; not selected = 0}
#'   \item{X122}{Body Region Selected = 1; not selected = 0}
#'   \item{X123}{Body Region Selected = 1; not selected = 0}
#'   \item{X124}{Body Region Selected = 1; not selected = 0}
#'   \item{X125}{Body Region Selected = 1; not selected = 0}
#'   \item{X126}{Body Region Selected = 1; not selected = 0}
#'   \item{X127}{Body Region Selected = 1; not selected = 0}
#'   \item{X128}{Body Region Selected = 1; not selected = 0}
#'   \item{X129}{Body Region Selected = 1; not selected = 0}
#'   \item{X130}{Body Region Selected = 1; not selected = 0}
#'   \item{X131}{Body Region Selected = 1; not selected = 0}
#'   \item{X132}{Body Region Selected = 1; not selected = 0}
#'   \item{X133}{Body Region Selected = 1; not selected = 0}
#'   \item{X134}{Body Region Selected = 1; not selected = 0}
#'   \item{X135}{Body Region Selected = 1; not selected = 0}
#'   \item{X136}{Body Region Selected = 1; not selected = 0}
#'   \item{X201}{Body Region Selected = 1; not selected = 0}
#'   \item{X202}{Body Region Selected = 1; not selected = 0}
#'   \item{X203}{Body Region Selected = 1; not selected = 0}
#'   \item{X204}{Body Region Selected = 1; not selected = 0}
#'   \item{X205}{Body Region Selected = 1; not selected = 0}
#'   \item{X206}{Body Region Selected = 1; not selected = 0}
#'   \item{X207}{Body Region Selected = 1; not selected = 0}
#'   \item{X208}{Body Region Selected = 1; not selected = 0}
#'   \item{X209}{Body Region Selected = 1; not selected = 0}
#'   \item{X210}{Body Region Selected = 1; not selected = 0}
#'   \item{X211}{Body Region Selected = 1; not selected = 0}
#'   \item{X212}{Body Region Selected = 1; not selected = 0}
#'   \item{X213}{Body Region Selected = 1; not selected = 0}
#'   \item{X214}{Body Region Selected = 1; not selected = 0}
#'   \item{X215}{Body Region Selected = 1; not selected = 0}
#'   \item{X216}{Body Region Selected = 1; not selected = 0}
#'   \item{X217}{Body Region Selected = 1; not selected = 0}
#'   \item{X218}{Body Region Selected = 1; not selected = 0}
#'   \item{X219}{Body Region Selected = 1; not selected = 0}
#'   \item{X220}{Body Region Selected = 1; not selected = 0}
#'   \item{X221}{Body Region Selected = 1; not selected = 0}
#'   \item{X222}{Body Region Selected = 1; not selected = 0}
#'   \item{X223}{Body Region Selected = 1; not selected = 0}
#'   \item{X224}{Body Region Selected = 1; not selected = 0}
#'   \item{X225}{Body Region Selected = 1; not selected = 0}
#'   \item{X226}{Body Region Selected = 1; not selected = 0}
#'   \item{X227}{Body Region Selected = 1; not selected = 0}
#'   \item{X228}{Body Region Selected = 1; not selected = 0}
#'   \item{X229}{Body Region Selected = 1; not selected = 0}
#'   \item{X230}{Body Region Selected = 1; not selected = 0}
#'   \item{X231}{Body Region Selected = 1; not selected = 0}
#'   \item{X232}{Body Region Selected = 1; not selected = 0}
#'   \item{X233}{Body Region Selected = 1; not selected = 0}
#'   \item{X234}{Body Region Selected = 1; not selected = 0}
#'   \item{X235}{Body Region Selected = 1; not selected = 0}
#'   \item{X236}{Body Region Selected = 1; not selected = 0}
#'   \item{X237}{Body Region Selected = 1; not selected = 0}
#'   \item{X238}{Body Region Selected = 1; not selected = 0}
#'   \item{PAIN_INTENSITY_AVERAGE}{Pain intensity NRS (0-10)}
#'   \item{PROMIS_PHYSICAL_FUNCTION}{PROMIS physical function T-score,
#'   range 0-100}
#'   \item{PROMIS_PAIN_BEHAVIOR}{PROMIS pain behavior T-score, range 0-100}
#'   \item{PROMIS_DEPRESSION}{PROMIS depression T-score, range 0-100}
#'   \item{PROMIS_ANXIETY}{PROMIS anxiety T-score, range 0-100}
#'   \item{PROMIS_SLEEP_DISTURB_V1_0}{PROMIS sleep disturbance T-score,
#'   range 0-100}
#'   \item{PROMIS_PAIN_INTERFERENCE}{PROMIS pain interference, range 0-100}
#'   \item{GH_MENTAL_SCORE}{PROMIS global mental health, range 0-100}
#'   \item{GH_PHYSICAL_SCORE}{PROMIS global physical health, range 0-100}
#'   \item{AGE_AT_CONTACT}{Age at baseline assessment extracted from EMR}
#'   \item{BMI}{Body Mass Index at baseline extracted from EMR}
#'   \item{CCI_TOTAL_SCORE}{Charlson Comorbidity Index extracted from EMR}
#'   \item{PAIN_INTENSITY_AVERAGE.FOLLOW_UP}{Pain intensity NRS at follow up
#'   (range 0 - 10)}
#'   \item{PAT_SEX}{Patient reported gender, "male" or "female", derived
#'   from EMR}
#'   \item{PAT_RACE}{Patient reported race, 17 categories, EMR derived}
#'   \item{CCI_BIN}{Binary Charlson Comorbidity Index: "No comorbidity"
#'   CCI score = 0; "Any comorbidity" CCI score > 0}
#'   \item{MEDICAID_BIN}{Medicaid payor: "yes" or "no"}
#' }
#'
#'
#' Here is a key for the coded body pain regions
#' (S2 Fig from the linked paper):
#'
#' \if{html}{\figure{bodypainmap.png}{options: width = "35\%"}}
#' \if{latex}{\figure{bodypainmap.png}{options: width = 7 cm}}
#'
#' Note that, as described in the paper, PROMIS is short for Patient-Reported
#' Outcomes Measurement Information System: the source of the validated
#' instruments for pain assessment used in the adaptive computerized test given
#' to patients in accordance with the Initiative on Methods, Measurement, and
#' Pain Assessment in Clinical Trials (IMMPACT). EMR refers to the electronic
#' medical record in the University of Pittsburgh's Patient Outcomes Repository
#' for Treatment registry (PORT).
#'
#' @source Alter, B. J., Anderson, N. P., Gillman, A. G., Yin, Q., Jeong, J. H.,
#'  & Wasan, A. D. (2021). Hierarchical clustering by patient-reported pain
#'  distribution alone identifies distinct chronic pain subgroups differing by
#'  pain intensity, quality, and clinical outcomes. PloS one, 16(8), e0254862.
#'
#' \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0254862}
"pain"
