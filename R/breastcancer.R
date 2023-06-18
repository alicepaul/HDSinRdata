#' Data from the Original Wisconsin Diagnostic Breast Cancer Database
#'
#' Contains 32 features of cell nuclei present in digitized images of fine needle aspirates of 212 malignant and 357 benign breast masses.
#'
#' @format A data frame with 569 rows and 32 variables. The first two variables are id and diagnosis, and then the mean,
#' standard error, and "worst" or largest (mean of the three largest values) for each of ten features are reported as follows:
#' \describe{
#'   \item{id}{dbl ID number}
#'   \item{diagnosis}{dbl Diagnosis (M = malignant, B = benign)}
#'   \item{radius}{dbl mean of distances from center to points on the perimeter}
#'   \item{texture}{dbl standard deviation of gray-scale values}
#'   \item{perimeter}{dbl perimeter}
#'   \item{area}{dbl area}
#'   \item{smoothness}{dbl local variation in radius lengths}
#'   \item{compactness}{dbl perimeter^2 / area - 1.0}
#'   \item{concavity}{dbl severity of concave portions of the contour}
#'   \item{concave points}{dbl number of concave portions of the contour}
#'   \item{symmetry}{dbl symmetry}
#'   \item{fractal dimension}{dbl "coastline approximation" - 1}
#' }
#' All feature values are recoded with four significant digits.
#'
#' @source \url{https://archive.ics.uci.edu/dataset/15/breast+cancer+wisconsin+original}
"breastcancer"
