#### Preamble ####
# Purpose: clean the data
# Author: Sakura Noskor, Yan Mezhiborsky, Cristina Burca
# Date: 13 March 2023
# Contact: cristina.burca@mail.utoronto.ca, sakura.noskor@mail.utoronto.ca,  yan.mezhiborsky@mail.utoronto.ca
#### Workspace setup ####
library(tidyverse)

#### Clean data ####
ces2020 <-
  read_csv(
    "data/raw_data/ces2020.csv",
    col_types =
      cols(
        "votereg" = col_integer(),
        "CC20_410" = col_integer(),
        "immstat" = col_integer(), 
        "gender" = col_integer(), 
        "birthyr" = col_integer(),  
        "presvote16post" = col_integer(), 
      )
  )



ces2020 <-
  ces2020 |>
  filter(votereg == 1,
         CC20_410 %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(CC20_410 == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    gender = if_else(gender == 1, "Male", "Female"),
    immstat = case_when(
      immstat == 1 ~ "immigrant and citizen",
      immstat == 2 ~ "immigrant not citizen",
      immstat == 3 ~ "born in US, but parent(s) immigrant",
      immstat == 4 ~ "parent and I born in US but grandparent(s) immigrant",
      immstat == 5 ~ "all born in US",
    ),
    immstat = factor(immstat, levels = c( "immigrant and citizen","immigrant not citizen", "born in US, but parent(s) immigrant",     "parent and I born in US but grandparent(s) immigrant", "all born in US")
    ),
    presvote16post = case_when(
      presvote16post == 1 ~ "Donald Trump",
      presvote16post == 2 ~ "Hillary Clinton",
      presvote16post == 3 ~ "Gary Johnson",
      presvote16post == 4 ~ "Jill Stein",
      presvote16post == 5 ~ "Evan McMullin",
      presvote16post == 6 ~ "Other", 
      presvote16post == 7 ~ "Did not vote"
    ),
    presvote16post = factor(presvote16post, levels = c(
      "Hillary Clinton","Donald Trump","Gary Johnson", "Jill Stein", "Evan McMullin", "Other", "Did not vote")
    )
  ) |>
  select(voted_for, votereg, immstat, gender, birthyr, presvote16post)

write_csv(ces2020, "data/analysis_data/ces2020_cleaned.csv")
