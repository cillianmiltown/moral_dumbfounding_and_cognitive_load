rm(list = ls())
library(tidyverse)

source("read_and_sort_raw_data.R")

# read the data file
df <- read_csv("sample_data.csv")

# check variable names
variable.names(df)

#View(df)

table(df$scenario,df$condition)


x <- df

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



x$cog_practice_trial_number
