#### Preamble ####
# Purpose: model the data
# Author: Sakura Noskor, Yan Mezhiborsky, Cristina Burca
# Date: 13 March 2023
# Contact: cristina.burca@mail.utoronto.ca, sakura.noskor@mail.utoronto.ca,  yan.mezhiborsky@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/ces2020.csv")

### Model data ####
set.seed(302)

ces2020_reduced <- 
  ces2020_votes |> 
  slice_sample(n = 1000)

political_preferences <-
  stan_glm(
    voted_for ~ gender + immstat,
    data = ces2020_reduced,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 302
  )

saveRDS(
  political_preferences,
  file = "models/political_preferences.rds"
)
