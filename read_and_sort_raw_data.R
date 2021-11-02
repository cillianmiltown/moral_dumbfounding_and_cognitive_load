rm(list = ls())
library(tidyverse)

#df_raw <- read_csv("../data/moral-judgements-20-oct-2021.csv")
df_raw <- read_csv("../data/moral-judgements-1-nov-2021.csv")

df_raw$condition <- df_raw$test_condition
df <- df_raw
loop_sort <- function(y){
  x <- df[which(df$run_id == levels(as.factor(df$run_id))[y]),]
  x[dim(x)[1],]
}

runs_vector <- as.vector(as.character(levels(as.factor(df$run_id))))
runs_vector[length(runs_vector)]

df <- do.call("rbind", lapply(1:runs_vector[length(runs_vector)], loop_sort))
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

write.csv(df, "sample_data.csv", row.names = FALSE)
write.csv(df_raw, "sample_data_raw.csv", row.names = FALSE)
