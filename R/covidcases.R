#' US Covid Data from the Covid-19 Data Hub
#'
#' Daily confirmed Covid cases and deaths at the state and city level in 2020,
#' downloaded from the COVID19 R package.
#'
#' @format A data frame with 477,799 rows and 5 variables. Data and variable
#' descriptions were downloaded from the "S1 Dataset".
#' \describe{
#'   \item{date}{Date in YYYY-MM-DD format}
#'   \item{state}{State (administrative_area_level_2 from Covid-19 Data Hub)}
#'   \item{county}{County (administrative_area_level_3 from Covid-19 Data Hub)}
#'   \item{daily_deaths}{Daily Covid-19 Deaths calculated from the Covid-19
#'   Data Hub's cumulative counts of confirmed deaths.
#'   Again, note that "some of these values are negative due to decreasing
#'   cumulative counts in the original data provider".}
#'   \item{daily_cases}{Daily Covid-19 Cases calculated from the Covid-19 Data
#'   Hub's cumulative counts of confirmed cases.
#'   Note that, according to the Data Hub, "some of these values are negative
#'   due to decreasing cumulative counts in the original
#'   data provider".}
#' }
#'
#'
#' @source \url{https://cran.r-project.org/web/packages/COVID19/index.html}
"covidcases"
