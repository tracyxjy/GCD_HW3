

Code Book for this project
===========================


Data Description
----------------
(Reference Url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)                       
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



Variable Description
--------------------
The tidy data includes in total of 69 variables:

1. "Data_Des": describe data source from the test data (as "test") or the training data (as "train")
2. "Subject": number 1-30 identifying the volunteers performing the experiment
3. "Activity": one of 6 physical activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. 
4. The rest of 66 variables follow name convention as:

    * begin with:
         - 't', Time Domain signals 
         - 'f', Frequency Domain signals 
    * follow with:
         - 'Body', body signals
         - 'Gravity', gravity signals
    * follow with:
         - 'Acc', accelerometer signals 
         - 'Gyro', gyroscope signals 
    * follow with:
         - '', none
         - 'Jerk', Jerk signals 
    * follow with:
         - '', none
         - 'Mag', the magnitude of signals using the Euclidean norm
    * follow with:
         - '', none
         - '-XYZ', denote 3-axial signals in the X, Y and Z directions
    * follow with:
         - '_mean', the mean value of the signal
         - '_std', the standard deviation of the signal

The complete list of variables of each feature vector is available in 'features.txt'



Clean data steps:
-----------------
1. Download data from the web (url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip file to the work directory.

2. Merges the training and the test sets to create one data set.
   * Read in text data files 'subject_test.txt','X_test.txt', and 'y_test.txt' into data tables
   * Create a data description to notify it is from test data set or training data set
   * Use cbind() to combine data_des, subject, activity (y), and measurement data (X) from both the test and training data
   * Use rbind() to combine test data and training data
   * Add column name from "feature.txt" file

3. Extracts only the measurements on the mean and standard deviation for each measurement. 
   * Use grep() function to select the colunms that only contains mean() and std(). 

4. Uses descriptive activity names to name the activities in the data set.
   * The labels for the six activities can be found from "activity_labels.txt". 

5. Appropriately labels the data set with descriptive variable names. 
   * Use sub() to change the dash "-" to underline "_" and remove the "()" in the variable names.

6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Use aggregate() to get the average of the 66 variables by subjects and activities. 
