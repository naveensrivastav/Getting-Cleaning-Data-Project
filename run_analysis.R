run_analysis <- function()
{
  library(dplyr)
  library(data.table)
## Assuming the data is available in Document/CP3 Folder  
  ##Setting the working directory to the folder which contains all the data folders
     if(getwd() != "C:/Users/Admin/Documents/CP3")
      setwd("CP3")

  ## Reading the files of TEST elements 
  testx<- read.table("test/X_test.txt")
  testy<-read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")
  
  ## Reading the files of Train elements 
  trainx<- read.table("train/X_train.txt")
  trainy<-read.table("train/y_train.txt")
  subject_train <- read.table("train/subject_train.txt")
  
  ## Readiing Feature and Activity 
  feature <- read.table("features.txt")
  feature$V2 <- as.character(feature$V2)
  act_labels <- read.table("activity_labels.txt")
  
  ## Question 1 : Merges the training and the test sets to create one data set.
  
  test_train <-rbind(trainx, testx)
  activity <- rbind(trainy, testy)
  subject <- rbind(subject_train, subject_test )
  colnames(test_train) <- feature$V2

  ## Remove the variable which are no longer required
  remove(testx, testy, trainx, trainy,subject_train, subject_test )
  
  ## Question 2 : Extracts only the measurements on the mean and standard deviation for each measurement.
  
  meanindices <- grep("\\bmean()\\b", colnames(test_train))
  stdindices  <-grep("\\bstd()\\b", colnames(test_train))
  indices     <- sort(unique(c(meanindices, stdindices)))
  tidy_data <- test_train[,indices]
  
  ## Question 3 : Uses descriptive activity names to name the activities in the data set
  activity<- factor(activity$V1,levels =  act_labels$V1, labels = act_labels$V2)
  tidy_data <- data.table(subject, activity, tidy_data)
  
  ## Question 4: Appropriately labels the data set with descriptive variable names.
  colnames(tidy_data) <- c("Subject", "Activity", feature[indices,2]) 


  ## Question 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  final_tidy <-tidy_data %>% group_by(`Subject`,Activity) %>% summarize_all(mean)
  
write.csv(final_tidy , "final_tidy.txt", rownames=FALSE)    
}
