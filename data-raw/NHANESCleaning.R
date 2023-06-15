library(nhanesA)
library(tidyverse)


##### NHANES Data #####

# Lead info
lead_1999 <- nhanes("LAB06")
lead_1999$YEAR <- 1999
lead_2001 <- nhanes("L06_B")
lead_2001$YEAR <- 2001
lead_2003 <- nhanes("L06BMT_C")
lead_2003$YEAR <- 2003
lead_2005 <- nhanes("PbCd_D")
lead_2005$YEAR <- 2005
lead_2007 <- nhanes("PbCd_E")
lead_2007$YEAR <- 2007
lead_2009 <- nhanes("PbCd_F")
lead_2009$YEAR <- 2009
lead_2011 <- nhanes("PbCd_G")
lead_2011$YEAR <- 2011
lead_2013 <- nhanes("PbCd_H")
lead_2013$YEAR <- 2013
lead_2015 <- nhanes("PbCd_I")
lead_2015$YEAR <- 2015
lead_2017 <- nhanes("PbCd_J")
lead_2017$YEAR <- 2017

# Blood pressure info
bpx_1999 <- nhanes("BPX")
bpx_1999$YEAR <- 1999
bpx_2001 <- nhanes("BPX_B")
bpx_2001$YEAR <- 2001
bpx_2003 <- nhanes("BPX_C")
bpx_2003$YEAR <- 2003
bpx_2005 <- nhanes("BPX_D")
bpx_2005$YEAR <- 2005
bpx_2007 <- nhanes("BPX_E")
bpx_2007$YEAR <- 2007
bpx_2009 <- nhanes("BPX_F")
bpx_2009$YEAR <- 2009
bpx_2011 <- nhanes("BPX_G")
bpx_2011$YEAR <- 2011
bpx_2013 <- nhanes("BPX_H")
bpx_2013$YEAR <- 2013
bpx_2015 <- nhanes("BPX_I")
bpx_2015$YEAR <- 2015
bpx_2017 <- nhanes("BPX_J")
bpx_2017$YEAR <- 2017

# Age, sex, race, income, edu
demo_1999 <- nhanes("DEMO")
demo_1999$YEAR <- 1999
demo_2001 <- nhanes("DEMO_B")
demo_2001$YEAR <- 2001
demo_2003 <- nhanes("DEMO_C")
demo_2003$YEAR <- 2003
demo_2005 <- nhanes("DEMO_D")
demo_2005$YEAR <- 2005
demo_2007 <- nhanes("DEMO_E")
demo_2007$YEAR <- 2007
demo_2009 <- nhanes("DEMO_F")
demo_2009$YEAR <- 2009
demo_2011 <- nhanes("DEMO_G")
demo_2011$YEAR <- 2011
demo_2013 <- nhanes("DEMO_H")
demo_2013$YEAR <- 2013
demo_2015 <- nhanes("DEMO_I")
demo_2015$YEAR <- 2015
demo_2017 <- nhanes("DEMO_J")
demo_2017$YEAR <- 2017

# Alcohol information
alq_1999 <- nhanes("ALQ")
alq_1999$YEAR <- 1999
alq_2001 <- nhanes("ALQ_B")
alq_2001$YEAR <- 2001
alq_2003 <- nhanes("ALQ_C")
alq_2003$YEAR <- 2003
alq_2005 <- nhanes("ALQ_D")
alq_2005$YEAR <- 2005
alq_2007 <- nhanes("ALQ_E")
alq_2007$YEAR <- 2007
alq_2009 <- nhanes("ALQ_F")
alq_2009$YEAR <- 2009
alq_2011 <- nhanes("ALQ_G")
alq_2011$YEAR <- 2011
alq_2013 <- nhanes("ALQ_H")
alq_2013$YEAR <- 2013
alq_2015 <- nhanes("ALQ_I")
alq_2015$YEAR <- 2015
alq_2017 <- nhanes("ALQ_J")
alq_2017$YEAR <- 2017

