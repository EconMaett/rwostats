# How to Use GitHub Actions with R to Run Code Automatically -----
# Blogpost: https://rfortherestofus.com/2023/05/github-actions
# YouTube: https://www.youtube.com/watch?v=u-TcADhWosA

## What are GitHub Actions? ----

# Survey: https://docs.google.com/forms/d/e/1FAIpQLSfNMvqFTzHJtu0G7EWhdvHTJ6nFFlG_B3DZAi0ehishWQyThw/viewform
# Google Sheet: https://docs.google.com/spreadsheets/d/13kfPtyQP1xmL4Rn6rfJHgJcAblfH7pxS5RvdmGe6BHg/edit#gid=564559734
# `{googlesheets4}` R package: https://googlesheets4.tidyverse.org/

# Read the data in the Google Sheet and save it to a file called `survey_data.rds`
library(tidyverse)
library(googlesheets4)

# The data is publicly available so we do not need to authenticate
gs4_deauth()

survey_data <- read_sheet(ss = "https://docs.google.com/spreadsheets/d/13kfPtyQP1xmL4Rn6rfJHgJcAblfH7pxS5RvdmGe6BHg/edit?usp=sharing")

survey_data |> 
  write_rds(file = "data/survey_data.rds")

# Create a new folder called ".github"
# dir.create(".github")

# Inside that folder, create a new folder called "workflows"
# dir.create(".github/workflows")

# Create a new text file and save it as "import-data.yaml"
# inside of the "workflows" folder.

# Publish these files on GitHub.

# On the GitHub repository, click on the "Actions" tab,
# where you should see "on: push".

# Note that you need to have a file "R/import-data.R"



## How GitHub Actions Work -----

# GitHub Actions works through YAML files placed in the 
# `.github/workflows` directory.

# These YAML files contain a set of instructions that tell
# a virtual computer what to do.


# Be careful with spacing in YAML files.
# Each indentation should be done with two spaces (not tabs).

## Triggers Start GitHub Actions ----


## Jobs Lay Out the Steps to Run When the Action is Triggered -----


## Running Code on a Schedule with Cron Jobs ----


## Using GitHub Actions to Keep a Report Always Up to Date -----


## Conclusion -----

# END