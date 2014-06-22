

Getting and Cleaning Data - Course Project
===========================================

Objective:
-------------
Learn to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data is about a study of the Human Activity Recognition Using Smartphone. It is built from the recordings of 30 subjects performing activities of daily living (ADL) measured by a waist-mounted Samsung Galaxy S smart phone. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data can be donwloaded from:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



How to use the "run_analysis.R"
--------------------------------

The program contains the following steps

0. Download data file from website
1. Merges the training and the test sets to create one data set 
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names, and output as "UCI_HAR_Dat_Tidy1.txt"
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject, and output as "UCI_HAR_Dat_Tidy2.txt"

The program will download data file from website and unzip it to a subfolder "UCI HAR Dataset" under your current working     folder. If you have done so, please change your working folder to where it contains the unzipped data files and run start from Step 1.


How to use the "CodeBook.md"
------------------------------

"CodeBook.md" provides details on the description of the variables, the data, and how did I clean the datasets.
