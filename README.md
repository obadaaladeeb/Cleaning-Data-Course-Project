# Getting and Cleaning Data - Course Project

## Overview
This repository contains the R script and supporting files for the Coursera "Getting and Cleaning Data" course project. The goal of this project is to demonstrate the ability to collect, clean, and prepare a tidy dataset that can be used for further analysis.

The data for this project comes from the accelerometers of the Samsung Galaxy S smartphone, collected for the "Human Activity Recognition Using Smartphones" project.

## Dataset
The data linked to from the course website represent data collected from the accelerometers of the Samsung Galaxy S smartphone. A full description of the dataset can be found at the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The dataset can be downloaded from the following link:
- [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files in the Repository
- `run_analysis.R`: This R script performs the data analysis required for the project.
- `CodeBook.md`: A codebook that describes the variables, the data, and the transformations applied during the analysis.
- `README.md`: This file, explaining the project and repository structure.

## Instructions for Running the Script
1. **Prerequisites**: Ensure you have the `dplyr` package installed in R. You can install it using the following command:
   ```R
   install.packages("dplyr")

   # test
