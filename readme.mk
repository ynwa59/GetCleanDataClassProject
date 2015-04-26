#========================================================================================
The purpose of this script is to merge the train and test data of the Human Activity Recognition Using Smartphones Dataset and extracts the measurements on the mean and standard deviation. It also creates a tidy data set with the average of each variable
for each activity and each subject.
#========================================================================================

The script takes the following files:
#==========================================
1/ X_train.txt - train data
2/ y_train.txt - activities of the train data
3/ subject_train.txt - subject ID of the train data
4/ X_test.txt - test data
5/ y_test.txt - activities of the test data
6/ subject_test.txt - subject ID of the test data

Execution order of the script
#==========================================
1/ read test data into table
2/ extract only mean and SD measurements
3/ extract subject and activity
4/ add subject and activity to test data
5/ bind two table (test and train) together
6/ sort by activity and then by subject
7/ add column names
8/ assign name to activity
9/ sort and calc ave
10/ create tidy data set

