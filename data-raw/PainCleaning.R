library(readxl)

##### Pain Data #####

#downloaded from https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0254862#sec029 (S3 Dataset)
pain <- read.csv("journal.pone.0254862.s007.csv")
pain <- pain %>% select(-c(IMPRESSION_PAINCENTERIMPACT,
                           IMPRESSION_TREATMENTIMPACT,
                           X101.follow_up.:X238.follow_up.,
                           race_cat, PDtotal,
                           RECODE.of.FULLBODY_CLUSTER..FULLBODY_CLUSTER.,
                           PAIN_CHANGE_30percent,
                           PHYSFUNC_CHANGE_prepost,
                           PHYSFUNC_CHANGERESP_3pts,
                           IOC_RESP_5,
                           RESP_HIGH,
                           lnBODYREGIONSUM,
                           lnBODYREGIONSUMfollowup,
                           PROMIS_PHYSICAL_FUNCTION.follow_up.:IMPRESSION_PAINCENTERIMPACT.follow.up.,
                           BODYREGIONSUM.followup.,
                           PAIN_CHANGE_prepost,
                           PAIN_CHANGE_fraction))
usethis::use_data(pain, overwrite = TRUE)
