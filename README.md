## Getting-Cleaning-Data-Project

## This is a Project for the Course 3 - Getting and Cleaning Data 
 
In this project, the two "testX.txt"  and "trainx.txt" file need to be combined vertically after cleaning them and putting them in a propoer order.
For this the column of both the file needs to be the same that is 561 column as described in the "feature.txt". 

## Preparing the Column names of the resultant file from "feature.txt"
Step 1: Read the file "feature.txt" by "read.delim" which will give you one column file that basically contains the Row No.  and Name of the Measurement
Step 2: Now we have to separate the column in two by "separate" function. 
step 3: Now remove the first Column and only second column will remain in the file.

## Accessment of "X_test.txt" and  Cleaning of "X_test.txt"
Step 1:  Reading the file with read.delim 
Step 2: It was found that ther is only one column and was found that each row contains the multiple data 
Step 3: Seperate the one big Column in to different Column with seratator as " " whihc gives some junk values  like  ""
Step 4: Convert the Junk data in NA by using "na_if"
Step 5: Now removing the NA values of NA from each rows
Step 6: Now the file we will recieve is of 561 Columns only without and NA and Junk values.

## Accessment of "X_train.txt" and  Cleaning of "X_train.txt"
Repeating the same steps as we have done for "X_test.txt" 
we will get a file of 561 column again

## Now Rbind both the file to create the single on which the analysis needs to be done and create the txt file without Rownames and Column names 