# BMI info
bmx_1999 <- nhanes("BMX")
bmx_1999$YEAR <- 1999
bmx_2001 <- nhanes("BMX_B")
bmx_2001$YEAR <- 2001
bmx_2003 <- nhanes("BMX_C")
bmx_2003$YEAR <- 2003
bmx_2005 <- nhanes("BMX_D")
bmx_2005$YEAR <- 2005
bmx_2007 <- nhanes("BMX_E")
bmx_2007$YEAR <- 2007
bmx_2009 <- nhanes("BMX_F")
bmx_2009$YEAR <- 2009
bmx_2011 <- nhanes("BMX_G")
bmx_2011$YEAR <- 2011
bmx_2013 <- nhanes("BMX_H")
bmx_2013$YEAR <- 2013
bmx_2015 <- nhanes("BMX_I")
bmx_2015$YEAR <- 2015
bmx_2017 <- nhanes("BMX_J")
bmx_2017$YEAR <- 2017

# Smoking info
smq_1999 <- nhanes("SMQ")
smq_1999$YEAR <- 1999
smq_2001 <- nhanes("SMQ_B")
smq_2001$YEAR <- 2001
smq_2003 <- nhanes("SMQ_C")
smq_2003$YEAR <- 2003
smq_2005 <- nhanes("SMQ_D")
smq_2005$YEAR <- 2005
smq_2007 <- nhanes("SMQ_E")
smq_2007$YEAR <- 2007
smq_2009 <- nhanes("SMQ_F")
smq_2009$YEAR <- 2009
smq_2011 <- nhanes("SMQ_G")
smq_2011$YEAR <- 2011
smq_2013 <- nhanes("SMQ_H")
smq_2013$YEAR <- 2013
smq_2015 <- nhanes("SMQ_I")
smq_2015$YEAR <- 2015
smq_2017 <- nhanes("SMQ_J")
smq_2017$YEAR <- 2017

# Hypertension
bpq_1999 <- nhanes("BPQ")
bpq_1999$YEAR <- 1999
bpq_2001 <- nhanes("BPQ_B")
bpq_2001$YEAR <- 2001
bpq_2003 <- nhanes("BPQ_C")
bpq_2003$YEAR <- 2003
bpq_2005 <- nhanes("BPQ_D")
bpq_2005$YEAR <- 2005
bpq_2007 <- nhanes("BPQ_E")
bpq_2007$YEAR <- 2007
bpq_2009 <- nhanes("BPQ_F")
bpq_2009$YEAR <- 2009
bpq_2011 <- nhanes("BPQ_G")
bpq_2011$YEAR <- 2011
bpq_2013 <- nhanes("BPQ_H")
bpq_2013$YEAR <- 2013
bpq_2015 <- nhanes("BPQ_I")
bpq_2015$YEAR <- 2015
bpq_2017 <- nhanes("BPQ_J")
bpq_2017$YEAR <- 2017

# Combine them
df_1999 <- lead_1999 %>%
  full_join(bpx_1999, by = "SEQN") %>%
  full_join(demo_1999, by = "SEQN") %>%
  full_join(alq_1999, by = "SEQN") %>%
  full_join(bmx_1999, by = "SEQN") %>%
  full_join(smq_1999, by = "SEQN") %>%
  full_join(bpq_1999, by = "SEQN")
df_2001 <- lead_2001 %>%
  full_join(bpx_2001, by = "SEQN") %>%
  full_join(demo_2001, by = "SEQN") %>%
  full_join(alq_2001, by = "SEQN") %>%
  full_join(bmx_2001, by = "SEQN") %>%
  full_join(smq_2001, by = "SEQN") %>%
  full_join(bpq_2001, by = "SEQN")
df_2003 <- lead_2003 %>%
  full_join(bpx_2003, by = "SEQN") %>%
  full_join(demo_2003, by = "SEQN") %>%
  full_join(alq_2003, by = "SEQN") %>%
  full_join(bmx_2003, by = "SEQN") %>%
  full_join(smq_2003, by = "SEQN") %>%
  full_join(bpq_2003, by = "SEQN")
df_2005 <- lead_2005 %>%
  full_join(bpx_2005, by = "SEQN") %>%
  full_join(demo_2005, by = "SEQN") %>%
  full_join(alq_2005, by = "SEQN") %>%
  full_join(bmx_2005, by = "SEQN") %>%
  full_join(smq_2005, by = "SEQN") %>%
  full_join(bpq_2005, by = "SEQN")
