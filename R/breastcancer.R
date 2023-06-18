#' Data from the Original Wisconsin Diagnostic Breast Cancer Database
#'
#' Contains 32 features of cell nuclei present in digitized images of fine needle aspirates of 212 malignant and 357 benign breast masses.
#'
#' @format A data frame with 569 rows and 32 variables. The first two variables are id and diagnosis, and then the mean,
#' standard error, and "worst" or largest (mean of the three largest values) for each of ten features are reported as follows:
#' \describe{
#'   \item{id}{ID number}
#'   \item{diagnosis}{Diagnosis (M = malignant, B = benign)}
#'   \item{radius}{Mean of distances from center to points on the perimeter}
#'   \item{texture}{Standard deviation of gray-scale values}
#'   \item{perimeter}{Perimeter}
#'   \item{area}{Area}
#'   \item{smoothness}{Local variation in radius lengths}
#'   \item{compactness}{Perimeter^2 / area - 1.0}
#'   \item{concavity}{Severity of concave portions of the contour}
#'   \item{concave points}{Number of concave portions of the contour}
#'   \item{symmetry}{Symmetry}
#'   \item{fractal dimension}{"Coastline approximation" - 1}
#' }
#'
#' All feature values are recoded with four significant digits.
#'
#' @source \url{https://archive.ics.uci.edu/dataset/15/breast+cancer+wisconsin+original}
"breastcancer"