rm(list = ls())
getwd()
#setwd("collabra_manuscript_prep")
load("../loaded_data/six.RData")
study_6$age <- as.numeric(study_6$age)
df3 <- study_6
x <- study_6_clean

x$cog_load_CS_num

x$CS_rt
x$CS_trial_number
x$cog_load_response0


t.test(x$CS_rt~x$condition)

x$cog_load_CS_num
x$cog_load_response0


# watching video num_scroll_test_10.mp4
# counting the number 3
# response variable = cog_load_response0

# 3  seconds = 1
# 4  seconds = 2
# 12 seconds = 3

x$CS_rt <- as.numeric(as.character(x$CS_rt))

x$CS_rt <= 3100  # 1
x$CS_rt <= 3650  # 2
x$CS_rt <= 12651 # 3

zero <- x[which(x$CS_rt <= 3100),]
one <- x[which(x$CS_rt > 3100 & x$CS_rt <= 3650),]
two <- x[which(x$CS_rt > 3650 & x$CS_rt <= 12651),]
three <- x[which(x$CS_rt>12651),]

zero$CS_cog_load_correct <- zero$cog_load_response0==0
one$CS_cog_load_correct <- one$cog_load_response0==1
two$CS_cog_load_correct <- two$cog_load_response0==2
three$CS_cog_load_correct <- three$cog_load_response0==3

test <- rbind(zero,one,two,three)

x <- test

sum(x$CS_rt <= 3100)
sum(x$CS_rt > 3100 & x$CS_rt <= 3650)
sum(x$CS_rt > 3650 & x$CS_rt <= 12651)


x$cog_load_response5

# 9 10 7
# inju cs inju2
# 

x$cog_load_response8

# revised judgment
# watching the video num_scroll_test_7
# response variable = cog_load_response5
# counting the number 5

# 0  seconds 1
# 3  seconds 2 3000
# 8  seconds 3 8150
# 8  seconds 4 8401
# 15 seconds 5 15400
# 15 seconds 6 15901


x$InJu2_rt <- as.numeric(as.character(x$InJu2_rt))
sum(x$InJu2_rt <= 8150)
sum(x$InJu2_rt > 15901)


one   <-  x[which(x$InJu2_rt <= 3000),]
two   <-  x[which(x$InJu2_rt > 3000  & x$InJu2_rt <= 8150),]
three <-  x[which(x$InJu2_rt > 8150  & x$InJu2_rt <= 8401),]
four  <-  x[which(x$InJu2_rt > 8401  & x$InJu2_rt <= 15400),]
five  <-  x[which(x$InJu2_rt > 15400 & x$InJu2_rt <= 15901),]
six   <-  x[which(x$InJu2_rt > 15901),]

one$inju2_cog_load_correct   <- one$cog_load_response5==1
two$inju2_cog_load_correct   <- two$cog_load_response5==2
three$inju2_cog_load_correct <- three$cog_load_response5==3
four$inju2_cog_load_correct   <- four$cog_load_response5==4
five$inju2_cog_load_correct   <- five$cog_load_response5==5
six$inju2_cog_load_correct   <- six$cog_load_response5==6

test1 <- rbind(one,two,three,four,five,six)

study6_with_cog_load_performance <- test1


save(study6_with_cog_load_performance, file = "../loaded_data/study6_with_cog_load_performance.RData")