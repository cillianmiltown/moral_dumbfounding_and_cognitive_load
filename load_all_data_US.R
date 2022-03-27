#rm(list = ls())
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



#### load data set Study 1 ####

# prep_data_college <- function(a,b){
#   df1 <- a
#   df2 <- b
#   
#   to_num <- function(x){
#     levels(x) <- c(1:7)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   
#   to_num_NFC <- function(x){
#     levels(x) <- c(1:9)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   NFC_rev <- function(x){
#     
#     b <- car::recode(x, "1=9;2=8;3=7;4=6;5=5;6=4;7=3;8=2;9=1")
#     
#     b <- suppressWarnings(as.numeric(b))
#   }
#   
#   NFC_fun <- function(x){
#     
#     df3 <- x
#     
#     names(df3)[names(df3)=="MLQ1"] <- "NFC1"
#     names(df3)[names(df3)=="MLQ2"] <- "NFC2"
#     names(df3)[names(df3)=="MLQ3"] <- "NFC3"
#     names(df3)[names(df3)=="MLQ4"] <- "NFC4"
#     names(df3)[names(df3)=="MLQ5"] <- "NFC5"
#     names(df3)[names(df3)=="MLQ6"] <- "NFC6"
#     names(df3)[names(df3)=="MLQ7"] <- "NFC7"
#     names(df3)[names(df3)=="MLQ8"] <- "NFC8"
#     names(df3)[names(df3)=="MLQ9"] <- "NFC9"
#     names(df3)[names(df3)=="MLQ19"] <- "NFC10"
#     names(df3)[names(df3)=="v_167"] <- "NFC11"
#     names(df3)[names(df3)=="v_168"] <- "NFC12"
#     names(df3)[names(df3)=="v_169"] <- "NFC13"
#     names(df3)[names(df3)=="v_170"] <- "NFC14"
#     names(df3)[names(df3)=="v_171"] <- "NFC15"
#     names(df3)[names(df3)=="v_172"] <- "NFC16"
#     names(df3)[names(df3)=="v_173"] <- "NFC17"
#     names(df3)[names(df3)=="v_174"] <- "NFC18"
#     
#     
#     df3$NFC1 <- suppressWarnings(as.numeric(df3$NFC1))
#     df3$NFC2 <- suppressWarnings(as.numeric(df3$NFC2))
#     df3$NFC3 <- suppressWarnings(as.numeric(df3$NFC3))
#     df3$NFC4 <- suppressWarnings(as.numeric(df3$NFC4))
#     df3$NFC5 <- suppressWarnings(as.numeric(df3$NFC5))
#     df3$NFC6 <- suppressWarnings(as.numeric(df3$NFC6))
#     df3$NFC7 <- suppressWarnings(as.numeric(df3$NFC7))
#     df3$NFC8 <- suppressWarnings(as.numeric(df3$NFC8))
#     df3$NFC9 <- suppressWarnings(as.numeric(df3$NFC9))
#     df3$NFC10 <- suppressWarnings(as.numeric(df3$NFC10))
#     df3$NFC11 <- suppressWarnings(as.numeric(df3$NFC11))
#     df3$NFC12 <- suppressWarnings(as.numeric(df3$NFC12))
#     df3$NFC13 <- suppressWarnings(as.numeric(df3$NFC13))
#     df3$NFC14 <- suppressWarnings(as.numeric(df3$NFC14))
#     df3$NFC15 <- suppressWarnings(as.numeric(df3$NFC15))
#     df3$NFC16 <- suppressWarnings(as.numeric(df3$NFC16))
#     df3$NFC17 <- suppressWarnings(as.numeric(df3$NFC17))
#     df3$NFC18 <- suppressWarnings(as.numeric(df3$NFC18))
#     
#     
#     
#     #3,4,5,7,8,9,12,16,17
#     #as.numeric(df3$NFC3)
#     #df3[48:65]
#     #cbind(df3$NFC3,df3$NFC3R)
#     
#     df3$NFC3R <- NFC_rev(df3$NFC3)
#     df3$NFC4R <- NFC_rev(df3$NFC4)
#     df3$NFC5R <- NFC_rev(df3$NFC5)
#     df3$NFC7R <- NFC_rev(df3$NFC7)
#     df3$NFC8R <- NFC_rev(df3$NFC8)
#     df3$NFC9R <- NFC_rev(df3$NFC9)
#     df3$NFC12R <- NFC_rev(df3$NFC12)
#     df3$NFC16R <- NFC_rev(df3$NFC16)
#     df3$NFC17R <- NFC_rev(df3$NFC17)
#     
#     
#     df3$NFC_tot <- df3$NFC1+
#       df3$NFC2+
#       df3$NFC3R+
#       df3$NFC4R+
#       df3$NFC5R+
#       df3$NFC6+
#       df3$NFC7R+
#       df3$NFC8R+
#       df3$NFC9R+
#       df3$NFC10+
#       df3$NFC11+
#       df3$NFC12R+
#       df3$NFC13+
#       df3$NFC14+
#       df3$NFC15+
#       df3$NFC16R+
#       df3$NFC17R+
#       df3$NFC18
#     
#     df3$NFC <- (df3$NFC_tot)/18
#     df3$NFC_tot
#     df3$NFC <- df3$NFC-5
#     
#     df3
#   }
#   
#   #create variable identifying condition
#   df1$condition <- rep(1, length(df1$gender))
#   df2$condition <- rep(2, length(df2$gender))
#   
#   #create variable labelling participants
#   participant <- c(1:(length(df1$gender)+length(df2$gender)))
#   
#   #merge the data frames
#   df3 <- cbind(participant,rbind.data.frame(df1[1:85],df2[1:85]), rbind(df1[136],df2[132]))
#   
#   df3$condition <- car::recode(df3$condition, "1='cog_load';2='control'")
#   
#   df3$InJu1 <- to_num(df3$InJu1)
#   df3$InJu2 <- to_num(df3$InJu2)
#   df3$InCf1 <- to_num(df3$InCf1)
#   df3$InCf2 <- to_num(df3$InCf2)
#   
#   df3$Ju1_bin <- car::recode(df3$InJu1,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$Ju2_bin <- car::recode(df3$InJu2,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$condition
#   
#   df3$wrong1 <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3$wrong2<- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3 <- NFC_fun(df3)
#   
#   df3$pot_hrm <- to_num(df3$pot_hrm)
#   df3$pot_hrm_bin <- car::recode(df3$pot_hrm,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$all_harm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")
#   df3$all_harm <- car::recode(df3$all_harm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$all_harm_norm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")&(df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$all_harm_norm <- car::recode(df3$all_harm_norm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$nrm_all <- (df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$nrm_all <- car::recode(df3$nrm_all, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   
#   df3$Roz_fully_C <- (df3$normQ== 'Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise.' & df3$Hrm_oth=="Yes, I am able to believe this"& df3$Hrm_rel=="Yes, I am able to believe this")
#   df3$Roz_fully_C <- car::recode(df3$Roz_fully_C, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$cog_M_ch_bin <- to_num(df3$cogMch)
#   df3$cog_M_ch_bin <- car::recode(df3$cog_M_ch_bin,"NA='missing';1='difficult';2='difficult';3='difficult';4='neutral';5='easy';6='easy';7='easy'")
#   
#   df3$cog_Rb <- as.vector(df3$cogR)
#   df3$cog_right_logic <- df3$cog_Rb=="9P8R2L7D                                                                                                                                                                                                                                                      "
#   df3$cog_right_logic
#   df3$cog_right <- car::recode(df3$cog_right_logic, "TRUE='right';FALSE='wrong';NA='missing'")
#   cog_fun <- function(x){
#     a <- strsplit(as.character(as.vector(df3$cogR)), "")[[x]]
#     sum(c('9','P','p','8','R','r','2','L','l','7','D','d') %in% a)
#   }
#   
#   
#   df3$cog_number_right <- suppressWarnings(as.numeric(lapply((1:length(df3$gender)),cog_fun)))
#   
#   #df3$cs_temp <- df3$InCS==df3$InCS[level=1]
#   
#   df3$j1 <- as.vector(car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   df3$j2 <- as.vector(car::recode(df3$InSWr1, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j3 <- as.vector(car::recode(df3$InSWr2, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j4 <- as.vector(car::recode(df3$InSWr3, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="not wrong", "It's wrong but I can't think of a reason."="wrong","It's wrong and I can provide a valid reason."="wrong")))
#   #df3$j5 <- as.vector(car::recode(df3$cs_temp, "'FALSE'='wrong';'TRUE'='not wrong'"))
#   df3$j6 <- as.vector(car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   
#   df3$ch1 <- df3$j1!=df3$j2
#   df3$ch2 <- df3$j2!=df3$j3
#   df3$ch3 <- df3$j3!=df3$j4
#   df3$ch4 <- df3$j4!=df3$j5
#   df3$ch5 <- df3$j5!=df3$j6
#   
#   df3$Rch1 <- df3$InAR1!=df3$InAR2
#   df3$Rch2 <- df3$InAR2!=df3$InAR3
#   
#   df3$Rs_changed <- (df3$Rch1+df3$Rch2)!=FALSE
#   df3$Rs_changed_tot <- df3$Rch1+df3$Rch2
#   
#   df3$changed <- (df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5)!=FALSE
#   df3$changed_tot <- df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5
#   
#   df3$rs1 <- as.vector(rep("unstated", length=length(df3$gender)))
#   df3$rs2 <- as.vector(car::recode(df3$InAR1,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs3 <- as.vector(car::recode(df3$InAR2,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs4 <- as.vector(car::recode(df3$InAR3,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
#   df3$rs6 <- as.vector(rep("unstated", length=length(df3$gender)))
#   
#   
#   df3$rs1_bin <- as.vector(car::recode(df3$InAR1,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs2_bin <- as.vector(car::recode(df3$InAR2,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs3_bin <- as.vector(car::recode(df3$InAR3,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   
#   df3$reason_always <- df3$rs1_bin=="reason"&df3$rs2_bin=="reason"&df3$rs3_bin=="reason"
#   
#   
#   df3$Dumb_response <- revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$critical_slide_wrong=="changed"),]$Dumb_response <- 
#     revalue(
#       df3$Dumb_response[
#         which(df3$critical_slide_wrong=="changed")],
#       c("It's wrong and I can provide a valid reason."="unsupported declarations"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(Dumb_response = ifelse(is.na(Dumb_response),0,Dumb_response))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$Dumb_response)
#   df3$Dumb_response <- car::recode(df3$Dumb_response, "'0'='unsupported declaration';'2'='admission';'1'='nothing wrong';'3'='reasons'")
#   
#   df3$Dumb_response
#   
#   
#   df3$right_change <- df3$InCS# revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$Ju1_bin=="right"),]$right_change <- revalue(df3[which(df3$Ju1_bin=="right")]$right_change, c("There is nothing wrong."="right initially"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(right_change = ifelse(is.na(right_change),0,right_change))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$right_change)
#   df3$right_change <- car::recode(df3$right_change, "'0'='right initially';'2'='dumbfounded';'1'='nothing wrong';'3'='reasons'")
#   
#   
#   
#   
#   df3$wrong1b <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong1b
#   df3$wrong1b <- droplevels(as.factor(df3$wrong1b))
#   df3$wrong1b
#   
#   
#   df3$wrong2b <- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong2b
#   df3$wrong2b <- droplevels(as.factor(df3$wrong2b))
#   df3$wrong2b
#   
#   
#   df3
#   
# }
# 
# #setwd("college_sample")
# df1a <- suppressWarnings(read.spss('../data/college_sample/Cog_load_1.sav', to.data.frame = TRUE))
# df2a <- suppressWarnings(read.spss('../data/college_sample/Cog_load_control_1.sav', to.data.frame = TRUE))
# #setwd("..")
# college <- prep_data_college(df1a,df2a)
# study_1 <- college
# rm(df1a,df2a,prep_data_college)
# df3 <- college
# 
# df <- cbind.data.frame(df3$InCS,df3$NFC)
# colnames(df) <- c("InCS","NFC")
# # write.foreign(as.data.frame(df), "cog1.txt", "cog1.sps", package="SPSS")
# 
# 
# df4 <- df3[which(df3$condition=="cog_load"),]
# df5 <- df3[which(df3$condition=="control"),]
# 
# #### load data set Study 2 ####
# 
# prep_data1 <- function(a,b){
#   
#   df1 <- a
#   df2 <- b
#   
#   to_num <- function(x){
#     levels(x) <- c(1:7)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   
#   to_num_NFC <- function(x){
#     levels(x) <- c(1:9)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   NFC_rev <- function(x){
#     
#     b <- car::recode(x, "1=9;2=8;3=7;4=6;5=5;6=4;7=3;8=2;9=1")
#     
#     b <- suppressWarnings(as.numeric(b))
#   }
#   
#   NFC_fun <- function(x){
#     
#     df3 <- x
#     
#     names(df3)[names(df3)=="MLQ1"] <- "NFC1"
#     names(df3)[names(df3)=="MLQ2"] <- "NFC2"
#     names(df3)[names(df3)=="MLQ3"] <- "NFC3"
#     names(df3)[names(df3)=="MLQ4"] <- "NFC4"
#     names(df3)[names(df3)=="MLQ5"] <- "NFC5"
#     names(df3)[names(df3)=="MLQ6"] <- "NFC6"
#     names(df3)[names(df3)=="MLQ7"] <- "NFC7"
#     names(df3)[names(df3)=="MLQ8"] <- "NFC8"
#     names(df3)[names(df3)=="MLQ9"] <- "NFC9"
#     names(df3)[names(df3)=="MLQ19"] <- "NFC10"
#     names(df3)[names(df3)=="v_167"] <- "NFC11"
#     names(df3)[names(df3)=="v_168"] <- "NFC12"
#     names(df3)[names(df3)=="v_169"] <- "NFC13"
#     names(df3)[names(df3)=="v_170"] <- "NFC14"
#     names(df3)[names(df3)=="v_171"] <- "NFC15"
#     names(df3)[names(df3)=="v_172"] <- "NFC16"
#     names(df3)[names(df3)=="v_173"] <- "NFC17"
#     names(df3)[names(df3)=="v_174"] <- "NFC18"
#     
#     
#     df3$NFC1 <- suppressWarnings(as.numeric(df3$NFC1))
#     df3$NFC2 <- suppressWarnings(as.numeric(df3$NFC2))
#     df3$NFC3 <- suppressWarnings(as.numeric(df3$NFC3))
#     df3$NFC4 <- suppressWarnings(as.numeric(df3$NFC4))
#     df3$NFC5 <- suppressWarnings(as.numeric(df3$NFC5))
#     df3$NFC6 <- suppressWarnings(as.numeric(df3$NFC6))
#     df3$NFC7 <- suppressWarnings(as.numeric(df3$NFC7))
#     df3$NFC8 <- suppressWarnings(as.numeric(df3$NFC8))
#     df3$NFC9 <- suppressWarnings(as.numeric(df3$NFC9))
#     df3$NFC10 <- suppressWarnings(as.numeric(df3$NFC10))
#     df3$NFC11 <- suppressWarnings(as.numeric(df3$NFC11))
#     df3$NFC12 <- suppressWarnings(as.numeric(df3$NFC12))
#     df3$NFC13 <- suppressWarnings(as.numeric(df3$NFC13))
#     df3$NFC14 <- suppressWarnings(as.numeric(df3$NFC14))
#     df3$NFC15 <- suppressWarnings(as.numeric(df3$NFC15))
#     df3$NFC16 <- suppressWarnings(as.numeric(df3$NFC16))
#     df3$NFC17 <- suppressWarnings(as.numeric(df3$NFC17))
#     df3$NFC18 <- suppressWarnings(as.numeric(df3$NFC18))
#     
#     
#     
#     #3,4,5,7,8,9,12,16,17
#     #as.numeric(df3$NFC3)
#     #df3[48:65]
#     #cbind(df3$NFC3,df3$NFC3R)
#     
#     df3$NFC3R <- NFC_rev(df3$NFC3)
#     df3$NFC4R <- NFC_rev(df3$NFC4)
#     df3$NFC5R <- NFC_rev(df3$NFC5)
#     df3$NFC7R <- NFC_rev(df3$NFC7)
#     df3$NFC8R <- NFC_rev(df3$NFC8)
#     df3$NFC9R <- NFC_rev(df3$NFC9)
#     df3$NFC12R <- NFC_rev(df3$NFC12)
#     df3$NFC16R <- NFC_rev(df3$NFC16)
#     df3$NFC17R <- NFC_rev(df3$NFC17)
#     
#     
#     df3$NFC_tot <- df3$NFC1+
#       df3$NFC2+
#       df3$NFC3R+
#       df3$NFC4R+
#       df3$NFC5R+
#       df3$NFC6+
#       df3$NFC7R+
#       df3$NFC8R+
#       df3$NFC9R+
#       df3$NFC10+
#       df3$NFC11+
#       df3$NFC12R+
#       df3$NFC13+
#       df3$NFC14+
#       df3$NFC15+
#       df3$NFC16R+
#       df3$NFC17R+
#       df3$NFC18
#     
#     df3$NFC <- (df3$NFC_tot)/18
#     df3$NFC_tot
#     df3$NFC <- df3$NFC-5
#     
#     df3
#   }
#   
#   # remove columns with different names
#   
#   df1 <- df1[1:112]
#   df2 <- df2[1:112]
#   
#   #create variable identifying condition
#   df1$condition <- rep(1, length(df1$gender))
#   df2$condition <- rep(2, length(df2$gender))
#   
#   # cog load manipulation for experimental group
#   df1$cog_load_test <-
#     df1$v_193=="not quoted"&df1$v_194=="quoted"&df1$v_203=="quoted"&
#     df1$v_195=="not quoted"&df1$v_196=="not quoted"&df1$v_204=="not quoted"&
#     df1$v_197=="quoted"&df1$v_198=="quoted"&df1$v_205=="not quoted"
#   
#   df1$cog_load_CS <-
#     df1$v_215=="quoted"&df1$v_216=="quoted"&df1$v_217=="not quoted"&
#     df1$v_218=="not quoted"&df1$v_219=="not quoted"&df1$v_220=="quoted"&
#     df1$v_221=="quoted"&df1$v_222=="not quoted"&df1$v_223=="not quoted"
#   
#   df1$cog_load_CS_num <- 
#     c(df1$v_215=="quoted")+c(df1$v_216=="quoted")+c(df1$v_217=="not quoted")+
#     c(df1$v_218=="not quoted")+c(df1$v_219=="not quoted")+c(df1$v_220=="quoted")+
#     c(df1$v_221=="quoted")+c(df1$v_222=="not quoted")+c(df1$v_223=="not quoted")
#   
#   
#   # cog load manipulation for the control group
#   df2$cog_load_test <-
#     df2$v_193=="not quoted"&df2$v_194=="quoted"&df2$v_203=="quoted"&
#     df2$v_195=="not quoted"&df2$v_196=="not quoted"&df2$v_204=="not quoted"&
#     df2$v_197=="quoted"&df2$v_198=="quoted"&df2$v_205=="not quoted"
#   
#   df2$cog_load_CS <-
#     df2$v_215=="not quoted"&df2$v_216=="not quoted"&df2$v_217=="not quoted"&
#     df2$v_218=="quoted"&df2$v_219=="quoted"&df2$v_220=="quoted"&
#     df2$v_221=="not quoted"&df2$v_222=="not quoted"&df2$v_223=="not quoted"
#   
#   df2$cog_load_CS_num <-
#     c(df2$v_215=="not quoted")+c(df2$v_216=="not quoted")+c(df2$v_217=="not quoted")+
#     c(df2$v_218=="quoted")+c(df2$v_219=="quoted")+c(df2$v_220=="quoted")+
#     c(df2$v_221=="not quoted")+c(df2$v_222=="not quoted")+c(df2$v_223=="not quoted")
#   
#   
#   #create variable labelling participants
#   participant <- c(1:c(length(df1$gender)+length(df2$gender)))
#   
#   #merge the data frames
#   df3 <- cbind(participant,rbind.data.frame(df1[1:116],df2[1:116]))
#   
#   df3$condition <- car::recode(df3$condition, "1='cog_load';2='control'")
#   
#   #df3$cogload_num <- df3$cog_load_CS+df3$cog_load_inju+df3$cog_load_Rs+df3$cog_load_reju
#   
#   df3$InJu1 <- to_num(df3$InJu1)
#   df3$InJu2 <- to_num(df3$InJu2)
#   df3$InCf1 <- to_num(df3$InCf1)
#   df3$InCf2 <- to_num(df3$InCf2)
#   df3$InRsn2 <- to_num(df3$InRsn2)
#   
#   df3$Ju1_bin <- car::recode(df3$InJu1,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$Ju2_bin <- car::recode(df3$InJu2,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$condition
#   
#   df3$wrong1 <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3$wrong2<- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3 <- NFC_fun(df3)
#   
#   names(df3)[names(df3) == 'v_164'] <- 'pot_hrm'
#   names(df3)[names(df3) == 'v_165'] <- 'box'
#   names(df3)[names(df3) == 'v_166'] <- 'rugb'
#   #names(df3)[names(df3) == 'v_181'] <- 'cogMch'
#   
#   
#   df3$pot_hrm <- to_num(df3$pot_hrm)
#   df3$pot_hrm_bin <- car::recode(df3$pot_hrm,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$all_harm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")
#   df3$all_harm <- car::recode(df3$all_harm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$all_harm_norm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")&(df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$all_harm_norm <- car::recode(df3$all_harm_norm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$nrm_all <- (df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$nrm_all <- car::recode(df3$nrm_all, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   
#   df3$Roz_fully_C <- (df3$normQ== 'Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise.' & df3$Hrm_oth=="Yes, I am able to believe this"& df3$Hrm_rel=="Yes, I am able to believe this")
#   df3$Roz_fully_C <- car::recode(df3$Roz_fully_C, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   #df3$cog_M_ch_bin <- to_num(df3$cogMch)
#   #df3$cog_M_ch_bin <- car::recode(df3$cog_M_ch_bin,"NA='missing';1='difficult';2='difficult';3='difficult';4='neutral';5='easy';6='easy';7='easy'")
#   #
#   # df3$cog_Rb <- as.vector(df3$cogR)
#   # df3$cog_right_logic <- df3$cog_Rb=="9P8R2L7D                                                                                                                                                                                                                                                      "
#   # df3$cog_right_logic
#   # df3$cog_right <- car::recode(df3$cog_right_logic, "TRUE='right';FALSE='wrong';NA='missing'")
#   # 
#   # 
#   # cog_fun <- function(x){
#   #   a <- strsplit(as.character(as.vector(df3$cogR)), "")[[x]]
#   #   sum(c('9','P','8','R','2','L','7','D') %in% a)
#   # }
#   # 
#   # df3$cog_number_right <- suppressWarnings(as.numeric(lapply((1:66),cog_fun)))
#   # 
#   #df3$cs_temp <- df3$InCS==df3$InCS[level=1]
#   
#   df3$j1 <- as.vector(car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   df3$j2 <- as.vector(car::recode(df3$InSWr1, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j3 <- as.vector(car::recode(df3$InSWr2, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j4 <- as.vector(car::recode(df3$InSWr3, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="not wrong", "It's wrong but I can't think of a reason."="wrong","It's wrong and I can provide a valid reason."="wrong")))
#   #df3$j5 <- as.vector(car::recode(df3$cs_temp, "'FALSE'='wrong';'TRUE'='not wrong'"))
#   df3$j6 <- as.vector(car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   
#   df3$ch1 <- df3$j1!=df3$j2
#   df3$ch2 <- df3$j2!=df3$j3
#   df3$ch3 <- df3$j3!=df3$j4
#   df3$ch4 <- df3$j4!=df3$j5
#   df3$ch5 <- df3$j5!=df3$j6
#   
#   df3$Rch1 <- df3$InAR1!=df3$InAR2
#   df3$Rch2 <- df3$InAR2!=df3$InAR3
#   
#   df3$Rs_changed <- (df3$Rch1+df3$Rch2)!=FALSE
#   df3$Rs_changed_tot <- df3$Rch1+df3$Rch2
#   
#   df3$changed <- (df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5)!=FALSE
#   df3$changed_tot <- df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5
#   
#   df3$rs1 <- as.vector(rep("unstated", length=(length(df3$gender))))
#   df3$rs2 <- as.vector(car::recode(df3$InAR1,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs3 <- as.vector(car::recode(df3$InAR2,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs4 <- as.vector(car::recode(df3$InAR3,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
#   df3$rs6 <- as.vector(rep("unstated", length=length(df3$gender)))
#   
#   
#   df3$rs1_bin <- as.vector(car::recode(df3$InAR1,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs2_bin <- as.vector(car::recode(df3$InAR2,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs3_bin <- as.vector(car::recode(df3$InAR3,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   
#   df3$reason_always <- df3$rs1_bin=="reason"&df3$rs2_bin=="reason"&df3$rs3_bin=="reason"
#   df3$cog_Mch_num <- as.numeric(df3$v_181)
#   
#   
#   df3$Dumb_response <- revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$critical_slide_wrong=="changed"),]$Dumb_response <- revalue(df3$Dumb_response[which(df3$critical_slide_wrong=="changed")], c("It's wrong and I can provide a valid reason."="unsupported declarations"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(Dumb_response = ifelse(is.na(Dumb_response),0,Dumb_response))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$Dumb_response)
#   df3$Dumb_response <- car::recode(df3$Dumb_response, "'0'='unsupported declaration';'2'='admission';'1'='nothing wrong';'3'='reasons'")
#   
#   df3$Dumb_response
#   
#   df3$Dumb_incl_string <- droplevels(df3$Dumb_incl_string)
#   
#   
#   df3$engaged <- df3$cog_load_CS_num>6
#   
#   df3$engaged <- car::recode(df3$engaged, "'TRUE'='engaged';'FALSE'='not engaged'")
#   
#   
#   
#   df3$right_change <- df3$InCS# revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$Ju1_bin=="right"),]$right_change <- revalue(df3[which(df3$Ju1_bin=="right")]$right_change, c("There is nothing wrong."="right initially"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(right_change = ifelse(is.na(right_change),0,right_change))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$right_change)
#   df3$right_change <- car::recode(df3$right_change, "'0'='right initially';'2'='dumbfounded';'1'='nothing wrong';'3'='reasons'")
#   
#   
#   
#   
#   df3$wrong1b <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong1b
#   df3$wrong1b <- droplevels(as.factor(df3$wrong1b))
#   df3$wrong1b
#   
#   
#   df3$wrong2b <- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong2b
#   df3$wrong2b <- droplevels(as.factor(df3$wrong2b))
#   df3$wrong2b
#   
#   
#   df3
#   
# }
# 
# #setwd("first_attempt")
# list.files()
# #"cog_load1.sav" "control1.sav" 
# cogload1 <- read.spss("../data/first_attempt/cog_load1.sav", to.data.frame = TRUE)
# cogload1 <- cogload1[which(cogload1$InCS!="NA"),]
# 
# control1 <- read.spss("../data/first_attempt/control1.sav", to.data.frame = TRUE)
# control1 <- control1[which(control1$InCS!="NA"),]
# #setwd("..")
# one <- prep_data1(cogload1,control1)
# study_2 <- one
# df1 <- cogload1
# df2 <- control1
# df3 <- one
# rm(cogload1,control1,prep_data1)
# 
# 
# 
# df <- cbind.data.frame(df3$InCS,df3$NFC)
# colnames(df) <- c("InCS","NFC")
# # write.foreign(as.data.frame(df), "cog2.txt", "cog2.sps", package="SPSS")
# 
# 
# #### load data set Study 3 ####
# 
# 
# prep_data2 <- function(a,b){
#   df1 <- a
#   df2 <- b
#   
#   df2 <- as.data.frame(append(df2, list(v_205 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_198 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_197 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_204 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_196 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_195 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_203 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_194 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_193 = NA), after = 14))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_214 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_213 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_212 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_211 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_210 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_209 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_208 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_207 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_206 = NA), after = 24))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_232 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_231 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_230 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_229 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_228 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_227 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_226 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_225 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_224 = NA), after = 36))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_223 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_222 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_221 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_220 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_219 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_218 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_217 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_216 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_215 = NA), after = 60))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_241 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_240 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_239 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_238 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_237 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_236 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_235 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_234 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_233 = NA), after = 70))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_181 = NA), after = 81))
#   
#   
#   
#   
#   to_num <- function(x){
#     levels(x) <- c(1:7)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   
#   to_num_NFC <- function(x){
#     levels(x) <- c(1:9)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   NFC_rev <- function(x){
#     
#     b <- car::recode(x, "1=9;2=8;3=7;4=6;5=5;6=4;7=3;8=2;9=1")
#     
#     b <- suppressWarnings(as.numeric(b))
#   }
#   
#   NFC_fun <- function(x){
#     
#     df3 <- x
#     
#     names(df3)[names(df3)=="MLQ1"] <- "NFC1"
#     names(df3)[names(df3)=="MLQ2"] <- "NFC2"
#     names(df3)[names(df3)=="MLQ3"] <- "NFC3"
#     names(df3)[names(df3)=="MLQ4"] <- "NFC4"
#     names(df3)[names(df3)=="MLQ5"] <- "NFC5"
#     names(df3)[names(df3)=="MLQ6"] <- "NFC6"
#     names(df3)[names(df3)=="MLQ7"] <- "NFC7"
#     names(df3)[names(df3)=="MLQ8"] <- "NFC8"
#     names(df3)[names(df3)=="MLQ9"] <- "NFC9"
#     names(df3)[names(df3)=="MLQ19"] <- "NFC10"
#     names(df3)[names(df3)=="v_167"] <- "NFC11"
#     names(df3)[names(df3)=="v_168"] <- "NFC12"
#     names(df3)[names(df3)=="v_169"] <- "NFC13"
#     names(df3)[names(df3)=="v_170"] <- "NFC14"
#     names(df3)[names(df3)=="v_171"] <- "NFC15"
#     names(df3)[names(df3)=="v_172"] <- "NFC16"
#     names(df3)[names(df3)=="v_173"] <- "NFC17"
#     names(df3)[names(df3)=="v_174"] <- "NFC18"
#     
#     
#     df3$NFC1 <- suppressWarnings(as.numeric(df3$NFC1))
#     df3$NFC2 <- suppressWarnings(as.numeric(df3$NFC2))
#     df3$NFC3 <- suppressWarnings(as.numeric(df3$NFC3))
#     df3$NFC4 <- suppressWarnings(as.numeric(df3$NFC4))
#     df3$NFC5 <- suppressWarnings(as.numeric(df3$NFC5))
#     df3$NFC6 <- suppressWarnings(as.numeric(df3$NFC6))
#     df3$NFC7 <- suppressWarnings(as.numeric(df3$NFC7))
#     df3$NFC8 <- suppressWarnings(as.numeric(df3$NFC8))
#     df3$NFC9 <- suppressWarnings(as.numeric(df3$NFC9))
#     df3$NFC10 <- suppressWarnings(as.numeric(df3$NFC10))
#     df3$NFC11 <- suppressWarnings(as.numeric(df3$NFC11))
#     df3$NFC12 <- suppressWarnings(as.numeric(df3$NFC12))
#     df3$NFC13 <- suppressWarnings(as.numeric(df3$NFC13))
#     df3$NFC14 <- suppressWarnings(as.numeric(df3$NFC14))
#     df3$NFC15 <- suppressWarnings(as.numeric(df3$NFC15))
#     df3$NFC16 <- suppressWarnings(as.numeric(df3$NFC16))
#     df3$NFC17 <- suppressWarnings(as.numeric(df3$NFC17))
#     df3$NFC18 <- suppressWarnings(as.numeric(df3$NFC18))
#     
#     
#     
#     #3,4,5,7,8,9,12,16,17
#     #as.numeric(df3$NFC3)
#     #df3[48:65]
#     #cbind(df3$NFC3,df3$NFC3R)
#     
#     df3$NFC3R <- NFC_rev(df3$NFC3)
#     df3$NFC4R <- NFC_rev(df3$NFC4)
#     df3$NFC5R <- NFC_rev(df3$NFC5)
#     df3$NFC7R <- NFC_rev(df3$NFC7)
#     df3$NFC8R <- NFC_rev(df3$NFC8)
#     df3$NFC9R <- NFC_rev(df3$NFC9)
#     df3$NFC12R <- NFC_rev(df3$NFC12)
#     df3$NFC16R <- NFC_rev(df3$NFC16)
#     df3$NFC17R <- NFC_rev(df3$NFC17)
#     
#     
#     df3$NFC_tot <- df3$NFC1+
#       df3$NFC2+
#       df3$NFC3R+
#       df3$NFC4R+
#       df3$NFC5R+
#       df3$NFC6+
#       df3$NFC7R+
#       df3$NFC8R+
#       df3$NFC9R+
#       df3$NFC10+
#       df3$NFC11+
#       df3$NFC12R+
#       df3$NFC13+
#       df3$NFC14+
#       df3$NFC15+
#       df3$NFC16R+
#       df3$NFC17R+
#       df3$NFC18
#     
#     df3$NFC <- (df3$NFC_tot)/18
#     df3$NFC_tot
#     df3$NFC <- df3$NFC-5
#     
#     df3
#   }
#   
#   # remove columns with different names
#   
#   df1 <- df1[1:129]
#   df2 <- df2[1:129]
#   
#   cbind(variable.names(df1), variable.names(df2))
#   #create variable identifying condition
#   df1$condition <- rep(1, length(df1$gender))
#   df2$condition <- rep(2, length(df2$gender))
#   
#   # cog load manipulation for experimental group
#   df1$cog_load_test <-
#     df1$v_193=="not quoted"&df1$v_194=="not quoted"&df1$v_203=="quoted"&
#     df1$v_195=="not quoted"&df1$v_196=="not quoted"&df1$v_204=="not quoted"&
#     df1$v_197=="quoted"&df1$v_198=="quoted"&df1$v_205=="not quoted"
#   
#   df1$cog_load_inju <-
#     df1$v_206=="quoted"&df1$v_207=="quoted"&df1$v_208=="not quoted"&
#     df1$v_209=="not quoted"&df1$v_210=="not quoted"&df1$v_211=="quoted"&
#     df1$v_212=="quoted"&df1$v_213=="not quoted"&df1$v_214=="not quoted"
#   
#   df1$cog_load_Rs <-
#     df1$v_224=="quoted"&df1$v_225=="not quoted"&df1$v_226=="not quoted"&
#     df1$v_227=="quoted"&df1$v_228=="not quoted"&df1$v_229=="not quoted"&
#     df1$v_230=="quoted"&df1$v_231=="not quoted"&df1$v_232=="not quoted"
#   
#   df1$cog_load_CS <-
#     df1$v_215=="not quoted"&df1$v_216=="quoted"&df1$v_217=="quoted"&
#     df1$v_218=="not quoted"&df1$v_219=="not quoted"&df1$v_220=="not quoted"&
#     df1$v_221=="quoted"&df1$v_222=="quoted"&df1$v_223=="not quoted"
#   
#   df1$cog_load_reju <-
#     df1$v_233=="not quoted"&df1$v_234=="not quoted"&df1$v_235=="quoted"&
#     df1$v_236=="not quoted"&df1$v_237=="not quoted"&df1$v_238=="quoted"&
#     df1$v_239=="not quoted"&df1$v_240=="not quoted"&df1$v_241=="quoted"
#   
#   df1$cog_load_CS_num <- 
#     c(df1$v_215=="not quoted")+c(df1$v_216=="quoted")+c(df1$v_217=="quoted")+
#     c(df1$v_218=="not quoted")+c(df1$v_219=="not quoted")+c(df1$v_220=="not quoted")+
#     c(df1$v_221=="quoted")+c(df1$v_222=="quoted")+c(df1$v_223=="not quoted")
#   
#   
#   # cog load manipulation for the control group
#   df2$cog_load_test <-
#     df2$v_193=="not quoted"&df2$v_194=="quoted"&df2$v_203=="quoted"&
#     df2$v_195=="not quoted"&df2$v_196=="not quoted"&df2$v_204=="not quoted"&
#     df2$v_197=="quoted"&df2$v_198=="quoted"&df2$v_205=="not quoted"
#   
#   df2$cog_load_inju <-
#     df2$v_206=="not quoted"&df2$v_207=="not quoted"&df2$v_208=="not quoted"&
#     df2$v_209=="not quoted"&df2$v_210=="not quoted"&df2$v_211=="not quoted"&
#     df2$v_212=="quoted"&df2$v_213=="quoted"&df2$v_214=="quoted"
#   
#   df2$cog_load_Rs <-
#     df2$v_224=="quoted"&df2$v_225=="not quoted"&df2$v_226=="not quoted"&
#     df2$v_227=="quoted"&df2$v_228=="not quoted"&df2$v_229=="not quoted"&
#     df2$v_230=="quoted"&df2$v_231=="not quoted"&df2$v_232=="not quoted"
#   
#   df2$cog_load_CS <-
#     df2$v_215=="not quoted"&df2$v_216=="not quoted"&df2$v_217=="not quoted"&
#     df2$v_218=="quoted"&df2$v_219=="quoted"&df2$v_220=="quoted"&
#     df2$v_221=="not quoted"&df2$v_222=="not quoted"&df2$v_223=="not quoted"
#   
#   df2$cog_load_reju <-
#     df2$v_233=="not quoted"&df2$v_234=="not quoted"&df2$v_235=="quoted"&
#     df2$v_236=="not quoted"&df2$v_237=="not quoted"&df2$v_238=="quoted"&
#     df2$v_239=="not quoted"&df2$v_240=="not quoted"&df2$v_241=="quoted"
#   
#   df2$cog_load_CS_num <-
#     c(df2$v_215=="not quoted")+c(df2$v_216=="not quoted")+c(df2$v_217=="not quoted")+
#     c(df2$v_218=="quoted")+c(df2$v_219=="quoted")+c(df2$v_220=="quoted")+
#     c(df2$v_221=="not quoted")+c(df2$v_222=="not quoted")+c(df2$v_223=="not quoted")
#   
#   
#   #create variable labelling participants
#   participant <- c(1:c(length(df1$gender)+length(df2$gender)))
#   
#   #merge the data frames
#   df3 <- cbind(participant,rbind.data.frame(df1[1:136],df2[1:136]))
#   
#   df3$condition <- car::recode(df3$condition, "1='cog_load';2='control'")
#   
#   df3$cogload_num <- df3$cog_load_CS+df3$cog_load_inju+df3$cog_load_Rs+df3$cog_load_reju
#   
#   df3$InJu1 <- to_num(df3$InJu1)
#   df3$InJu2 <- to_num(df3$InJu2)
#   df3$InCf1 <- to_num(df3$InCf1)
#   df3$InCf2 <- to_num(df3$InCf2)
#   df3$InRsn2 <- to_num(df3$InRsn2)
#   
#   df3$Ju1_bin <- car::recode(df3$InJu1,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$Ju2_bin <- car::recode(df3$InJu2,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$condition
#   
#   df3$wrong1 <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3$wrong2<- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3 <- NFC_fun(df3)
#   
#   
#   names(df3)[names(df3) == 'v_164'] <- 'pot_hrm'
#   names(df3)[names(df3) == 'v_165'] <- 'box'
#   names(df3)[names(df3) == 'v_166'] <- 'rugb'
#   
#   df3$pot_hrm <- to_num(df3$pot_hrm)
#   df3$pot_hrm_bin <- car::recode(df3$pot_hrm,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$all_harm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")
#   df3$all_harm <- car::recode(df3$all_harm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$all_harm_norm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")&(df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$all_harm_norm <- car::recode(df3$all_harm_norm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$nrm_all <- (df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$nrm_all <- car::recode(df3$nrm_all, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   
#   df3$Roz_fully_C <- (df3$normQ== 'Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise.' & df3$Hrm_oth=="Yes, I am able to believe this"& df3$Hrm_rel=="Yes, I am able to believe this")
#   df3$Roz_fully_C <- car::recode(df3$Roz_fully_C, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   #df3$cog_M_ch_bin <- to_num(df3$cogMch)
#   #df3$cog_M_ch_bin <- car::recode(df3$cog_M_ch_bin,"NA='missing';1='difficult';2='difficult';3='difficult';4='neutral';5='easy';6='easy';7='easy'")
#   # 
#   # df3$cog_Rb <- as.vector(df3$cogR)
#   # df3$cog_right_logic <- df3$cog_Rb=="9P8R2L7D                                                                                                                                                                                                                                                      "
#   # df3$cog_right_logic
#   # df3$cog_right <- car::recode(df3$cog_right_logic, "TRUE='right';FALSE='wrong';NA='missing'")
#   # 
#   # 
#   # cog_fun <- function(x){
#   #   a <- strsplit(as.character(as.vector(df3$cogR)), "")[[x]]
#   #   sum(c('9','P','8','R','2','L','7','D') %in% a)
#   # }
#   # 
#   # df3$cog_number_right <- suppressWarnings(as.numeric(lapply((1:66),cog_fun)))
#   # 
#   #df3$cs_temp <- df3$InCS==df3$InCS[level=1]
#   
#   df3$j1 <- as.vector(car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   df3$j2 <- as.vector(car::recode(df3$InSWr1, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j3 <- as.vector(car::recode(df3$InSWr2, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j4 <- as.vector(car::recode(df3$InSWr3, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="not wrong", "It's wrong but I can't think of a reason."="wrong","It's wrong and I can provide a valid reason."="wrong")))
#   #df3$j5 <- as.vector(car::recode(df3$cs_temp, "'FALSE'='wrong';'TRUE'='not wrong'"))
#   df3$j6 <- as.vector(car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   
#   df3$ch1 <- df3$j1!=df3$j2
#   df3$ch2 <- df3$j2!=df3$j3
#   df3$ch3 <- df3$j3!=df3$j4
#   df3$ch4 <- df3$j4!=df3$j5
#   df3$ch5 <- df3$j5!=df3$j6
#   
#   df3$Rch1 <- df3$InAR1!=df3$InAR2
#   df3$Rch2 <- df3$InAR2!=df3$InAR3
#   
#   df3$Rs_changed <- (df3$Rch1+df3$Rch2)!=FALSE
#   df3$Rs_changed_tot <- df3$Rch1+df3$Rch2
#   
#   df3$changed <- (df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5)!=FALSE
#   df3$changed_tot <- df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5
#   
#   df3$rs1 <- as.vector(rep("unstated", length=(length(df3$gender))))
#   df3$rs2 <- as.vector(car::recode(df3$InAR1,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs3 <- as.vector(car::recode(df3$InAR2,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs4 <- as.vector(car::recode(df3$InAR3,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
#   df3$rs6 <- as.vector(rep("unstated", length=length(df3$gender)))
#   
#   
#   df3$rs1_bin <- as.vector(car::recode(df3$InAR1,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs2_bin <- as.vector(car::recode(df3$InAR2,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs3_bin <- as.vector(car::recode(df3$InAR3,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   
#   df3$reason_always <- df3$rs1_bin=="reason"&df3$rs2_bin=="reason"&df3$rs3_bin=="reason"
#   df3$cog_Mch_num <- as.numeric(df3$v_181)
#   
#   
#   
#   df3$Dumb_response <- revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$critical_slide_wrong=="changed"),]$Dumb_response <- revalue(df3$Dumb_response[which(df3$critical_slide_wrong=="changed")], c("It's wrong and I can provide a valid reason."="unsupported declarations"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(Dumb_response = ifelse(is.na(Dumb_response),0,Dumb_response))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$Dumb_response)
#   df3$Dumb_response <- car::recode(df3$Dumb_response, "'0'='unsupported declaration';'2'='admission';'1'='nothing wrong';'3'='reasons'")
#   
#   df3$Dumb_incl_string <- droplevels(df3$Dumb_incl_string)
#   
#   df3$Dumb_response
#   df3$engaged <- df3$cog_load_CS_num>6|df3$condition=="control"
#   
#   
#   df3$right_change <- df3$InCS# revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$Ju1_bin=="right"),]$right_change <- revalue(df3[which(df3$Ju1_bin=="right")]$right_change, c("There is nothing wrong."="right initially"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(right_change = ifelse(is.na(right_change),0,right_change))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$right_change)
#   df3$right_change <- car::recode(df3$right_change, "'0'='right initially';'2'='dumbfounded';'1'='nothing wrong';'3'='reasons'")
#   
#   
#   
#   
#   df3$wrong1b <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong1b
#   df3$wrong1b <- droplevels(as.factor(df3$wrong1b))
#   df3$wrong1b
#   
#   
#   df3$wrong2b <- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong2b
#   df3$wrong2b <- droplevels(as.factor(df3$wrong2b))
#   df3$wrong2b
#   
#   df3
#   
# }
# 
# #setwd("second_attempt")
# list.files()
# #"cog_load1.sav" "control1.sav" 
# cogload2a <- read.spss("../data/second_attempt/cog_load2.sav", to.data.frame = TRUE)
# cogload2b <- read.spss("../data/second_attempt/cog_load2d.sav", to.data.frame = TRUE)
# 
# cogload2a <- cogload2a[which(cogload2a$InCS!="NA"),]
# cogload2b <- cogload2b[which(cogload2b$InCS!="NA"),]
# cbind(variable.names(cogload2a),variable.names(cogload2b))
# cogload2 <- rbind.data.frame(cogload2a[1:129],cogload2b[1:129])
# rm(cogload2a,cogload2b)
# 
# cogload2 <- cogload2[which(cogload2$InCS!="NA"),]
# 
# control2 <- read.spss("../data/second_attempt/control2.sav", to.data.frame = TRUE)
# control2 <- control2[which(control2$InCS!="NA"),]
# #setwd("..")
# 
# # df1 <- cogload2
# # df2 <- control2
# 
# two <- prep_data2(cogload2,control2)
# two$engaged
# df3 <- two
# study_3 <- two
# rm(cogload2,control2,prep_data2)
# 
# a <- sum(df3$engaged==F)
# 
# df3 <- df3[which(df3$engaged==T),]
# two_e <- df3
# 
# df <- cbind.data.frame(df3$InCS,df3$NFC)
# colnames(df) <- c("InCS","NFC")
# # write.foreign(as.data.frame(df), "cog3.txt", "cog3.sps", package="SPSS")
# # 
# # 
# # df <- cbind.data.frame(df3[30],df3[103])
# # write.foreign(as.data.frame(df), "cog3.txt", "cog3.sps", package="SPSS")
# 
# 
# 
# #### load data set Study 4 ####
# 
# prep_data3 <- function(a,b){
#   df1 <- a
#   df2 <- b
#   
#   #df1 <- cogload3
#   #df2 <- control3
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_205 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_198 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_197 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_204 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_196 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_195 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_203 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_194 = NA), after = 14))
#   df2 <- as.data.frame(append(df2, list(v_193 = NA), after = 14))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_214 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_213 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_212 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_211 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_210 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_209 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_208 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_207 = NA), after = 24))
#   df2 <- as.data.frame(append(df2, list(v_206 = NA), after = 24))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_232 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_231 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_230 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_229 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_228 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_227 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_226 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_225 = NA), after = 36))
#   df2 <- as.data.frame(append(df2, list(v_224 = NA), after = 36))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_223 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_222 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_221 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_220 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_219 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_218 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_217 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_216 = NA), after = 60))
#   df2 <- as.data.frame(append(df2, list(v_215 = NA), after = 60))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_241 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_240 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_239 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_238 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_237 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_236 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_235 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_234 = NA), after = 70))
#   df2 <- as.data.frame(append(df2, list(v_233 = NA), after = 70))
#   
#   
#   df2 <- as.data.frame(append(df2, list(v_181 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_305 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_304 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_303 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_302 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_301 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_300 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_299 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_298 = NA), after = 94))
#   df2 <- as.data.frame(append(df2, list(v_297 = NA), after = 94))
#   
#   cbind(variable.names(df1),variable.names(df2))
#   
#   sum(variable.names(df1)!=variable.names(df2))
#   
#   
#   to_num <- function(x){
#     levels(x) <- c(1:7)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   
#   to_num_NFC <- function(x){
#     levels(x) <- c(1:9)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   NFC_rev <- function(x){
#     
#     b <- car::recode(x, "1=9;2=8;3=7;4=6;5=5;6=4;7=3;8=2;9=1")
#     
#     b <- suppressWarnings(as.numeric(b))
#   }
#   
#   NFC_fun <- function(x){
#     
#     df3 <- x
#     
#     names(df3)[names(df3)=="MLQ1"] <- "NFC1"
#     names(df3)[names(df3)=="MLQ2"] <- "NFC2"
#     names(df3)[names(df3)=="MLQ3"] <- "NFC3"
#     names(df3)[names(df3)=="MLQ4"] <- "NFC4"
#     names(df3)[names(df3)=="MLQ5"] <- "NFC5"
#     names(df3)[names(df3)=="MLQ6"] <- "NFC6"
#     names(df3)[names(df3)=="MLQ7"] <- "NFC7"
#     names(df3)[names(df3)=="MLQ8"] <- "NFC8"
#     names(df3)[names(df3)=="MLQ9"] <- "NFC9"
#     names(df3)[names(df3)=="MLQ19"] <- "NFC10"
#     names(df3)[names(df3)=="v_167"] <- "NFC11"
#     names(df3)[names(df3)=="v_168"] <- "NFC12"
#     names(df3)[names(df3)=="v_169"] <- "NFC13"
#     names(df3)[names(df3)=="v_170"] <- "NFC14"
#     names(df3)[names(df3)=="v_171"] <- "NFC15"
#     names(df3)[names(df3)=="v_172"] <- "NFC16"
#     names(df3)[names(df3)=="v_173"] <- "NFC17"
#     names(df3)[names(df3)=="v_174"] <- "NFC18"
#     
#     
#     df3$NFC1 <- suppressWarnings(as.numeric(df3$NFC1))
#     df3$NFC2 <- suppressWarnings(as.numeric(df3$NFC2))
#     df3$NFC3 <- suppressWarnings(as.numeric(df3$NFC3))
#     df3$NFC4 <- suppressWarnings(as.numeric(df3$NFC4))
#     df3$NFC5 <- suppressWarnings(as.numeric(df3$NFC5))
#     df3$NFC6 <- suppressWarnings(as.numeric(df3$NFC6))
#     df3$NFC7 <- suppressWarnings(as.numeric(df3$NFC7))
#     df3$NFC8 <- suppressWarnings(as.numeric(df3$NFC8))
#     df3$NFC9 <- suppressWarnings(as.numeric(df3$NFC9))
#     df3$NFC10 <- suppressWarnings(as.numeric(df3$NFC10))
#     df3$NFC11 <- suppressWarnings(as.numeric(df3$NFC11))
#     df3$NFC12 <- suppressWarnings(as.numeric(df3$NFC12))
#     df3$NFC13 <- suppressWarnings(as.numeric(df3$NFC13))
#     df3$NFC14 <- suppressWarnings(as.numeric(df3$NFC14))
#     df3$NFC15 <- suppressWarnings(as.numeric(df3$NFC15))
#     df3$NFC16 <- suppressWarnings(as.numeric(df3$NFC16))
#     df3$NFC17 <- suppressWarnings(as.numeric(df3$NFC17))
#     df3$NFC18 <- suppressWarnings(as.numeric(df3$NFC18))
#     
#     
#     
#     #3,4,5,7,8,9,12,16,17
#     #as.numeric(df3$NFC3)
#     #df3[48:65]
#     #cbind(df3$NFC3,df3$NFC3R)
#     
#     df3$NFC3R <- NFC_rev(df3$NFC3)
#     df3$NFC4R <- NFC_rev(df3$NFC4)
#     df3$NFC5R <- NFC_rev(df3$NFC5)
#     df3$NFC7R <- NFC_rev(df3$NFC7)
#     df3$NFC8R <- NFC_rev(df3$NFC8)
#     df3$NFC9R <- NFC_rev(df3$NFC9)
#     df3$NFC12R <- NFC_rev(df3$NFC12)
#     df3$NFC16R <- NFC_rev(df3$NFC16)
#     df3$NFC17R <- NFC_rev(df3$NFC17)
#     
#     
#     df3$NFC_tot <- df3$NFC1+
#       df3$NFC2+
#       df3$NFC3R+
#       df3$NFC4R+
#       df3$NFC5R+
#       df3$NFC6+
#       df3$NFC7R+
#       df3$NFC8R+
#       df3$NFC9R+
#       df3$NFC10+
#       df3$NFC11+
#       df3$NFC12R+
#       df3$NFC13+
#       df3$NFC14+
#       df3$NFC15+
#       df3$NFC16R+
#       df3$NFC17R+
#       df3$NFC18
#     
#     df3$NFC <- (df3$NFC_tot)/18
#     df3$NFC_tot
#     df3$NFC <- df3$NFC-5
#     
#     df3
#   }
#   
#   # remove columns with different names
#   
#   
#   
#   
#   
#   df1 <- df1[1:140]
#   df2 <- df2[1:140]
#   
#   cbind(variable.names(df1), variable.names(df2))
#   #create variable identifying condition
#   df1$condition <- rep(1, length(df1$gender))
#   df2$condition <- rep(2, length(df2$gender))
#   
#   # cog load manipulation for experimental group
#   df1$cog_load_test <-
#     df1$v_193=="not quoted"&df1$v_194=="not quoted"&df1$v_203=="quoted"&
#     df1$v_195=="not quoted"&df1$v_196=="not quoted"&df1$v_204=="not quoted"&
#     df1$v_197=="quoted"&df1$v_198=="quoted"&df1$v_205=="not quoted"
#   
#   df1$cog_load_inju <-
#     df1$v_206=="quoted"&df1$v_207=="quoted"&df1$v_208=="not quoted"&
#     df1$v_209=="not quoted"&df1$v_210=="not quoted"&df1$v_211=="quoted"&
#     df1$v_212=="quoted"&df1$v_213=="not quoted"&df1$v_214=="not quoted"
#   
#   df1$cog_load_Rs <-
#     df1$v_224=="quoted"&df1$v_225=="not quoted"&df1$v_226=="not quoted"&
#     df1$v_227=="quoted"&df1$v_228=="not quoted"&df1$v_229=="not quoted"&
#     df1$v_230=="quoted"&df1$v_231=="not quoted"&df1$v_232=="not quoted"
#   
#   df1$cog_load_CS <-
#     df1$v_215=="not quoted"&df1$v_216=="quoted"&df1$v_217=="quoted"&
#     df1$v_218=="not quoted"&df1$v_219=="not quoted"&df1$v_220=="not quoted"&
#     df1$v_221=="quoted"&df1$v_222=="quoted"&df1$v_223=="not quoted"
#   
#   df1$cog_load_reju <-
#     df1$v_233=="not quoted"&df1$v_234=="not quoted"&df1$v_235=="quoted"&
#     df1$v_236=="not quoted"&df1$v_237=="not quoted"&df1$v_238=="quoted"&
#     df1$v_239=="not quoted"&df1$v_240=="not quoted"&df1$v_241=="quoted"
#   
#   df1$cog_load_CS_num <- 
#     c(df1$v_215=="not quoted")+c(df1$v_216=="quoted")+c(df1$v_217=="quoted")+
#     c(df1$v_218=="not quoted")+c(df1$v_219=="not quoted")+c(df1$v_220=="not quoted")+
#     c(df1$v_221=="quoted")+c(df1$v_222=="quoted")+c(df1$v_223=="not quoted")
#   
#   df1$cog_load_mch_num <- 
#     c(df1$v_297=="quoted")+c(df1$v_298=="quoted")+c(df1$v_299=="quoted")+
#     c(df1$v_300=="quoted")+c(df1$v_301=="not quoted")+c(df1$v_302=="quoted")+
#     c(df1$v_303=="not quoted")+c(df1$v_304=="not quoted")+c(df1$v_305=="not quoted")
#   
#   
#   # cog load manipulation for the control group
#   df2$cog_load_test <-
#     df2$v_193=="not quoted"&df2$v_194=="quoted"&df2$v_203=="quoted"&
#     df2$v_195=="not quoted"&df2$v_196=="not quoted"&df2$v_204=="not quoted"&
#     df2$v_197=="quoted"&df2$v_198=="quoted"&df2$v_205=="not quoted"
#   
#   df2$cog_load_inju <-
#     df2$v_206=="not quoted"&df2$v_207=="not quoted"&df2$v_208=="not quoted"&
#     df2$v_209=="not quoted"&df2$v_210=="not quoted"&df2$v_211=="not quoted"&
#     df2$v_212=="quoted"&df2$v_213=="quoted"&df2$v_214=="quoted"
#   
#   df2$cog_load_Rs <-
#     df2$v_224=="quoted"&df2$v_225=="not quoted"&df2$v_226=="not quoted"&
#     df2$v_227=="quoted"&df2$v_228=="not quoted"&df2$v_229=="not quoted"&
#     df2$v_230=="quoted"&df2$v_231=="not quoted"&df2$v_232=="not quoted"
#   
#   df2$cog_load_CS <-
#     df2$v_215=="not quoted"&df2$v_216=="not quoted"&df2$v_217=="not quoted"&
#     df2$v_218=="quoted"&df2$v_219=="quoted"&df2$v_220=="quoted"&
#     df2$v_221=="not quoted"&df2$v_222=="not quoted"&df2$v_223=="not quoted"
#   
#   df2$cog_load_reju <-
#     df2$v_233=="not quoted"&df2$v_234=="not quoted"&df2$v_235=="quoted"&
#     df2$v_236=="not quoted"&df2$v_237=="not quoted"&df2$v_238=="quoted"&
#     df2$v_239=="not quoted"&df2$v_240=="not quoted"&df2$v_241=="quoted"
#   
#   df2$cog_load_CS_num <-
#     c(df2$v_215=="not quoted")+c(df2$v_216=="not quoted")+c(df2$v_217=="not quoted")+
#     c(df2$v_218=="quoted")+c(df2$v_219=="quoted")+c(df2$v_220=="quoted")+
#     c(df2$v_221=="not quoted")+c(df2$v_222=="not quoted")+c(df2$v_223=="not quoted")
#   
#   df2$cog_load_mch_num <- 
#     c(df2$v_297=="quoted")+c(df2$v_298=="quoted")+c(df2$v_299=="quoted")+
#     c(df2$v_300=="quoted")+c(df2$v_301=="not quoted")+c(df2$v_302=="quoted")+
#     c(df2$v_303=="not quoted")+c(df2$v_304=="not quoted")+c(df2$v_305=="not quoted")
#   
#   
#   
#   #create variable labelling participants
#   participant <- c(1:c(length(df1$gender)+length(df2$gender)))
#   
#   #merge the data frames
#   df3 <- cbind(participant,rbind.data.frame(df1[1:148],df2[1:148]))
#   
#   df3$condition <- car::recode(df3$condition, "1='cog_load';2='control'")
#   
#   df3$cogload_num <- df3$cog_load_CS+df3$cog_load_inju+df3$cog_load_Rs+df3$cog_load_reju
#   
#   df3$InJu1 <- to_num(df3$InJu1)
#   df3$InJu2 <- to_num(df3$InJu2)
#   df3$InCf1 <- to_num(df3$InCf1)
#   df3$InCf2 <- to_num(df3$InCf2)
#   df3$InRsn2 <- to_num(df3$InRsn2)
#   
#   df3$Ju1_bin <- car::recode(df3$InJu1,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$Ju2_bin <- car::recode(df3$InJu2,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$condition
#   
#   df3$wrong1 <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3$wrong2<- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3 <- NFC_fun(df3)
#   
#   
#   names(df3)[names(df3) == 'v_164'] <- 'pot_hrm'
#   names(df3)[names(df3) == 'v_165'] <- 'box'
#   names(df3)[names(df3) == 'v_166'] <- 'rugb'
#   
#   
#   
#   df3$pot_hrm <- to_num(df3$pot_hrm)
#   df3$pot_hrm_bin <- car::recode(df3$pot_hrm,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$all_harm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")
#   df3$all_harm <- car::recode(df3$all_harm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$all_harm_norm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")&(df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$all_harm_norm <- car::recode(df3$all_harm_norm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$nrm_all <- (df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   df3$nrm_all <- car::recode(df3$nrm_all, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   
#   df3$Roz_fully_C <- (df3$normQ== 'Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise.' & df3$Hrm_oth=="Yes, I am able to believe this"& df3$Hrm_rel=="Yes, I am able to believe this")
#   df3$Roz_fully_C <- car::recode(df3$Roz_fully_C, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   #df3$cog_M_ch_bin <- to_num(df3$cogMch)
#   #df3$cog_M_ch_bin <- car::recode(df3$cog_M_ch_bin,"NA='missing';1='difficult';2='difficult';3='difficult';4='neutral';5='easy';6='easy';7='easy'")
#   # 
#   # df3$cog_Rb <- as.vector(df3$cogR)
#   # df3$cog_right_logic <- df3$cog_Rb=="9P8R2L7D                                                                                                                                                                                                                                                      "
#   # df3$cog_right_logic
#   # df3$cog_right <- car::recode(df3$cog_right_logic, "TRUE='right';FALSE='wrong';NA='missing'")
#   # 
#   # 
#   # cog_fun <- function(x){
#   #   a <- strsplit(as.character(as.vector(df3$cogR)), "")[[x]]
#   #   sum(c('9','P','8','R','2','L','7','D') %in% a)
#   # }
#   # 
#   # df3$cog_number_right <- suppressWarnings(as.numeric(lapply((1:66),cog_fun)))
#   # 
#   #df3$cs_temp <- df3$InCS==df3$InCS[level=1]
#   
#   df3$j1 <- as.vector(car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   df3$j2 <- as.vector(car::recode(df3$InSWr1, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j3 <- as.vector(car::recode(df3$InSWr2, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j4 <- as.vector(car::recode(df3$InSWr3, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="not wrong", "It's wrong but I can't think of a reason."="wrong","It's wrong and I can provide a valid reason."="wrong")))
#   #df3$j5 <- as.vector(car::recode(df3$cs_temp, "'FALSE'='wrong';'TRUE'='not wrong'"))
#   df3$j6 <- as.vector(car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   
#   df3$ch1 <- df3$j1!=df3$j2
#   df3$ch2 <- df3$j2!=df3$j3
#   df3$ch3 <- df3$j3!=df3$j4
#   df3$ch4 <- df3$j4!=df3$j5
#   df3$ch5 <- df3$j5!=df3$j6
#   
#   df3$Rch1 <- df3$InAR1!=df3$InAR2
#   df3$Rch2 <- df3$InAR2!=df3$InAR3
#   
#   df3$Rs_changed <- (df3$Rch1+df3$Rch2)!=FALSE
#   df3$Rs_changed_tot <- df3$Rch1+df3$Rch2
#   
#   df3$changed <- (df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5)!=FALSE
#   df3$changed_tot <- df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5
#   
#   df3$rs1 <- as.vector(rep("unstated", length=(length(df3$gender))))
#   df3$rs2 <- as.vector(car::recode(df3$InAR1,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs3 <- as.vector(car::recode(df3$InAR2,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs4 <- as.vector(car::recode(df3$InAR3,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
#   df3$rs6 <- as.vector(rep("unstated", length=length(df3$gender)))
#   
#   
#   df3$rs1_bin <- as.vector(car::recode(df3$InAR1,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs2_bin <- as.vector(car::recode(df3$InAR2,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs3_bin <- as.vector(car::recode(df3$InAR3,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   
#   df3$reason_always <- df3$rs1_bin=="reason"&df3$rs2_bin=="reason"&df3$rs3_bin=="reason"
#   df3$cog_Mch_num <- as.numeric(df3$v_181)
#   
#   
#   df3$Dumb_response <- revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$critical_slide_wrong=="changed"),]$Dumb_response <- revalue(df3$Dumb_response[which(df3$critical_slide_wrong=="changed")], c("It's wrong and I can provide a valid reason."="unsupported declarations"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(Dumb_response = ifelse(is.na(Dumb_response),0,Dumb_response))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$Dumb_response)
#   df3$Dumb_response <- car::recode(df3$Dumb_response, "'0'='unsupported declaration';'2'='admission';'1'='nothing wrong';'3'='reasons'")
#   
#   df3$Dumb_response
#   
#   df3$Dumb_incl_string <- droplevels(df3$Dumb_incl_string)
#   df3$engaged <- df3$cog_load_CS_num>6|df3$condition=="control"
#   
#   
#   df3$right_change <- df3$InCS# revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$Ju1_bin=="right"),]$right_change <- revalue(df3[which(df3$Ju1_bin=="right")]$right_change, c("There is nothing wrong."="right initially"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(right_change = ifelse(is.na(right_change),0,right_change))
#   
#   detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$right_change)
#   df3$right_change <- car::recode(df3$right_change, "'0'='right initially';'2'='dumbfounded';'1'='nothing wrong';'3'='reasons'")
#   
#   
#   
#   
#   df3$wrong1b <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong1b
#   df3$wrong1b <- droplevels(as.factor(df3$wrong1b))
#   df3$wrong1b
#   
#   
#   df3$wrong2b <- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong2b
#   df3$wrong2b <- droplevels(as.factor(df3$wrong2b))
#   df3$wrong2b
#   
#   
#   df3
#   
# }
# 
# 
# #setwd("third_attempt")
# list.files()
# #"cog_load3.sav" "control3.sav" 
# cogload3a <- read.spss("../data/third_attempt/cog_load3.sav", to.data.frame = TRUE)
# cogload3b <- read.spss("../data/third_attempt/cog_load3d.sav", to.data.frame = TRUE)
# 
# 
# variable.names(cogload3a[1:139])==variable.names(cogload3b[1:139])
# cbind(variable.names(cogload3a),variable.names(cogload3b))
# cogload3a$Ds_time <- cogload3a$rts2191636-cogload3a$rts2191631
# cogload3b$Ds_time <- cogload3b$rts2273569 -cogload3b$rts2273568
# cogload3 <- rbind.data.frame(cbind.data.frame(cogload3a[1:139],cogload3a[210]),
#                              cbind.data.frame(cogload3b[1:139],cogload3b[210]))
# rm(cogload3a,cogload3b)
# #cogload3 <- cogload3a
# cogload3 <- cogload3[which(cogload3$InCS!="NA"),]
# 
# control3 <- read.spss("../data/third_attempt/control3.sav", to.data.frame = TRUE)
# control3$Ds_time <- control3$rts2191839-control3$rts2191836
# 
# control3 <- cbind.data.frame(control3[1:84],control3[135])
# control3 <- control3[which(control3$InCS!="NA"),]
# #setwd("..")
# three <- prep_data3(cogload3,control3)
# df3 <- three
# study_4 <- three
# rm(cogload3,control3,prep_data3)
# a <- sum(df3$engaged==F)
# # writing to spss #
# df3 <- df3[which(df3$engaged==T),]
# 
# # df <- cbind.data.frame(df3[30],df3[103])
# # write.foreign(as.data.frame(df), "cog3.txt", "cog3.sps", package="SPSS")
# 
# 
# df <- cbind.data.frame(df3$InCS,df3$NFC)
# colnames(df) <- c("InCS","NFC")
# # write.foreign(as.data.frame(df), "cog4.txt", "cog4.sps", package="SPSS")
# 
# 
# 
# #### load data set Study 5 ####
# 
# 
# prep_data_study5 <- function(a,b){
#   df1 <- a
#   df2 <- b
#   
#   to_num <- function(x){
#     levels(x) <- c(1:7)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   
#   to_num_NFC <- function(x){
#     levels(x) <- c(1:9)
#     x <- suppressWarnings(as.numeric(x))
#     
#   }
#   
#   NFC_rev <- function(x){
#     
#     b <- car::recode(x, "1=9;2=8;3=7;4=6;5=5;6=4;7=3;8=2;9=1")
#     
#     b <- suppressWarnings(as.numeric(b))
#   }
#   
#   NFC_fun <- function(x){
#     
#     df3 <- x
#     
#     names(df3)[names(df3)=="MLQ1"] <- "NFC1"
#     names(df3)[names(df3)=="MLQ2"] <- "NFC2"
#     names(df3)[names(df3)=="MLQ3"] <- "NFC3"
#     names(df3)[names(df3)=="MLQ4"] <- "NFC4"
#     names(df3)[names(df3)=="MLQ5"] <- "NFC5"
#     names(df3)[names(df3)=="MLQ6"] <- "NFC6"
#     names(df3)[names(df3)=="MLQ7"] <- "NFC7"
#     names(df3)[names(df3)=="MLQ8"] <- "NFC8"
#     names(df3)[names(df3)=="MLQ9"] <- "NFC9"
#     names(df3)[names(df3)=="MLQ19"] <- "NFC10"
#     names(df3)[names(df3)=="v_167"] <- "NFC11"
#     names(df3)[names(df3)=="v_168"] <- "NFC12"
#     names(df3)[names(df3)=="v_169"] <- "NFC13"
#     names(df3)[names(df3)=="v_170"] <- "NFC14"
#     names(df3)[names(df3)=="v_171"] <- "NFC15"
#     names(df3)[names(df3)=="v_172"] <- "NFC16"
#     names(df3)[names(df3)=="v_173"] <- "NFC17"
#     names(df3)[names(df3)=="v_174"] <- "NFC18"
#     
#     
#     df3$NFC1 <- suppressWarnings(as.numeric(df3$NFC1))
#     df3$NFC2 <- suppressWarnings(as.numeric(df3$NFC2))
#     df3$NFC3 <- suppressWarnings(as.numeric(df3$NFC3))
#     df3$NFC4 <- suppressWarnings(as.numeric(df3$NFC4))
#     df3$NFC5 <- suppressWarnings(as.numeric(df3$NFC5))
#     df3$NFC6 <- suppressWarnings(as.numeric(df3$NFC6))
#     df3$NFC7 <- suppressWarnings(as.numeric(df3$NFC7))
#     df3$NFC8 <- suppressWarnings(as.numeric(df3$NFC8))
#     df3$NFC9 <- suppressWarnings(as.numeric(df3$NFC9))
#     df3$NFC10 <- suppressWarnings(as.numeric(df3$NFC10))
#     df3$NFC11 <- suppressWarnings(as.numeric(df3$NFC11))
#     df3$NFC12 <- suppressWarnings(as.numeric(df3$NFC12))
#     df3$NFC13 <- suppressWarnings(as.numeric(df3$NFC13))
#     df3$NFC14 <- suppressWarnings(as.numeric(df3$NFC14))
#     df3$NFC15 <- suppressWarnings(as.numeric(df3$NFC15))
#     df3$NFC16 <- suppressWarnings(as.numeric(df3$NFC16))
#     df3$NFC17 <- suppressWarnings(as.numeric(df3$NFC17))
#     df3$NFC18 <- suppressWarnings(as.numeric(df3$NFC18))
#     
#     
#     
#     #3,4,5,7,8,9,12,16,17
#     #as.numeric(df3$NFC3)
#     #df3[48:65]
#     #cbind(df3$NFC3,df3$NFC3R)
#     
#     df3$NFC3R <- NFC_rev(df3$NFC3)
#     df3$NFC4R <- NFC_rev(df3$NFC4)
#     df3$NFC5R <- NFC_rev(df3$NFC5)
#     df3$NFC7R <- NFC_rev(df3$NFC7)
#     df3$NFC8R <- NFC_rev(df3$NFC8)
#     df3$NFC9R <- NFC_rev(df3$NFC9)
#     df3$NFC12R <- NFC_rev(df3$NFC12)
#     df3$NFC16R <- NFC_rev(df3$NFC16)
#     df3$NFC17R <- NFC_rev(df3$NFC17)
#     
#     
#     df3$NFC_tot <- df3$NFC1+
#       df3$NFC2+
#       df3$NFC3R+
#       df3$NFC4R+
#       df3$NFC5R+
#       df3$NFC6+
#       df3$NFC7R+
#       df3$NFC8R+
#       df3$NFC9R+
#       df3$NFC10+
#       df3$NFC11+
#       df3$NFC12R+
#       df3$NFC13+
#       df3$NFC14+
#       df3$NFC15+
#       df3$NFC16R+
#       df3$NFC17R+
#       df3$NFC18
#     
#     df3$NFC <- (df3$NFC_tot)/18
#     df3$NFC_tot
#     df3$NFC <- df3$NFC-5
#     
#     df3
#   }
#   
#   #create variable identifying condition
#   df1$condition <- rep(1, length(df1$gender))
#   df2$condition <- rep(2, length(df2$gender))
#   
#   #create variable labelling participants
#   participant <- c(1:(length(df1$gender)+length(df2$gender)))
#   
#   # add columns to df2 to match variable names
#   
#   #cbind(variable.names(df1),variable.names(df2))
#   df2 <- add_column(df2, v_180 = rep(0, length(df2$gender)), .after = "InCf2")
#   df2 <- add_column(df2, v_181 = rep(0, length(df2$gender)), .after = "v_180")
#   #cbind(variable.names(df1),variable.names(df2))
#   
#   #merge the data frames
#   df3 <- cbind(participant
#                ,
#                suppressWarnings(rbind.data.frame(df1[1:85],df2[1:85],stringsAsFactors = FALSE))
#                , 
#                rbind(df1[146],df2[142])
#   )
#   
#   df3$condition <- as.factor(df3$condition)
#   #library(car)
#   df3$condition <- car::recode(df3$condition, "1='cog_load';2='control'")
#   
#   df3$InJu1 <- to_num(df3$InJu1)
#   df3$InJu2 <- to_num(df3$InJu2)
#   df3$InCf1 <- to_num(df3$InCf1)
#   df3$InCf2 <- to_num(df3$InCf2)
#   
#   df3$Ju1_bin <- car::recode(df3$InJu1,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$Ju2_bin <- car::recode(df3$InJu2,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   df3$condition
#   
#   df3$wrong1 <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3$wrong2<- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'")
#   
#   df3 <- NFC_fun(df3)
#   
#   #df3$pot_hrm <- to_num(df3$pot_hrm)
#   #df3$pot_hrm_bin <- car::recode(df3$pot_hrm,"1='wrong';2='wrong';3='wrong';4='neutral';5='right';6='right';7='right'")
#   #df3$all_harm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")
#   #df3$all_harm <- car::recode(df3$all_harm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   #df3$all_harm_norm <- (df3$pot_hrm_bin!="wrong"|df3$box=="No"|df3$rugb=="No"|df3$hrm_Qs=="no harm")&(df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   #df3$all_harm_norm <- car::recode(df3$all_harm_norm, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   #df3$nrm_all <- (df3$normQ=="Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise."|df3$nrm_st=="norms not mentioned")
#   #df3$nrm_all <- car::recode(df3$nrm_all, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   
#   #df3$Roz_fully_C <- (df3$normQ== 'Violating an established moral norm, just for fun or personal enjoyment, is wrong only in situations where someone is harmed as a result, but is acceptable otherwise.' & df3$Hrm_oth=="Yes, I am able to believe this"& df3$Hrm_rel=="Yes, I am able to believe this")
#   #df3$Roz_fully_C <- car::recode(df3$Roz_fully_C, "TRUE='true';FALSE='false';NA='missing'")
#   
#   
#   df3$cog_M_ch_bin <- to_num(df3$v_181)
#   df3$cog_M_ch_bin <- car::recode(df3$cog_M_ch_bin,"NA='missing';1='difficult';2='difficult';3='difficult';4='neutral';5='easy';6='easy';7='easy'")
#   
#   df3$cog_Rb <- as.vector(df3$v_180)
#   df3$cog_right_logic <- df3$cog_Rb=="9P8R2L7D                                                                                                                                                                                                                                                      "
#   df3$cog_right_logic
#   df3$cog_right <- car::recode(df3$cog_right_logic, "TRUE='right';FALSE='wrong';NA='missing'")
#   cog_fun <- function(x){
#     a <- strsplit(as.character(as.vector(df3$v_180)), "")[[x]]
#     sum(c('9','P','p','8','R','r','2','L','l','7','D','d') %in% a)
#   }
#   
#   
#   df3$cog_number_right <- suppressWarnings(as.numeric(lapply((1:length(df3$gender)),cog_fun)))
#   
#   #df3$cs_temp <- df3$InCS==df3$InCS[level=1]
#   
#   df3$j1 <- as.vector(car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   df3$j2 <- as.vector(car::recode(df3$InSWr1, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j3 <- as.vector(car::recode(df3$InSWr2, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j4 <- as.vector(car::recode(df3$InSWr3, "'Yes'='wrong';'No'='not wrong'"))
#   df3$j5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="not wrong", "It's wrong but I can't think of a reason."="wrong","It's wrong and I can provide a valid reason."="wrong")))
#   #df3$j5 <- as.vector(car::recode(df3$cs_temp, "'FALSE'='wrong';'TRUE'='not wrong'"))
#   df3$j6 <- as.vector(car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'='not wrong'; 'right'='not wrong'"))
#   
#   df3$ch1 <- df3$j1!=df3$j2
#   df3$ch2 <- df3$j2!=df3$j3
#   df3$ch3 <- df3$j3!=df3$j4
#   df3$ch4 <- df3$j4!=df3$j5
#   df3$ch5 <- df3$j5!=df3$j6
#   
#   df3$Rch1 <- df3$InAR1!=df3$InAR2
#   df3$Rch2 <- df3$InAR2!=df3$InAR3
#   
#   df3$Rs_changed <- (df3$Rch1+df3$Rch2)!=FALSE
#   df3$Rs_changed_tot <- df3$Rch1+df3$Rch2
#   
#   df3$changed <- (df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5)!=FALSE
#   df3$changed_tot <- df3$ch1+df3$ch2+df3$ch3+df3$ch4+df3$ch5
#   
#   df3$rs1 <- as.vector(rep("unstated", length=length(df3$gender)))
#   df3$rs2 <- as.vector(car::recode(df3$InAR1,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs3 <- as.vector(car::recode(df3$InAR2,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs4 <- as.vector(car::recode(df3$InAR3,"'Yes, I have a reason'='reason';'No, I have no reason'='no reason';'Unsure'='unstated'"))
#   df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
#   df3$rs6 <- as.vector(rep("unstated", length=length(df3$gender)))
#   
#   
#   df3$rs1_bin <- as.vector(car::recode(df3$InAR1,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs2_bin <- as.vector(car::recode(df3$InAR2,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   df3$rs3_bin <- as.vector(car::recode(df3$InAR3,'"Yes, I have a reason"="reason";"No, I have no reason"="no reason"; "Unsure"="no reason"'))
#   
#   df3$reason_always <- df3$rs1_bin=="reason"&df3$rs2_bin=="reason"&df3$rs3_bin=="reason"
#   
#   
#   df3$Dumb_response <- revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$critical_slide_wrong=="changed"),]$Dumb_response <- 
#     revalue(
#       df3$Dumb_response[
#         which(df3$critical_slide_wrong=="changed")],
#       c("It's wrong and I can provide a valid reason."="unsupported declarations"))
#   
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(Dumb_response = ifelse(is.na(Dumb_response),0,Dumb_response))
#   
#   #detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$Dumb_response)
#   df3$Dumb_response <- car::recode(df3$Dumb_response, "'0'='unsupported declaration';'2'='admission';'1'='nothing wrong';'3'='reasons'")
#   
#   df3$Dumb_response
#   
#   
#   df3$right_change <- df3$InCS# revalue(df3$InCS, c("It's wrong but I can't think of a reason."="admission"))
#   df3[which(df3$Ju1_bin=="right"),]$right_change <- 
#     suppressWarnings(revalue(df3[which(df3$Ju1_bin=="right"),]$right_change, c("There is nothing wrong."="right initially")))
#   #df3[which(df3$Ju1_bin=="right"),]  
#   require(dplyr)
#   df3 <- df3 %>%
#     mutate(right_change = ifelse(is.na(right_change),0,right_change))
#   
#   #detach("package:dplyr", unload=TRUE)
#   
#   cbind.data.frame(df3$InCS,df3$right_change)
#   df3$right_change <- car::recode(df3$right_change, "'0'='right initially';'2'='dumbfounded';'1'='nothing wrong';'3'='reasons'")
#   
#   
#   
#   
#   df3$wrong1b <- car::recode(df3$Ju1_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong1b
#   df3$wrong1b <- droplevels(as.factor(df3$wrong1b))
#   df3$wrong1b
#   
#   
#   df3$wrong2b <- car::recode(df3$Ju2_bin, "'wrong'='wrong'; 'neutral'=NA; 'right'='not wrong'")
#   df3$wrong2b
#   df3$wrong2b <- droplevels(as.factor(df3$wrong2b))
#   df3$wrong2b
#   
#   
#   df3
#   
# }
# 
# #file:///home/cillian/Dropbox/College/Thesis/Chapter_5/study5/cogload_control_4apr19.sav
# #file:///home/cillian/Dropbox/College/Thesis/Chapter_5/study5/cogload_exp_4apr19.sav
# 
# #setwd("study5")
# #df1 <- suppressWarnings(read.spss('study5/cogload_exp_4apr19.sav', to.data.frame = TRUE))
# #df2 <- suppressWarnings(read.spss('study5/cogload_control_4apr19.sav', to.data.frame = TRUE))
# 
# 
# df1a <- suppressWarnings(read.spss('../data/study5/cogload_exp_4apr19.sav', to.data.frame = TRUE))
# df2a <- suppressWarnings(read.spss('../data/study5/cogload_control_4apr19.sav', to.data.frame = TRUE))
# #setwd("..")
# study5 <- prep_data_study5(df1a,df2a)
# study_5 <- study5
# rm(df1a,df2a,prep_data_college)
# df3 <- study5
# 
# #df3$rs5 <- as.vector(revalue(df3$InCS, c("There is nothing wrong."="unstated", "It's wrong but I can't think of a reason."="no reason","It's wrong and I can provide a valid reason."="reason")))
# 
# df3$reason <-  as.vector(car::recode(df3$rs5,'"reason"="reason";"no reason"="no reason"; "unstated"="no reason"'))
# 
# df <- cbind.data.frame(df3$InCS,df3$NFC)
# colnames(df) <- c("InCS","NFC")
# # write.foreign(as.data.frame(df), "cog1.txt", "cog1.sps", package="SPSS")
# 
# 
# df4 <- df3[which(df3$condition=="cog_load"),]
# df5 <- df3[which(df3$condition=="control"),]
# 