df_2007 <- lead_2007 %>%
  full_join(bpx_2007, by = "SEQN") %>%
  full_join(demo_2007, by = "SEQN") %>%
  full_join(alq_2007, by = "SEQN") %>%
  full_join(bmx_2007, by = "SEQN") %>%
  full_join(smq_2007, by = "SEQN") %>%
  full_join(bpq_2007, by = "SEQN")
df_2009 <- lead_2009 %>%
  full_join(bpx_2009, by = "SEQN") %>%
  full_join(demo_2009, by = "SEQN") %>%
  full_join(alq_2009, by = "SEQN") %>%
  full_join(bmx_2009, by = "SEQN") %>%
  full_join(smq_2009, by = "SEQN") %>%
  full_join(bpq_2009, by = "SEQN")
df_2011 <- lead_2011 %>%
  full_join(bpx_2011, by = "SEQN") %>%
  full_join(demo_2011, by = "SEQN") %>%
  full_join(alq_2011, by = "SEQN") %>%
  full_join(bmx_2011, by = "SEQN") %>%
  full_join(smq_2011, by = "SEQN") %>%
  full_join(bpq_2011, by = "SEQN")
df_2013 <- lead_2013 %>%
  full_join(bpx_2013, by = "SEQN") %>%
  full_join(demo_2013, by = "SEQN") %>%
  full_join(alq_2013, by = "SEQN") %>%
  full_join(bmx_2013, by = "SEQN") %>%
  full_join(smq_2013, by = "SEQN") %>%
  full_join(bpq_2013, by = "SEQN")
df_2015 <- lead_2015 %>%
  full_join(bpx_2015, by = "SEQN") %>%
  full_join(demo_2015, by = "SEQN") %>%
  full_join(alq_2015, by = "SEQN") %>%
  full_join(bmx_2015, by = "SEQN") %>%
  full_join(smq_2015, by = "SEQN") %>%
  full_join(bpq_2015, by = "SEQN")
df_2017 <- lead_2017 %>%
  full_join(bpx_2017, by = "SEQN") %>%
  full_join(demo_2017, by = "SEQN") %>%
  full_join(alq_2017, by = "SEQN") %>%
  full_join(bmx_2017, by = "SEQN") %>%
  full_join(smq_2017, by = "SEQN") %>%
  full_join(bpq_2017, by = "SEQN")
final_df <- df_1999 %>%
  full_join(df_2001) %>%
  full_join(df_2003) %>%
  full_join(df_2005) %>%
  full_join(df_2007) %>%
  full_join(df_2009) %>%
  full_join(df_2011) %>%
  full_join(df_2013) %>%
  full_join(df_2015) %>%
  full_join(df_2017)

# filter out unnecessary rows
final_df <- final_df %>%
  select(c("SEQN","LBXBPB", "BPXDI1", "BPXDI2", "BPXDI3", "BPXDI4", "BPXSY1", "BPXSY2", "BPXSY3", "BPXSY4",
           "RIDAGEYR", "RIAGENDR", "RIDRETH1", "DMDEDUC2", "INDFMPIR", "INDFMIN2", "INDHHIN2",
           "ALQ101", "ALQ110", "ALQ120Q", "ALQ120U", "ALQ121", "ALQ130", "ALQ141Q", "ALQ141U", "ALQ151", "ALQ160", "BMXBMI",
           "SMAQUEX2", "SMQ020", "SMQ040", "SMQ050Q", "BPQ020", "BPQ040A", "BPQ050A", "YEAR"))

# filter out rows with no values
final_df <- final_df %>%
  filter(!is.na(LBXBPB)) %>%
  filter(!is.na(BPXDI1) | !is.na(BPXDI2) | !is.na(BPXDI3) | !is.na(BPXDI4)) %>%
  filter(!is.na(DMDEDUC2)) %>%
  filter(!is.na(INDFMPIR)) %>%
  filter(!is.na(BMXBMI)) %>%
  filter(!is.na(ALQ120Q) | !is.na(ALQ121)) %>%
  filter(!is.na(SMQ040) | !is.na(SMQ020)) %>%
  filter(!is.na(BPQ020) | !is.na(BPQ040A)) %>%
  filter(!is.na(RIAGENDR)) %>%
  filter(!is.na(RIDAGEYR)) %>%
  filter(!is.na(RIDRETH1))
final_df <- subset(final_df, RIDAGEYR >= 20)
NHANESsample <- final_df

#save
usethis::use_data(NHANESsample, overwrite = TRUE)
