library(tidyverse)
library(readxl)

##### Pain Data #####

#downloaded from https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0254862#sec029 (S1 Dataset)
pain <- read_excel("journal.pone.0254862.s005.sheet1.xlsx")
names(pain)[2:75] <- paste("X", names(pain)[2:75], sep = "")
names(pain)[90:163] <- paste("X", gsub("\\s*\\([^\\)]+\\)", "", names(pain)[90:163]), ".follow_up.", sep = "")
names(pain)[c(165:173, 175)] <- paste(gsub("\\s*\\([^\\)]+\\)", "", names(pain)[c(165:173, 175)]), ".follow_up.", sep = "")
names(pain)[182] <- "RECODE.of.FULLBODY_CLUSTER..FULLBODY_CLUSTER."
names(pain)[88] <- "PAIN_INTENSITY_AVERAGE.follow_up"
pain <- pain %>% select(-c(IMPRESSION_PAINCENTERIMPACT,
                           IMPRESSION_TREATMENTIMPACT,
                           X101.follow_up.:X238.follow_up.,
                           race_cat,
                           PDtotal,
                           RECODE.of.FULLBODY_CLUSTER..FULLBODY_CLUSTER.,
                           PAIN_CHANGE_30percent,
                           PHYSFUNC_CHANGE_prepost,
                           PHYSFUNC_CHANGERESP_3pts,
                           IOC_RESP_5,
                           RESP_HIGH,
                           lnBODYREGIONSUM,
                           lnBODYREGIONSUMfollowup,
                           PROMIS_PHYSICAL_FUNCTION.follow_up.:IMPRESSION_PAINCENTERIMPACT.follow_up.,
                           BODYREGIONSUM.follow_up.,
                           BODYREGIONSUM,
                           PAIN_CHANGE_prepost,
                           PAIN_CHANGE_fraction))

usethis::use_data(pain, overwrite = TRUE)
