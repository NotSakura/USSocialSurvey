#### Preamble ####
# Purpose: stimulate data
# Author: Sakura Noskor, Yan Mezhiborsky, Cristina Burca
# Date: 13 March 2023
# Contact: cristina.burca@mail.utoronto.ca, sakura.noskor@mail.utoronto.ca,  yan.mezhiborsky@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# [...ADD CODE HERE...]


# Load necessary libraries
library(dplyr)

election_2020 <- sample(c("Biden", "Trump"), 1000, replace = TRUE)

# Generate random birth years (between 1950 and 2002)
birth_years <- sample(1950:2002, 1000, replace = TRUE)

# Simulate presidential election of 2016
election_2016 <- sample(c("Clinton", "Trump", "Gary Johnson", "other"), 1000, replace = TRUE)

# Simulate gender (50% male, 50% female)
gender <- sample(c("Male", "Female"), 1000, replace = TRUE)

# Simulate immigration status (5 categories)
immigration_status <- sample(c("immigrant and citizen", "immigrant not citizen", "born in US, but parent(s) immigrant", "parent and I born in US but grandparent(s) immigrant", "all born in US"), 1000, replace = TRUE)

# Create the synthetic dataset
election_data <- data.frame(
  election_2020 = election_2020
  Birth_Year = birth_years,
  Election_2016 = election_2016,
  Gender = gender,
  Immigration_Status = immigration_status
)

# Print the first few rows of the dataset
head(election_data)



