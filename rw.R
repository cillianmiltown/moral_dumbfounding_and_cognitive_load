
# practice = test9
# video1 = test8 = initial_judgement_1_manip
# video2 = test9 = revised_judgement_1_manip
# video3 = test10 = critical_slide_1_manip
# video4 = test7

# initial judgement 1 manip = video1



x <- df_raw_anon

cog_load <- x[which(x$condition=="cog_load"),]
control <- x[which(x$condition=="control"),]


x <- cog_load
x <- x[which(grepl('num_scroll_test8.mp4', x$stimulus) & grepl('1 = Morally Wrong', x$stimulus)),]
x <- x[which(x$rt!="null"),]
cbind.data.frame(x$InJu1_rt, x$rt)
x$InJu1_rt <- x$rt

x <- cog_load
x <- x[which(grepl('num_scroll_test9.mp4', x$stimulus) & grepl('1 = Morally Wrong', x$stimulus)),]
x <- x[which(x$rt!="null"),]
cbind.data.frame(x$InJu2_rt, x$rt)
x$InJu1_rt <- x$rt

x <- cog_load
x <- x[which(grepl('num_scroll_test10.mp4', x$stimulus) ),]
x <- x[which(x$rt!="null"),]
cbind.data.frame(x$CS_rt, x$rt)
x$InJu1_rt <- x$rt

test <- left_join(cog_load,x %>% select(InJu1_rt, run_id), by = "run_id")



x <- x[which(grepl('num_scroll_test9.mp4', x$stimulus) & grepl('1 = Morally Wrong', x$stimulus)),]
x$condition

x$rt[which(grepl('num_scroll_test9.mp4', x$stimulus) & grepl('1 = Morally Wrong', x$stimulus))]

grepl('num_scroll_test9.mp4', x$stimulus) & grepl('1 = Morally Wrong', x$stimulus)





