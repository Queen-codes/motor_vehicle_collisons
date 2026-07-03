#### Preamble ####
# Purpose: Cleans the raw toronto motor collisions data downloaded from the open
#data portal.
# Author: Queen Islamiat
# Date: 03 July 2026
# Contact: fawalequeen97@gmail.com
# Pre-requisites: 
# - The `tidyverse`, `janitor`, `lubridate` packages must be installed and loaded
# - 02-download_data.R must have been run and data downloaded


#### Workspace setup ####
library(janitor)
library(lubridate)
library(tidyverse)


# use janitor to clean variable names - snakecase version
clean_data <-
  toronto_motor_collisons |>
  clean_names() 


# create new variables for better time analysis and renamed variables for ease
clean_data <- clean_data |>
  mutate(
    year = year(accdate),
    month = month(accdate),
    day =  wday(accdate, label = TRUE),
    hour = hour(accdate),
    minute = minute(accdate),
    ) |>
  rename(
    actual_date = accdate,
    primary_street = stname1,
    secondary_street = stname2,
    location_offset = stname3,
    num_people_involved = per_inv,
    collision_classification = acclass,
    actual_location = accloc,
    traffic_control = traffictl,
    impact_type = impactype,
    weather_condition = visible,
    light_condition = light,
    road_condition = rdsfcond,
    failed_to_remain = failtorem,
    vehicle_type = vehtype,
    initial_impact_direction = initdir,
    involved_persons_num = per_inv,
    injury_severity = injury,
    safety_equipment = safequip,
    driver_action = drivact,
    driver_condition = drivcond,
    pedestrian_condition = pedcond,
    pedestrian_collision_type = pedtype,
    cyclist_collision_type = cyclistype,
    ward_name = wardname,
    was_aggresive = aggressive,
    was_distracted = distracted
  )

# Check class of acc(actual)date variable
class(clean_data$actual_date)
class(toronto_motor_collisons$accdate)


# since actual date is a character, which led to lubridate not parsing hour
# and minute properly initially, i converted the variable using `ymd_hms` before 
# parsing. mutate overwrites the already created variables, since its the same name

clean_data <- clean_data |>
  mutate(
    actual_date = ymd_hms(actual_date),
    month = month(actual_date, label = TRUE),
    hour = hour(actual_date),
    minute = minute(actual_date)
  )


# move extracted date columns for ease/structure
clean_data <- clean_data |>
  relocate(year, month, day, hour, minute, .after = actual_date)


# check for duplicated values
any(duplicated(clean_data))

# check for missing values
any(is.na(clean_data))
