rm(list = ls())
library(tidyverse)

#df_raw <- read_csv("../data/moral-judgements-20-oct-2021.csv")
df_raw <- read_csv("../data/study6/moral-judgements-9-nov-2021.csv")

df_raw <- df_raw[which(is.na(as.numeric(df_raw$run_id))==FALSE),]


df_raw$condition <- df_raw$test_condition
df <- df_raw


# loop_sort <- function(y){
#   x <- df[which(df$run_id == levels(as.factor(df$run_id))[y]),]
#   x[dim(x)[1],]
# }

# runs_vector <- as.vector(as.character(levels(as.factor(df$run_id))))
# runs_vector[length(runs_vector)]

loop_sort <- function(y){
  x <- df[which(df$PROLIFIC_PID == levels(as.factor(df$PROLIFIC_PID))[y]),]
  x[dim(x)[1],]
}

prolific_vector <- as.vector(as.character(levels(as.factor(df$PROLIFIC_PID))))
prolific_vector[length(prolific_vector)]

df <- do.call("rbind", lapply(1:length(prolific_vector), loop_sort))
variable.names(df)


df <- df %>% select(
  -recorded_at
  ,-ip
  ,-user_agent
  ,-device
  ,-browser
  ,-browser_version
  ,-platform
  ,-platform_version
  ,-source_code_version)


df_raw_anon <- df_raw %>% select(
  -recorded_at
  ,-ip
  ,-user_agent
  ,-device
  ,-browser
  ,-browser_version
  ,-platform
  ,-platform_version
  ,-source_code_version)

write.csv(df, "../data/study6/sample_data.csv", row.names = FALSE)
write.csv(df_raw, "../data/study6/sample_data_raw.csv", row.names = FALSE)
