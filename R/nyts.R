#' Data from the 2021 National Youth Tobacco Survey
#'
#' Variables relating to demographic information, frequency of tobacco (e-cigs,
#' cigarettes, and cigars) use, and methods of obtaining said tobacco as
#' reported by students on the 2021 NYTS.
#'
#' @format A data frame with 20,413 rows and 35 variables:
#' \describe{
#'   \item{location}{Survey Setting: Answer to the question "Where are you
#'   currently taking the survey?"}
#'   \item{age}{Age: Answer to QN1: "How old are you?"}
#'   \item{sex}{Sex: Answer to QN2: "What is your sex?"}
#'   \item{grade}{Grade: Answer to QN3: "What grade are you in?"}
#'   \item{race_and_ethnicity}{Race and Ethnicity: Equal to "Hispanic" if any
#'   of QN4B ("Are you Hispanic, Latino, Latina, or of Spanish origin?"
#'   (Yes, Mexican, Mexican American, Chicano, or Chicana)), QN4C ("Are you
#'   Hispanic, Latino, Latina, or of Spanish origin?" (Yes, Puerto Rican)), QN4D
#'   ("Are you Hispanic, Latino, Latina, or of Spanish origin?" (Yes, Cuban)),
#'   or QN4E ("Are you Hispanic, Latino, Latina, or of Spanish origin?" (Yes,
#'   Another Hispanic, Latino, Latina, or Spanish origin)) are selected.
#'   Otherwise, equal to "non-Hispanic Black" if QN5C ("What race or races do
#'   you consider yourself to be?" (Black or African American)) is selected,
#'   equal to "non-Hispanic White" if QN5E ("What race or races do you consider
#'   yourself to be?" (White)) is selected, and equal to "non-Hispanic other
#'   race" if QN5A ("What race or races do you consider yourself to be?"
#'   (American Indian or Alaska Native)), QN5B ("What race or races do you
#'   consider yourself to be?" (Asian)), or QN5D ("What race or races do you
#'   consider yourself to be?" (Native Hawaiian or Other Pacific Islander)) is
#'   selected.}
#'   \item{otherlang}{Speaks Language other than English at Home: Answer to
#'   QN154: "Do you speak a language other than English at home?"}
#'   \item{grades_in_past_year}{Grades in the Past Year: Answer to QN165:
#'   "During the past 12 months, how would you describe your grades in school?"}
#'   \item{LGBT}{LGBT Status: Equal to "Yes" if respondent answered QN155
#'   ("Which of the following best describes you") with "Gay or Lesbian" or
#'   "Bisexual" or if respondent answered QN156 ("Some people describe themselves
#'   as transgender when their sex at birth does not match the way they think or
#'   feel about their gender. Are you transgender?") with "Yes, I am
#'   transgender". Equal to "Not Sure" if respondent answered QN155 with "Not
#'   Sure" or answered QN156 with "I am not sure if I am transgender". Equal to
#'   "No" if respondent answered QN155 with "Heterosexual (straight)" and
#'   answered QN156 with "No, I am not transgender".}
#'   \item{psych_distress}{Psychological Distress: As defined in the online
#'   supplement for the linked paper: "Psychological distress was assessed with
#'   the Patient Health Questionnaire for Depression and Anxiety (PHQ-4), a
#'   composite scale made up of four questions: “During the past two weeks, how
#'   often have you been bothered by any of the following problems?”: QN157A:
#'   Little interest or pleasure in doing things; QN157B: Feeling down,
#'   depressed, or hopeless; QN157C: Feeling nervous, anxious, or on edge;
#'   QN157D: Not being able or stop or control worrying. Response options were
#'   provided with a numeric value of 0 for “not at all,” 1 for “several days,”
#'   2 for “more than half of the days,” and 3 for “nearly every day”. Responses
#'    were summed (range: 0 – 12) and categorized as none (0–2), mild (3–5),
#'    moderate (6–8) and severe (9–12)."}
#'   \item{family_affluence}{Family Affluence: As defined in the online
#'   supplement for the linked paper: "Family affluence was assessed with the
#'   Family Affluence Scale (FAS), a composite scale made up of four questions.
#'   Numeric values were assigned to each response and summed across responses:
#'   QN161: “Does your family own a vehicle (such as a car, van, or truck)?
#'   (No=0; Yes, one=1; Yes, two or more=2); QN162: “Do you have your own
#'   bedroom?” (No=0; Yes=1); QN163: “How many computers (including laptops and
#'   tablets, not including game consoles and smartphones) does your family
#'   own?” (None=0; One=1; Two=2; More than two=3); and QN164: “During the past
#'   12 months, how many times did you travel on vacation with your family?
#'   (Not at all=0; Once=1; Twice=2; More than twice=3). Summed responses
#'   (range: 0–9) were categorized into low (0–5), medium (6–7), and high
#'   (8–9)."}
#'   \item{num_e_cigs}{Days of E-cig Use in the Past 30 days: Answer to QN9:
#'   "During the past 30 days, on how many days did you use e-cigarettes?".
#'   Equal to 0 if respondent answered QN6 ("Have you ever used an e-cigarette,
#'   even once or twice") with "No"}
#'   \item{num_cigarettes}{Days of Cigarette Use in the Past 30 days: Answer to
#'   QN38: "During the past 30 days, on how many days did you smoke
#'   cigarettes?". Equal to 0 if respondent answered QN35 ("Have you ever smoked
#'   a cigarette, even one or two puffs") with "No"}
#'   \item{num_cigars}{Days of Cigar Use in the Past 30 days: Answer to QN53:
#'   "During the past 30 days, on how many days did you smoke cigars,
#'   cigarillos, or little cigars?". Equal to 0 if respondent answered QN51
#'   ("Have you ever smoked a cigar, cigarillo, or little cigar, even one or
#'   two puffs?") with "No"}
#'   \item{perceived_cigarette_use}{Perceived Percentage of Students in
#'   Respondent's Grade who Smoke Cigarettes: Answer to QN125: "Out of every
#'   10 students in your grade at school, how many do you think smoke
#'   cigarettes?" divided by 10}
#'   \item{perceived_e_cig_use}{Perceived Percentage of Students in Respondent's
#'   Grade who Use e-cigarettes: Answer to QN126: "Out of every 10 students in
#'   your grade at school, how many do you think use e-cigarettes?" divided
#'   by 10}
#'   \item{bought_myself}{"I bought them myself during the past 30 days": Equal
#'   to 1 if respondent selected any of QN20AA, QN20BA, QN20CA (During the past
#'   30 days, how did you get your _____? (I bought them myself) for each
#'   tobacco product). Equal to 0 if days used in the past 30 days is equal to 0
#'    for all three tobacco products.}
#'   \item{had_someone_else_buy}{"I had someone else buy them for me during the
#'   past 30 days": Equal to 1 if respondent selected any of QN20AB, QN20BB,
#'   QN20CB (During the past 30 days, how did you get your _____? (I had someone
#'   else buy them for me) for each tobacco product). Equal to 0 if days used in
#'   the past 30 days is equal to 0 for all three tobacco products.}
#'   \item{asked_someone_to_give_me_some}{"I asked someone to give me some
#'   during the past 30 days": Equal to 1 if respondent selected any of QN20AC,
#'   QN20BC, QN20CC (During the past 30 days, how did you get your _____?
#'   (I asked someone to give me some) for each tobacco product). Equal to 0 if
#'   days used in the past 30 days is equal to 0 for all three tobacco
#'   products.}
#'   \item{someone_offered}{"Someone offered them to me during the past 30
#'   days": Equal to 1 if respondent selected any of QN20AD, QN20BD, QN20CD
#'   (During the past 30 days, how did you get your _____? (Someone offered them
#'   to me) for each tobacco product). Equal to 0 if days used in the past 30
#'   days is equal to 0 for all three tobacco products.}
#'   \item{got_from_a_friend}{"I got them from a friend during the past 30
#'   days": Equal to 1 if respondent selected any of QN20AE, QN20BE, QN20CE
#'   (During the past 30 days, how did you get your _____?
#'   (I got them from a friend) for each tobacco product). Equal to 0 if days
#'   used in the past 30 days is equal to 0 for all three tobacco products.}
#'   \item{got_from_a_family_member}{"I got them from a family member during the
#'   past 30 days": Equal to 1 if respondent selected any of QN20AF, QN20BF,
#'   QN20CF (During the past 30 days,
#'   how did you get your _____? (I got them from a family member) for each
#'   tobacco product). Equal to 0 if days used in the past 30 days is equal to
#'   0 for all three tobacco products.}
#'   \item{took_them}{"I took them from a store or another person during the
#'   past 30 days": Equal to 1 if respondent selected any of QN20AG, QN20BG,
#'   QN20CG (During the past 30 days, how did you get your _____? (I took them
#'   from a store or another person) for each tobacco product). Equal to 0 if
#'   days used in the past 30 days is equal to 0 for all three tobacco
#'   products.}
#'   \item{some_other_way}{"I got them in some other way during the past 30
#'   days": Equal to 1 if respondent selected any of QN20AH, QN20BH, QN20CH
#'   (During the past 30 days, how did you get your _____? (I got them in some
#'   other way) for each tobacco product). Equal to 0 if days used in the past
#'   30 days is equal to 0 for all three tobacco products.}
#'   \item{did_not_buy}{"I didn't buy tobacco products during the past 30 days":
#'   Equal to 1 if respondent selected all of QN21AA, QN21BA, QN21CA ("During
#'   the past 30 days,
#'   where did you buy your ____? (I did not buy ____ during the past 30 days)"
#'   for each tobacco product) or equal to 1 if days used in the past 30 days is
#'    equal to 0 for all three tobacco products.}
#'   \item{bought_from_someone}{"I bought them from another person (a friend,
#'   family member, or someone else) during the past 30 days": Equal to 1 if
#'   respondent selected any of QN21AB, QN21BB, QN21CB
#'   ("During the past 30 days, where did you buy your ____? (I bought them from
#'   another person (a friend, family member, or someone else))" for each
#'   tobacco product). Equal to 0 if days used in the past 30 days is equal to 0
#'   for all three tobacco products.}
#'   \item{bought_from_gas_station}{"I bought them from a gas station or
#'   convenience store during the past 30 days": Equal to 1 if respondent
#'   selected any of QN21AC, QN21BC, QN21CC ("During the past 30 days, where did
#'   you buy your ____? (A gas station or convenience store)" for each tobacco
#'   product). Equal to 0 if days used in the past 30 days is equal to 0 for all
#'   three tobacco products.}
#'   \item{bought_from_grocery_store}{"I bought them from a grocery store during
#'   the past 30 days": Equal to 1 if respondent selected any of QN21AD, QN21BD,
#'   QN21CD ("During the past 30 days, where did you buy your ____? (A grocery
#'   store)" for each tobacco product). Equal to 0 if days used in the past 30
#'   days is equal to 0 for all three tobacco products.}
#'   \item{bought_from_drugstore}{"I bought them from a drugstore during the
#'   past 30 days": Equal to 1 if respondent selected any of QN21AE, QN21BE,
#'   QN21CE ("During the past 30 days, where did you buy your ____? (A
#'   drugstore)" for each tobacco product). Equal to 0 if days used in the past
#'   30 days is equal to 0 for all three tobacco products.}
#'   \item{bought_from_mall}{"I bought them from a mall or shopping center
#'   kiosk/stand during the past 30 days": Equal to 1 if respondent selected
#'   any of QN21AF, QN21BF, QN21CF ("During the past 30 days, where did you buy
#'   your ____? (A mall or shopping center kiosk/stand)" for each tobacco
#'   product). Equal to 0 if days used in the past 30 days is equal to 0 for all
#'   three tobacco products.}
#'   \item{bought_from_vending_machine}{"I bought them from a vending machine
#'   during the past 30 days": Equal to 1 if respondent selected any of QN21AG,
#'   QN21BG, QN21CG ("During the past 30 days, where did you buy your ____?
#'   (A vending machine)" for each tobacco product. Equal to 0 if days used in
#'   the past 30 days is equal to 0 for all three tobacco products.}
#'   \item{bought_from_internet}{"I bought them on the Internet (such as a
#'   product website or store website like eBay or Facebook Marketplace) during
#'   the past 30 days": Equal to 1 if respondent selected any of
#'   QN21AH, QN21BH, QN21CH ("During the past 30 days, where did you buy your
#'   ____? (On the Internet (such as a product website or store website like
#'   eBay or Facebook Marketplace))" for each tobacco product).
#'   Equal to 0 if days used in the past 30 days is equal to 0 for all three
#'   tobacco products.}
#'   \item{bought_through_mail}{"I bought them through the mail during the past
#'   30 days": Equal to 1 if respondent selected any of QN21AI, QN21BI, QN21CI
#'   ("During the past 30 days, where did you buy your ____?
#'   (through the mail)" for each tobacco product). Equal to 0 if days used in
#'   the past 30 days is equal to 0 for all three tobacco products.}
#'   \item{bought_through_delivery}{"I bought them through a delivery service
#'   (such as DoorDash or Postmates) during the past 30 days": Equal to 1 if
#'   respondent selected any of QN21AJ, QN21BJ, QN21CJ
#'   ("During the past 30 days, where did you buy your ____? (through a delivery
#'    service (such as DoorDash or Postmates))" for each tobacco product). Equal
#'    to 0 if days used in the past 30 days is equal to 0 for all three tobacco
#'    products.}
#'   \item{bought_from_smoke_shop}{"I bought them from a vape shop or tobacco
#'   shop during the past 30 days": Equal to 1 if respondent selected any of
#'   QN21AK, QN21BK, QN21CK ("During the past 30 days, where did you buy your
#'   ____? (a vape shop or tobacco shop)" for each tobacco product). Equal to 0
#'   if days used in the past 30 days is equal to 0 for all three tobacco
#'   products.}
#'   \item{bought_elsewhere}{"I bought them from some other place not listed
#'   here during the past 30 days": Equal to 1 if respondent selected any of
#'   QN21AL, QN21BL, QN21CL ("During the past 30 days, where did you buy your
#'   ____? (some other place not listed here)" for each tobacco product). Equal
#'   to 0 if days used in the past 30 days is equal to 0 for all three tobacco
#'   products.}
#' }
#'
#'
#' @source Data was downloaded from the CDC's website at the following link:
#'
#' \url{https://www.cdc.gov/tobacco/about-data/surveys/national-youth-tobacco-survey.html}.
#'
#' Variables were selected and defined in a similar manner to those in
#'
#' Park-Lee, E., Gentzke, A. S., Ren, C., Cooper, M., Sawdey, M. D., Hu, S. S.,
#' & Cullen, K. A. (2023). Impact of Survey Setting on Current Tobacco Product
#' Use: National Youth Tobacco Survey, 2021. Journal of Adolescent Health,
#' 72(3), 365-374.
#'
#' \url{https://pubmed.ncbi.nlm.nih.gov/36470692/}
"nyts"
