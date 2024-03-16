#### Preamble ####
# Purpose: download the data
# Author: Sakura Noskor, Yan Mezhiborsky, Cristina Burca
# Date: 16 March 2023
# Contact: cristina.burca@mail.utoronto.ca, sakura.noskor@mail.utoronto.ca,  yan.mezhiborsky@mail.utoronto.ca


#### Workspace setup ####
library(dataverse)
library(tidyverse)

ces2020 <-
  get_dataframe_by_name(
    filename = "CES20_Common_OUTPUT_vv.csv",
    dataset = "10.7910/DVN/E9N6PH",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, CC20_410, immstat, gender, birthyr, presvote16post)

write_csv(ces2020, "data/raw_data/ces2020.csv")

         
