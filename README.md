# Getting and Cleaning Data

## Course Project 1

This folder contains R script for generating a tidy data-set from collection of "
Human Activity Recognition Using Smartphones Data Set". 

* The dataset can be downloaded from: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">link</a>.

* <b>run_analysis.R</b> script should be located in the extracted dataset folder in order to process raw data. 

## How the script works


1. Read features, and, activity names. 
2. Read train and test data, merge them.
3.  Use loaded feature names as columns lables.
4. Select only measurements on the mean and standard deviation and assign them to a new variable called <b>cleanData</b>.
5. Read activity labels from <b>train/y_train.txt</b>, and <b>test/y_test.txt</b>, merge, and finally replace them by descriptive activity names.
6. Read train and test subjects.
7. Insert subjects, and, activity names as new columns to the cleanData.
8. Use descriptive variable names insted of abbreviations for the column names as: 
    * f -> frequency
    * t -> time
    * Acc -> Accelerometer
    * Gyro -> Gyroscope
    * Mag -> Magnitude 

9. Write processed tidy data to a text file.
10. Using <b>plyr</b> library, calculate mean of each column with respect to activity for each subject, and arrange them with respect to the subjects.
11. Write processed tidy data to a text file.
