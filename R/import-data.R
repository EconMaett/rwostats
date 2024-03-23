# import-data.R ----

# Read the data in the Google Sheet and save it to a file called `survey_data.rds`
library(tidyverse)
library(googlesheets4)

# The data is publicly available so we do not need to authenticate
gs4_deauth()

survey_data <- read_sheet(ss = "https://docs.google.com/spreadsheets/d/13kfPtyQP1xmL4Rn6rfJHgJcAblfH7pxS5RvdmGe6BHg/edit?usp=sharing")

survey_data |> 
  write_rds(file = "data/survey_data.rds")