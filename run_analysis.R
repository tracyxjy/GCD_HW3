# Getting and Cleaning Data Course Project 

# Objective:
# Create a tidy data set for the Human Activity Recognition Using Smartphonese Data Set, 
# built from the recordings of 30 subjects performing activities of daily living (ADL) 
# measured by a waist-mounted Samsung Galaxy S smart phone.

# A full description is available at the site where the data was obtained:
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data can be donwloaded from:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


#
# Preparation: download data file from website to your working folder and unzip,
# change working directory to its sub-folder where data are stored.
#

getwd()
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file<-download.file(fileUrl,"UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")

dir = "UCI HAR Dataset"
setwd(dir)



#
# 1. Merges the training and the test sets to create one data set 
#

# read in test data sets

test_subject<-read.table(paste(getwd(), "test", "subject_test.txt", sep="/"))   # Test subject
test_X<-read.table(paste(getwd(), "test", "X_test.txt", sep="/"))   # Test set
test_y<-read.table(paste(getwd(), "test", "y_test.txt", sep="/"))   # Test labels

test_dat <- cbind(test_subject,test_y,test_X)     # Combine


# read in training data sets

train_subject<-read.table(paste(getwd(), "train", "subject_train.txt", sep="/")) # Training subject
train_X<-read.table(paste(getwd(), "train", "X_train.txt", sep="/"))        # Training set
train_y<-read.table(paste(getwd(), "train", "y_train.txt", sep="/"))        # Training labels

train_dat<-cbind(train_subject,train_y,train_X)   # Combine


# merge the training and the test sets into one dataset

UCI_HAR_Dat1 = rbind(test_dat, train_dat)


# check subjects an activities
length(unique(UCI_HAR_Dat1[,1])) #Subject ranges from 1 to 30
length(unique(UCI_HAR_Dat1[,2])) #Activities ranges from 1 to 6


# add column names using "feature.txt" data
features = read.table(paste(getwd(), "features.txt", sep="/"))
col_names = c("Subject", "Activity", levels(features$V2))

names(UCI_HAR_Dat1) = col_names


#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
#


# Extract column numbers in the "col_names" with exactily "mean()"
col_mean<-grep("mean()",col_names,fixed=TRUE) 

# Extract column numbers in the "col_names" with exactly "std()"
col_std <-grep("std()",col_names, fixed=TRUE) 

# Get the columns contained interested variables
col_MeanStd = sort(c(col_mean, col_std))

# Get the subset of "UCI_HAR_Dat1" including only interested variables
UCI_HAR_Dat2<-UCI_HAR_Dat1[ ,c(1,2,col_MeanStd)]


#
# 3.Uses descriptive activity names to name the activities in the data set
#

activity_labels <- read.table(paste(getwd(), "activity_labels.txt", sep="/"))
names(activity_labels) = c("Activity", "Label")


UCI_HAR_Dat3 <- UCI_HAR_Dat2
UCI_HAR_Dat3$Activity <- factor(UCI_HAR_Dat3$Activity, 
                                levels=activity_labels$Activity, 
                                labels=activity_labels$Label)


#
# 4. Appropriately labels the data set with descriptive variable names
#


# Avoid using "-" or "()" in the variable names, change "-" to "_" and remove "()" 

UCI_HAR_Dat4 <- UCI_HAR_Dat3

names(UCI_HAR_Dat4) <- sub("-mean\\(\\)", "_mean", names(UCI_HAR_Dat4))
names(UCI_HAR_Dat4) <- sub("-std\\(\\)", "_std", names(UCI_HAR_Dat4))
names(UCI_HAR_Dat4) <- sub("-([A-Z])", "_\\1", names(UCI_HAR_Dat4))


# Output tidy data set
tidy_dat1 <- UCI_HAR_Dat4

# save as "UCI_HAR_Dat_Tidy1.txt"
write.table(tidy_dat1,"UCI_HAR_Dat_Tidy1.txt",
            sep="\t", row.names=FALSE)


#
# 5. Creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject
#

# Calculate the mean of each variable by subject and activity
tidy_dat2 <- aggregate(tidy_dat1[,3:ncol(tidy_dat1)],
                       by=list(subject=tidy_dat1$Subject,
                       activity=tidy_dat1$Activity),
                       FUN=mean)

# save as "UCI_HAR_Dat_Tidy2.txt"
write.table(tidy_dat2,"UCI_HAR_Dat_Tidy2.txt",
            sep="\t", row.names=FALSE)




### End ###

