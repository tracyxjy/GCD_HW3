

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
data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip file to the work directory.

Step1: merges the training and the test sets to create one data set.
•Use cbind() to combine subject data, activity data (y), and measurement data (X) from both the test datasets and training datasets. 
•Use rbind() to combine test data and training data. 
•add feature name from "feature.txt" file

Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
•use grep() function to select the colunms that only contains mean() and std(). Note: the meanFreq() is not included in my list.

Step3: Uses descriptive activity names to name the activities in the data set.
•the labels for the six activities can be found from "activity_labels.txt". The "_" between words in label column was removed.

Step4: Appropriately labels the data set with descriptive variable names. 
•the column names should not include "-" or "()", because R interprets the "-" as an operator, "()" as a function call. Therefore, change the dash "-" to underline "_" and remove the "()" in the variable names.
•this could be done by sub() function.

Step5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
•use aggregate() to get the average of the 66 variables by subjects and activities. The second tidy data contains 180 rows (= 30 subjects * 6 activities) and 68 columns (="Subject" + "Activity" + 66 summary variables). 
