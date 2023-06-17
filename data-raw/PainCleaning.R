library(readxl)

##### Pain Data #####

#downloaded from https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0254862#sec029 (S3 Dataset)
pain <- read.csv("journal.pone.0254862.s007.csv")


usethis::use_data(pain, overwrite = TRUE)
