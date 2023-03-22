rm(list = ls())
getwd()
#setwd("collabra_manuscript_prep")
load("loaded_data/six.RData")
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

x <- test1

sum(x$CS_cog_load_correct,na.rm=T)
sum(x$inju2_cog_load_correct,na.rm=T)

cog_load <- x[which(x$condition=="cog_load"),]
table(cog_load$CS_cog_load_correct,cog_load$InCS)
chisq.test(table(cog_load$CS_cog_load_correct,cog_load$InCS))

###

# practice
# video = num_scroll_test7.mp4
# looking for 8

# 6151 0
# > 6151 = 1
# > 1800 = 2


df3 <- cog_load

df3$condition <- df3$CS_cog_load_correct



ab_graph <- function(){
  a <- df3[which(df3$condition==levels(as.factor(df3$condition))[1]),]
  b <- df3[which(df3$condition==levels(as.factor(df3$condition))[2]),]
  a#levels(as.factor(df3$condition))[1]
  
  ay <- as.data.frame(table(a$InCS,as.character(a$condition)))
  by <- as.data.frame(table(b$InCS,as.character(b$condition)))
  
  aperc <- ay$Freq/length(a$gender)
  ay <- cbind(ay,aperc)
  colnames(ay) <- c("InCS","condition","Freq","perc")
  
  bperc <- by$Freq/length(b$gender)
  by <- cbind(by,bperc)
  colnames(by) <- c("InCS","condition","Freq","perc")
  
  c <- rbind(ay,by)
  
  c
}

test <- ab_graph()


# y <- table(df3$CS_cog_load_correct,df3$InCS)
# y <- as.data.frame(y)
# colnames(y) <- c("condition","InCS","Freq")
# 
# z <- as.data.frame(table(df3$CS_cog_load_correct,df3$InCS)/length(df3$gender)*2)
# perc <- z$Freq
# test <- cbind(y,perc)
# test$condition
# test


#y <- table(df3$condition,df3$Dumb_incl_string)
#y <- as.data.frame(y)
#colnames(y) <- c("condition","InCS","Freq")

# z <- as.data.frame(table(df3$condition,df3$Dumb_incl_string)/length(df3$gender)*2)
# perc <- z$Freq
# test <- cbind(y,perc)
# test$condition
# test



g <- 
  ggplot(test, aes(x=reorder(InCS), y=perc, fill=factor(condition
                                                         #,labels=c("Cognitive load","Control")
                                                         ))) +
  scale_y_continuous(#limits = c(-.03,1),
                     labels = percent_format()
  )+ 
  geom_col(position = "dodge",
           color="black",
           size=.2
  )+
  # geom_errorbar(aes(ymin=perc-se, ymax=perc+se), size=.2, width=.2,
  #               position=position_dodge(.9), color="black" #"#5a5a5a"
  # )+
  geom_text(#family = "Times",
    size=6.2,
    aes( label = scales::percent(perc, accuracy = 1),
         y= perc ),
    stat= "identity",
    vjust = -1.3,
    position = position_dodge(.9),
    fontface='plain'
  )+
  geom_text(#family = "Times", 
    size=6.2,
    aes(label = format(Freq),
        y= -2.7*(..count../100)/(..count..)),
    stat= "count",
    position = position_dodge(0.9),
    #vjust = -.05,
    fontface='plain'
  ) +
  xlab("Response to Critical Slide") +
  ylab("Percentage of participants selecting each response")+
  scale_x_discrete(labels=c("Reasons", "Dumbfounded","Nothing Wrong")) +
  scale_fill_grey(start = .5, end = .8) +
  labs(fill="Condition") +
  #theme_apa() +
  theme_bw() +
  theme(panel.border = element_blank(),
        axis.line = element_line(size = .2),
        strip.background  = element_blank(),
        panel.grid = element_blank(),
        plot.title=element_text(#family="Times",
          size=18
        ),
        legend.text=element_text(#family="Times",
          size=18
        ),
        legend.title=element_text(#family="Times",
          size=20
        ),
        axis.text=element_text(#family="Times",
          colour = "black",
          size=20
        ),
        axis.ticks.x = element_blank(),
        axis.title=element_text(#family="Times",
          size=24
        ),
        strip.text=element_text(#family = "Times",
          size = 40
        ),
        #strip.background = element_rect(fill = "white"),
        legend.position="right")

g

