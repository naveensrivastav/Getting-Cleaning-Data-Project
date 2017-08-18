## Getting-Cleaning-Data-Project

## This is a Project for the Course 3 - Getting and Cleaning Data 
Where we have to do the following : 
   1. Merges the training and the test sets to create one data set.
   2.Extracts only the measurements on the mean and standard deviation for each measurement.
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive variable names.
   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Approach to Solution 
 # Prerequisite : Read all the required data sets 
 Test Data( Subject, Activity, and measurements) ,Train(Subject, Activity, and measurements), Feature, Activity Labels and Levels
 
  
 Question 1 : Merges the training and the test sets to create one data set.
 Answer: Read Test and Train data through read.table function and join them by "rbnind" to get test_train data set.
 
Question 2 & 3: Extracts only the measurements on the mean and standard deviation for each measurement.
Answer: Use "grep" commond on "colnames(test_train) for "mean | std ".
Select those column from test_train only with column number = to the indices recieved above through "grep".

Question 4: Appropriately labels the data set with descriptive variable names.
Answer: Use Factor to label the activity from the activity data set and "cbind". Subject , Activity  and test_train to get tidy_data

Question 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Answer: Reshape the "tidy_data" by grouping the data by "Subject" and then by "Activity" and apply "summarise_all command along with "mean " function to get the final_dity



Write the "final_tidy" to txt file as "final_tidy.txt"
