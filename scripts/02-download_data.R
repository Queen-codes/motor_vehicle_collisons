#### Preamble ####
# Purpose: Downloads and saves the data from the City of Toronto Open Data Portal
# Link: "https://open.toronto.ca/dataset/motor-vehicle-collisions-involving-killed-or-seriously-injured-persons/"
# Author: Queen Islamiat
# Date: 03 July 2026
# Contact: fawalequeen97@gmail.com
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed and loaded

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
toronto_motor_collisons <-
  #get the package as instructed in the `r` section of the data on the data portal
  list_package_resources("73a8e475-9683-42e1-ac06-b8690dcba062") |>
  # filter to get the data
  filter(row_number()==1) |>
  get_resource()



#### Save data ####
write_csv(toronto_motor_collisons, "data/01-raw_data/toronto_motor_collisions.csv") 


