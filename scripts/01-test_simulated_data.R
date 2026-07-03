#### Preamble ####
# Purpose: Tests the structure and validity of the simulated collsions dataset.
# Author: Queen Islamiat
# Date: 03 July 2026
# Contact: fawalequeen97@gmail.com
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - 00-simulate_data.R must have been run


#### Workspace setup ####
library(tidyverse)

collisions_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("collisions_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 11 rows:from 2016 to 2026
if (nrow(collisions_data) == 11) {
  message("Test Passed: The dataset has 11 rows.")
} else {
  stop("Test Failed: The dataset does not have 11 rows.")
}

# Check if the dataset has 2 columns: year and total number of collisions
if (ncol(collisions_data) == 2) {
  message("Test Passed: The dataset has 2 columns.")
} else {
  stop("Test Failed: The dataset does not have 2 columns.")
}

# Check if all values in the 'year' column are unique: no same year appearing twice
if (n_distinct(collisions_data$year) == nrow(collisions_data)) {
  message("Test Passed: All values in 'year' are unique.")
} else {
  stop("Test Failed: The 'year' column contains duplicate values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(collisions_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'division', 'state', and 'party' columns
if (all(collisions_data$year != "" & collisions_data$collisions != "")) {
  message("Test Passed: There are no empty strings in 'year', or 'collisions'.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}
