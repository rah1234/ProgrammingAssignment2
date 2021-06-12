## Project Preparing a tidy data set

The R script is prepared as part of class project "Getting and Cleaning Data Course Project" provided by John Hopkins University through coursera.

The script "run_analysis.R" analyses the data set provided in the link "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones " and prepares a tidy data set covering the below points

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script downloads the dataset "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and prepares a tidy data set "finaloutput.csv".