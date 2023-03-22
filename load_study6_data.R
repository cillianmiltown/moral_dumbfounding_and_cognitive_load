rm(list = ls())
library(citr)
#install.packages("sjstats")
library(plyr)
library(foreign)
library(car)
library(desnum)
library(ggplot2)
library(extrafont)
#devtools::install_github("crsh/papaja")
library(papaja)
#library("dplyr")
library("afex")
library("tibble")
library(scales)
#install.packages("metap")
# install.packages("mutoss")
# install.packages('BiocManager')
# BiocManager::install()
# BiocManager::install('multtest')
library(metap)
library(pwr)
library(lsr)
#install.packages("sjstats")
library(sjstats)
library(DescTools)
#inatall.packages("ggstatsplot")
#library(ggstatsplot)
library(VGAM)
library(nnet)
library(mlogit)
library(reshape2)
#install.packages("powerMediation")
library("powerMediation")
library(tidyverse)



#### load data set Study 6 ####
source("~/Dropbox/College/research/Research_general/cog_load/moral_dumbfounding_and_cognitive_load/read_and_sort_raw_data_US.R")
source("~/Dropbox/College/research/Research_general/cog_load/moral_dumbfounding_and_cognitive_load/read_and_sort_raw_data_UK.R")

# source("C:/Users/cillian.mchugh/Dropbox/College/research/Research_general/cog_load/moral_dumbfounding_and_cognitive_load/read_and_sort_raw_data_US.R")
# source("C:/Users/cillian.mchugh/Dropbox/College/research/Research_general/cog_load/moral_dumbfounding_and_cognitive_load/read_and_sort_raw_data_UK.R")

# read the data file

df_six_US <- read_csv("../data/study6/sample_data.csv")
df_six_US$country <- rep("US",length(df_six_US$gender))

df_six_UK <- read_csv("../data/study6/sample_data_UK.csv")
df_six_UK$gender_other <- rep("NA",length(df_six_UK$gender))
df_six_UK$country <- rep("UK",length(df_six_UK$gender))

df_six <- rbind.data.frame(df_six_US,df_six_UK)


# check variable names
variable.names(df_six)

#View(df)

table(df_six$scenario,df_six$condition)


x <- df_six

x <-
  x %>%
  mutate(
    # practice trial number
    cog_practice1 =
      dplyr::recode(cog_practice1
                    ,"null" = 0
                    , "1" = 1
      ),
    cog_practice2 =
      dplyr::recode(cog_practice2
                    ,"null" = 0
                    , "1" = 2
      ),
    cog_practice3 =
      dplyr::recode(cog_practice3
                    ,"null" = 0
                    , "1" = 3
      ),
    cog_practice_trial_number = 
      cog_practice1+cog_practice2+cog_practice3
    ,
    # initial judgment trial number   
    InJu1_trial1 =
      dplyr::recode(InJu1_trial1
                    ,"null" = 0
                    , "1" = 1
      ),
    InJu1_trial2 =
      dplyr::recode(InJu1_trial2
                    ,"null" = 0
                    , "1" = 2
      ),
    InJu1_trial3 =
      dplyr::recode(InJu1_trial3
                    ,"null" = 0
                    , "1" = 3
      ),
    InJu1_trial_number = 
      InJu1_trial1+InJu1_trial2+InJu1_trial3
    ,
    # critical slide trial number   
    CS_trial1 =
      dplyr::recode(CS_trial1
                    ,"null" = 0
                    , "1" = 1
      ),
    CS_trial2 =
      dplyr::recode(CS_trial2
                    ,"null" = 0
                    , "1" = 2
      ),
    CS_trial3 =
      dplyr::recode(CS_trial3
                    ,"null" = 0
                    , "1" = 3
      ),
    CS_trial_number = 
      CS_trial1+CS_trial2+CS_trial3
    
    ,
    # revised judgment trial number   
    InJu2_trial1 =
      dplyr::recode(InJu2_trial1
                    ,"null" = 0
                    , "1" = 1
      ),
    InJu2_trial2 =
      dplyr::recode(InJu2_trial2
                    ,"null" = 0
                    , "1" = 2
      ),
    InJu2_trial3 =
      dplyr::recode(InJu2_trial3
                    ,"null" = 0
                    , "1" = 3
      ),
    InJu2_trial_number = 
      InJu2_trial1+InJu2_trial2+InJu2_trial3
  )

