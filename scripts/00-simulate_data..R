#### Preamble ####
# Purpose: Simulates a dataset of the number of toronto's motor vehicle collsions
#involving killed and/or sseriously injured people from 2016 to 2026.
# Author: Queen Islamiat
# Date: 03 July 2026
# Contact: fawalequeen97@gmail.com
# Pre-requisites: The `tidyverse` package must be installed

#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####
collisions_data <-
   tibble(
     "year" = 2016:2026,
     "collisions" =  sample(
       x = c(20:200),
       size = length(year),
       replace = TRUE
     )
   )


#### Save data ####
write_csv(collisions_data, "data/00-simulated_data/simulated_data.csv")
