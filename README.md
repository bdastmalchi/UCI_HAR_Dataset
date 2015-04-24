# Getting and Cleaning Data

## Course Project 1

This folder contains R script for generating a tidy data-set from collection of "
Human Activity Recognition Using Smartphones Data Set". 

* The dataset can be downloaded from: href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

* <b>run_analysis.R</b> script should be located in the extracted dataset folder in order to process raw data. 

## How the script works

<ol>
<li> Read features, and, activity names. </li>
<li> Read train and test data, merge them. </li>
<li>  Use loaded feature names as columns lables. </li>
<li> Select only measurements on the mean and standard deviation and assign them to a new variable called <b>cleanData</b>. </li>
<li> Read activity labels from <b>train/y_train.txt</b>, and <b>test/y_test.txt</b>, merge, and finally replace them by descriptive activity names. </li>
<li> Read train and test subjects. </li>
<li> Insert subjects, and, activity names as new columns to the cleanData. </li>
<li> Use descriptive variable names insted of abbreviations for the column names as: 
* f -> frequency
* t -> time
* Acc -> Accelerometer
* Gyro -> Gyroscope
* Mag -> Magnitude 
</li>
<li> Write processed tidy data to a text file. </li>
<li> Using <b>plyr</b> library, calculate mean of each column with respect to activity for each subject, and arrange them with respect to the subjects. </li>
<li> Write processed tidy data to a text file. </li>
</ol>