x <- x[which(grepl("5ea6083f726e4c000ab3daa4", x$PROLIFIC_PID)==FALSE),]


x$Ju1_bin <- car::recode(x$InJu1,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
x$Ju2_bin <- car::recode(x$InJu2,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")

x$InCS <- dplyr::recode(x$CS
                        , "0" = "There is nothing wrong."
                        , "1" = "It's wrong but I can't think of a reason."
                        , "2" = "It's wrong and I can provide a valid reason.")



create_changed_variables <- function(y){
  
  df3 <- x
  df3$j1 <- as.vector(car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
  df3$j2 <- as.vector(car::recode(df3$sw1, "'0'='wrong';'1'='not wrong'"))
  df3$j3 <- as.vector(car::recode(df3$sw2, "'0'='wrong';'1'='not wrong'"))
  df3$j4 <- as.vector(car::recode(df3$sw3, "'0'='wrong';'1'='not wrong'"))
  df3$j5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="not wrong", "It's wrong but I can't think of a reason."="wrong","It's wrong and I can provide a valid reason."="wrong")))
  #df3$j5 <- as.vector(car::recode(df3$cs_temp, "'FALSE'='wrong';'TRUE'='not wrong'"))
  df3$j6 <- as.vector(car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
  
  df3$ch1 <- df3$j1!=df3$j2
  df3$ch2 <- df3$j2!=df3$j3
  df3$ch3 <- df3$j3!=df3$j4
  df3$ch4 <- df3$j4!=df3$j5
  df3$ch5 <- df3$j5!=df3$j6
  
  df3$Rch1 <- df3$rsn1!=df3$rsn2
  df3$Rch2 <- df3$rsn2!=df3$rsn3
  
  df3$Rs_changed <- (df3$Rch1+df3$Rch2)!=FALSE
  df3$Rs_changed_tot <- df3$Rch1+df3$Rch2
  
  df3$changed <- (df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5)!=FALSE
  df3$changed_tot <- df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5
  
  df3$rs1 <- as.vector(rep("unstated", length=(length(df3$gender))))
  df3$rs2 <- as.vector(car::recode(df3$rsn1,"'0'='reason';'1'='no reason'"))
  df3$rs3 <- as.vector(car::recode(df3$rsn2,"'0'='reason';'1'='no reason'"))
  df3$rs4 <- as.vector(car::recode(df3$rsn3,"'0'='reason';'1'='no reason'"))
  df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
  df3$rs6 <- as.vector(rep("unstated", length=length(df3$gender)))
  
  
  df3$rs1_bin <- as.vector(car::recode(df3$rsn1,"'0'='reason';'1'='no reason'"))
  df3$rs2_bin <- as.vector(car::recode(df3$rsn2,"'0'='reason';'1'='no reason'"))
  df3$rs3_bin <- as.vector(car::recode(df3$rsn3,"'0'='reason';'1'='no reason'"))
  
  df3$reason_always <- df3$rs1_bin=="reason"&df3$rs2_bin=="reason"&df3$rs3_bin=="reason"
  
  df3
}

x <- create_changed_variables(x)


x$InJu1 <- as.numeric(x$InJu1)
x$InJu2 <- as.numeric(x$InJu2)

study_6 <- x
study6 <- x




save(study_6, study6, file = "loaded_data/six.RData")
write.csv(study_6, "csv_files/study_6.csv", row.names = FALSE)
write.csv(study6, "csv_files/study6.csv", row.names = FALSE)



rm(list = ls())
