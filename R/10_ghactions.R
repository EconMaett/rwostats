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

# Note that the directories have to be correctly specified.

# Note that the github actions job will take some time to run!


## How GitHub Actions Work -----

# GitHub Actions works through YAML files placed in the 
# `.github/workflows` directory.

# These YAML files contain a set of instructions that tell
# a virtual computer what to do.

# Be careful with spacing in YAML files.
# Each indentation should be done with two spaces (not tabs).


## Triggers Start GitHub Actions ----

# At the very top of the YAML file is the trigger.

# on:
#   push:
#     branches: main

# Whenever we push to the main branch, run this code.


# The next section is the "jobs" line.
# jobs:
#   import-data: // specifies the name of the job
#   runs-on: ubuntu-latest // specifies the operating system of the virtual machine
#   steps:
#     - name: Set up R
#       users: r-lib/actions/setup-r@v2 // Pre-existing GitHub action to install R

#     - name: Install packages
#       uses: r-lib/actions/setup-r-dependencies@v2 // Set up any dependencies for these packages
#       with:
#         packages: |
#           any::tidyverse
#           any::googlesheets4

#     - name: Check out repository
#         uses: actions/checkout@v3 // Check out this repository on the virtual machine

#     - name: Import data
#       run: Rscript -e "source("R/import-data.R") // Run the code in this R script.

#     - name: Commit results
#       run: |
#         git config --local user.email "matthias.spichiger@bluewin.ch"
#         git config -- local user.name "EconMaett"
#         git data/survey_data.rds
#         git commit -m "Data updated" || echo "No changes to commit"
#         git push origin || echo "No changes to commit" // Commit message and push to main branch or no changes

# Note: The job can take 20 minutes to run on GitHub actions.
# The first time you run the job will take the longest.

# It took about 15 minutes in this case.

# There should be a commit called "Data updated".

# Fill in the survey to add some more data.

# You can commit the file again on GitHub Desktop.
# Or manually in R Studio.

## Jobs Lay Out the Steps to Run When the Action is Triggered -----

# Change the GitHub-hosted runner from ubuntu-latest to
# windows-latest, since this is the operating system you tested your code on.

# Note that the imported data is saved on the virtual host and you need to
# push it to your repository.


## Running Code on a Schedule with Cron Jobs ----

# The GitHub Action is now run whenever we push the code to 
# the GitHub main branch.

# This is useful for testing, but we want the code to be run without
# any manual input.

# We change the trigger section to:
# on:
#   schedule:
#     - cron: "0 12 * * *" // Run the code every day at 12:00 pm in UTC time zone.


## Using GitHub Actions to Keep a Report Always Up to Date -----


## Conclusion -----

# END