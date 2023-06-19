#' US Covid Data from the Covid-19 Data Hub
#'
#' Daily confirmed Covid-19 cases and deaths at the state and city level in 2020.
#'
#' @format A data frame with 21,659 rows and 93 variables. Data and variable descriptions were downloaded from the "S1 Dataset".
#' \describe{
#'   \item{date}{Date in YEAR-MM-DD format}
#'   \item{state}{State (administrative_area_level_2 on the Covid-19 Data Hub)}
#'   \item{city}{City (administrative_area_level_3 on the Covid-19 Data Hub)}
#'   \item{daily_cases}{Daily Covid-19 Cases calculated from the Covid-19 Data Hub's cumulative counts of confirmed cases.
#'   Note that, according to the Data Hub, "some of these values are negative due to decreasing cumulative counts in the original
#'   data provider".}
#'   \item{daily_deaths}{Daily Covid-19 Deaths calculated from the Covid-19 Data Hub's cumulative counts of confirmed deaths.
#'   Again, note that "some of these values are negative due to decreasing cumulative counts in the original
#'   data provider".}
#' }
#'
#'
#' @source \url{https://covid19datahub.io/articles/data.html}
"covidcases"
