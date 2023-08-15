#' Data from the Original Wisconsin Diagnostic Breast Cancer Database
#'
#' 32 features of cell nuclei present in digitized images of fine
#' needle aspirates of 212 malignant and 357 benign breast masses.
#'
#' @format A data frame with 569 rows and 32 variables. The first two variables
#' are id and diagnosis, and then the mean, standard error, and "worst" or
#' largest (mean of the three largest values) for each of ten features are
#' reported as follows:
#' \describe{
#'   \item{id}{ID number}
#'   \item{diagnosis}{Diagnosis (M = malignant, B = benign)}
#'   \item{radius_mean}{Mean of mean distances from center to points on
#'   the perimeter}
#'   \item{texture_mean}{Mean of standard deviation of gray-scale values}
#'   \item{perimeter_mean}{Mean of perimeter}
#'   \item{area_mean}{Mean of area}
#'   \item{smoothness_mean}{Mean of local variation in radius lengths}
#'   \item{compactness_mean}{Mean of perimeter^2 / area - 1.0}
#'   \item{concavity_mean}{Mean of severity of concave portions of the contour}
#'   \item{concave_points_mean}{Mean of number of concave portions of the
#'   contour}
#'   \item{symmetry_mean}{Mean of symmetry}
#'   \item{fractal_dimension_mean}{Mean of "coastline approximation" - 1}
#'   \item{radius_se}{Standard error of mean distances from center to points
#'   on the perimeter}
#'   \item{texture_se}{Standard error of standard deviation of gray-scale
#'   values}
#'   \item{perimeter_se}{Standard error of perimeter}
#'   \item{area_se}{Standard error of area}
#'   \item{smoothness_se}{Standard error of local variation in radius lengths}
#'   \item{compactness_se}{Standard error of perimeter^2 / area - 1.0}
#'   \item{concavity_se}{Standard error of severity of concave portions of
#'   the contour}
#'   \item{concave_points_se}{Standard error of number of concave portions of
#'   the contour}
#'   \item{symmetry_se}{Standard error of symmetry}
#'   \item{fractal_dimension_se}{Standard error of "coastline approximation"
#'   - 1}
#'   \item{radius_worst}{"Worst" or largest (mean of the three largest values)
#'   of mean distances from center to points on the perimeter}
#'   \item{texture_worst}{"Worst" or largest (mean of the three largest values)
#'   of standard deviation of gray-scale values}
#'   \item{perimeter_worst}{"Worst" or largest (mean of the three largest
#'   values) of perimeter}
#'   \item{area_worst}{"Worst" or largest (mean of the three largest values)
#'   of area}
#'   \item{smoothness_worst}{"Worst" or largest (mean of the three largest
#'   values) of local variation in radius lengths}
#'   \item{compactness_worst}{"Worst" or largest (mean of the three largest
#'   values) of perimeter^2 / area - 1.0}
#'   \item{concavity_worst}{"Worst" or largest (mean of the three largest
#'   values) of severity of concave portions of the contour}
#'   \item{concave_points_worst}{"Worst" or largest (mean of the three largest
#'   values) of number of concave portions of the contour}
#'   \item{symmetry_worst}{"Worst" or largest (mean of the three largest
#'   values) of symmetry}
#'   \item{fractal_dimension_worst}{"Worst" or largest (mean of the three
#'   largest values) of "coastline approximation" - 1}
#' }
#'
#' All feature values are recoded with four significant digits.
#'
#' @source Wolberg,William. (1992). Breast Cancer Wisconsin (Original).
#' UCI Machine Learning Repository. https://doi.org/10.24432/C5HP4Z.
#'
#' Obtained from the UC Irvine Machine Learning Repository:
#' \url{https://archive.ics.uci.edu/dataset/15/breast+cancer+wisconsin+original}
"breastcancer"
