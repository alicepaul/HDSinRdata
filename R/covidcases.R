#' US Covid Data from the Covid-19 Data Hub
#'
#' Weekly confirmed Covid-19 cases and deaths at the state and city level in
#' 2020, downloaded from the COVID19 R package.
#'
#' @format A data frame with 69,530 rows and 5 variables.
#' \describe{
#'   \item{state}{State (administrative_area_level_2 from Covid-19 Data Hub)}
#'   \item{county}{County (administrative_area_level_3 from Covid-19 Data Hub)}
#'   \item{week}{Week of 2020}
#'   \item{weekly_cases}{Weekly Covid-19 cases calculated from the Covid-19 Data
#'   Hub's cumulative counts of confirmed cases.
#'   Note that, according to the Data Hub, "some of these values are
#'   negative due to decreasing cumulative counts in the original
#'   data provider".}
#'   \item{weekly_deaths}{Weekly Covid-19 deaths calculated from the Covid-19
#'   Data Hub's cumulative counts of confirmed deaths.
#'   Again, note that "some of these values are negative due to decreasing
#'   cumulative counts in the original data provider".}
#' }
#'
#' @source Guidotti, E., Ardia, D., (2020), "COVID-19 Data Hub",
#' Journal of Open Source Software 5(51):2376, doi:10.21105/joss.02376"
#'
#' \url{https://CRAN.R-project.org/package=COVID19}
#'
#'
#' \url{https://covid19datahub.io/index.html}
"covidcases"