#### load data set Study 6 ####



# read the data file
df_six <- read_csv("../data/study6/sample_data.csv")

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
study_6 <- x
study6 <- x



#### load combined data ####

# df_0 <- cbind.data.frame(college$condition,college$InCS,college$cog_number_right,college$NFC,college$reason_always,college$changed,college$gender, college$Ju1_bin, college$Ju2_bin,college$right_change,rep("study_1", length(study_1$gender)))
# colnames(df_0) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# 
# #,rep("study_1", length(study_1$gender))
# 
# df1 <- cbind.data.frame(one$condition,one$InCS,one$cog_load_CS_num,one$NFC,one$reason_always,one$changed,one$gender, one$Ju1_bin, one$Ju2_bin,one$right_change,rep("study_2", length(study_2$gender)))
# colnames(df1) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# df2 <- cbind.data.frame(two$condition,two$InCS,two$cog_load_CS_num,two$NFC,two$reason_always,two$changed,two$gender, two$Ju1_bin, two$Ju2_bin,two$right_change,rep("study_3", length(study_3$gender)))
# colnames(df2) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# 
# df3 <- three
# df3 <- df3[which(df3$engaged==T),]
# three <- df3
# 
# 
# df3 <- cbind.data.frame(three$condition,three$InCS,three$cog_load_CS_num,three$NFC,three$reason_always,three$changed,three$gender, three$Ju1_bin, three$Ju2_bin,three$right_change,rep("study_4", length(three$gender)))
# colnames(df3) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# 
# df5 <- cbind.data.frame(study5$condition,study5$InCS,study5$cog_number_right,study5$NFC,study5$reason_always,study5$changed,study5$gender, study5$Ju1_bin, study5$Ju2_bin,study5$right_change,rep("study_5", length(study_5$gender)))
# colnames(df5) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# 
# df6 <- cbind.data.frame(study6$condition,study6$InCS,rep(NA, length(study6$gender)),rep(NA, length(study6$gender)),rep(NA, length(study6$gender)),rep(NA, length(study6$gender)),rep(NA, length(study6$gender)),study6$gender, study6$Ju1_bin, study6$Ju2_bin,rep("study_6", length(study6$gender)))
# colnames(df6) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# 
# 
# two_three <- rbind.data.frame(df2,df3)
# one_two_three <- rbind.data.frame(df1,df2,df3)
# zero_one_two_three <- rbind.data.frame(df_0, df1,df2,df3)
# zero_one_two_three_five <- rbind.data.frame(df_0, df1,df2,df3,df5)
# zero_one_two_three_five_six <- rbind.data.frame(df_0, df1,df2,df3,df5,df6)
# 
# zero_two_three <- rbind.data.frame(df_0,df2,df3)
# 
# three_five <- rbind.data.frame(df3, df5)
# 
# table(three_five$InCS,three_five$condition)
# chisq.test(table(three_five$InCS,three_five$condition))
# 
# 
# one_two_three$changed <- car::recode(one_two_three$changed,"'TRUE'='changed';'FALSE'='not_changed'" )
# one_two_three$reason_always <- car::recode(one_two_three$reason_always,"'TRUE'='reason';'FALSE'='not_always_reason'" )
# 
# 
# zero_one_two_three$changed <- car::recode(zero_one_two_three$changed,"'TRUE'='changed';'FALSE'='not_changed'" )
# zero_one_two_three$reason_always <- car::recode(zero_one_two_three$reason_always,"'TRUE'='reason';'FALSE'='not_always_reason'" )
# 
# #no_right <- zero_one_two_three[which(zero_one_two_three$right_change!="right initially"|zero_one_two_three$InCS!="There is nothing wrong."),]
# 
# zero_one_two_three$right_right <- zero_one_two_three$InCS=="There is nothing wrong."&zero_one_two_three$right_change=="right initially"
# 
# #df3$right_right <- df3$InCS=="There is nothing wrong."&df3$right_change=="right initially"
# 
# no_right <- zero_one_two_three[which(zero_one_two_three$right_right==FALSE),]
# 
# zero_one_two_three$InCS=="There is nothing wrong."
# zero_one_two_three$right_change=="right initially"
# 
# tapply(zero_one_two_three$NFC,zero_one_two_three$right_change, descriptives)
# summary(aov(NFC~right_change,zero_one_two_three))
# TukeyHSD(aov(NFC~right_change,zero_one_two_three))
# 
# tapply(zero_one_two_three$NFC,zero_one_two_three$InCS, descriptives)
# summary(aov(NFC~InCS,zero_one_two_three))
# TukeyHSD(aov(NFC~InCS,zero_one_two_three))
# 
# 
# tapply(no_right$NFC,no_right$InCS, descriptives)
# summary(aov(NFC~InCS,no_right))
# TukeyHSD(aov(NFC~InCS,no_right))
# 
# 
# 
# tapply(zero_one_two_three_five$NFC,zero_one_two_three_five$InCS, descriptives)
# summary(aov(NFC~InCS, data=zero_one_two_three_five))
# TukeyHSD(aov(NFC~InCS,zero_one_two_three_five))
# 
# 
# # 
# # tapply(engaged0_2_3$NFC,engaged0_2_3$right_change, descriptives)
# # summary(aov(NFC~right_change,engaged0_2_3))
# # TukeyHSD(aov(NFC~right_change,engaged0_2_3))
# # 
# # # 
# # tapply(engaged0_2_3$NFC,engaged0_2_3$InCS, descriptives)
# # summary(aov(NFC~InCS,engaged0_2_3))
# # TukeyHSD(aov(NFC~InCS,engaged0_2_3))
# 
# tapply(no_right$NFC,no_right$right_change, descriptives)
# summary(aov(NFC~right_change,no_right))
# TukeyHSD(aov(NFC~right_change,no_right))
# 
# 
# tapply(no_right$NFC,no_right$InCS, descriptives)
# summary(aov(NFC~InCS,no_right))
# TukeyHSD(aov(NFC~InCS,no_right))
# 
# 
# table(two_three$condition)
# table(two_three$condition,two_three$InCS)
# chisq.test(table(two_three$condition,two_three$InCS))
# engaged2_3 <- two_three[which(two_three$cog_load_CS_num>6|two_three$condition=="control"),]
# table(engaged2_3$condition,engaged2_3$InCS)
# chisq.test(table(engaged2_3$condition,engaged2_3$InCS))
# table(engaged2_3$condition)
# 
# engaged2_3 <- two_three[which(two_three$cog_load_CS_num>7|two_three$condition=="control"),]
# engaged0_2_3 <- rbind.data.frame(engaged2_3,df_0)
# 
# table(engaged2_3$condition,engaged2_3$InCS)
# chisq.test(table(engaged2_3$condition,engaged2_3$InCS))
# table(engaged2_3$condition)
# 
# table(engaged0_2_3$condition,engaged0_2_3$InCS)
# chisq.test(table(engaged0_2_3$condition,engaged0_2_3$InCS))
# table(engaged0_2_3$condition)
# 
# engaged2_3a <- two_three[which(two_three$cog_load_CS_num>6|two_three$condition=="control"),]
# engaged2_3b <- two_three[which(two_three$cog_load_CS_num>7|two_three$condition=="control"),]
# engaged0_2_3a <- rbind.data.frame(engaged2_3a,df_0)
# engaged0_2_3b <- rbind.data.frame(engaged2_3b,df_0)
# one_e <- cbind.data.frame(one$engaged, one$InCS, one$cog_load_CS_num, one$NFC, one$reason_always, one$changed,one$gender, one$Ju1_bin, one$Ju2_bin,one$right_change,rep("study_2", length(study_2$gender)))
# colnames(one_e) <- c("condition","InCS","cog_load_CS_num","NFC","reason_always","changed","gender","Ju1_bin","Ju2_bin","right_change","study")
# one_e$condition <- car::recode(one_e$condition, "'engaged'='cog_load';'not engaged'='control'")
# eng_0123a <- rbind(engaged0_2_3a,one_e, df5)
# eng_0123b <- rbind(engaged0_2_3b,one_e, df5)
# 
# 
# table(eng_0123a$InCS,eng_0123a$condition)
# chisq.test(table(eng_0123a$InCS,eng_0123a$condition))
# 
# table(eng_0123b$InCS,eng_0123b$condition)
# chisq.test(table(eng_0123b$InCS,eng_0123b$condition))
# 
# # 
# save(study_1, college, file = "loaded_data/one.RData")
# write.csv(study_1, "csv_files/study_1.csv", row.names = FALSE)
# write.csv(college, "csv_files/college.csv", row.names = FALSE)
# 
# save(study_2, one, file = "loaded_data/two.RData")
# write.csv(study_2, "csv_files/study_2.csv", row.names = FALSE)
# write.csv(two, "csv_files/two.csv", row.names = FALSE)
# 
# save(study_3, two, file = "loaded_data/three.RData")
# write.csv(study_3, "csv_files/study_3.csv", row.names = FALSE)
# write.csv(three, "csv_files/three.csv", row.names = FALSE)
# 
# save(study_4, three, file = "loaded_data/four.RData")
# write.csv(study_4, "csv_files/study_4.csv", row.names = FALSE)
# write.csv(three, "csv_files/three.csv", row.names = FALSE)
# 
# save(study_5, study5, file = "loaded_data/five.RData")
# write.csv(study_5, "csv_files/study_5.csv", row.names = FALSE)
# write.csv(study5, "csv_files/study5.csv", row.names = FALSE)

