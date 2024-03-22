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
head(survey_data)
colnames(survey_data)

survey_data |> 
  write_rds(file = "data/survey_data.rds")


## How GitHub Actions Work -----

# GitHub Actions works through YAML files placed in the 
# `.github/workflows` directory.

# These YAML files contain a set of instructions that tell
# a virtual computer what to do.

# An example might look something like:
# on:
#   push:
#     branches: main

# jobs:
#   import-data:
#     runs-on: ubunto-latest
#     steps:
#       - name: Set up R
#         uses: r-lib/actions/setup-r@v2

#       - name: Install packages
#         uses: r-lib/actions/setup-r-dependencies@v2
#         with:
#           packages: |
#             any::tidyverse
#             any::googlesheets4

#       - name: Check out repository
#         uses: actions/checkout@v3

#       - name: Import data
#         run: Rscript -e 'source("import-data.R")'

#       - name: Commit results
#         run: |
#          git config --local user.email "actions@github.com"
#          git config --local user.name "GitHub Actions"
#          git add survey_data.rds
#          git commit -m "Data updated" || echo "No changes to commit"
#          git push origin || echo "No changes to commit"

# Be careful with spacing in YAML files.
# Each indentation should be done with two spaces (not tabs).

## Triggers Start GitHub Actions ----


## Jobs Lay Out the Steps to Run When the Action is Triggered -----


## Running Code on a Schedule with Cron Jobs ----


## Using GitHub Actions to Keep a Report Always Up to Date -----


## Conclusion -----

# END