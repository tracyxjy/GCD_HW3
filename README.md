

Getting and Cleaning Data - Course Project
===========================================

Objective
-------------
Learn how to collect data from web, clean data into a tidy data that can be used for later analysis. 

The data is about a study of the Human Activity Recognition Using Smartphone. The data collected from a waist-mounted Samsung Galaxy S smartphone, recording 30 subjects performing activities of participants' daily living.

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data can be donwloaded from:                                             
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



How to use "run_analysis.R"
--------------------------------

The program contains the following steps

1. Download data file from website
2. Merges the training and the test sets to create one data set 
3. Extracts only the measurements on the mean and standard deviation for each measurement
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names, and output as "UCI_HAR_Dat_Tidy1.txt"
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject, and output as "UCI_HAR_Dat_Tidy2.txt"

The program will download data file from website and unzip it to a subfolder "UCI HAR Dataset" under your current working     folder. If you have done so, please change your working folder to where it contains the unzipped data files and run start from Step 2.


<b>"CodeBook.md"</b> provides details on the description of the variables, the data, and what functions to use in cleaning the datasets.

<b>"variables.txt"</b> provides all the variables in the "UCI_HAR_Dat_Tidy1.txt". "UCI_HAR_Dat_Tidy2.txt" has the same except the first variable.