save(study_6, study6, file = "loaded_data/six_US.RData")
write.csv(study_6, "csv_files/study_6_US.csv", row.names = FALSE)
write.csv(study6, "csv_files/study6_US.csv", row.names = FALSE)

# save(engaged0_2_3a,engaged0_2_3b,two_three,zero_two_three,zero_one_two_three,
#      zero_one_two_three_five,df5,eng_0123a,eng_0123b,zero_one_two_three_five_six, file = "loaded_data/combined.RData")
# write.csv(engaged0_2_3a, "csv_files/engaged0_2_3a.csv", row.names = FALSE)
# write.csv(engaged0_2_3b, "csv_files/engaged0_2_3b.csv", row.names = FALSE)
# write.csv(two_three, "csv_files/two_three.csv", row.names = FALSE)
# write.csv(zero_two_three, "csv_files/zero_two_three.csv", row.names = FALSE)
# write.csv(zero_one_two_three, "csv_files/zero_one_two_three.csv", row.names = FALSE)
# write.csv(zero_one_two_three_five, "csv_files/zero_one_two_three_five.csv", row.names = FALSE)
# write.csv(zero_one_two_three_five_six, "csv_files/zero_one_two_three_five_six.csv", row.names = FALSE)
# write.csv(df5, "csv_files/df5.csv", row.names = FALSE)
# write.csv(eng_0123a, "csv_files/eng_0123a.csv", row.names = FALSE)
# write.csv(eng_0123b, "csv_files/eng_0123b.csv", row.names = FALSE)

# save(seven,seven_tot, file = "loaded_data/seven.RData")
# save(eight,eight_tot, file = "loaded_data/eight.RData")
# save(onetoseven,onetoseven_tot, file = "loaded_data/onetoseven.RData")


# write.csv(df, "csv_files/sample_data.csv", row.names = FALSE)
# write.csv(df_raw, "sample_data_raw.csv", row.names = FALSE)


# rm(list = ls())
