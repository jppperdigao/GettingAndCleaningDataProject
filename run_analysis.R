####################################################################################################
##
## Getting and Cleaning Data Course Project
##
## Joao Perdigao
##
## 04-10-2016
##
####################################################################################################

###### Libraries
library(plyr)
library(data.table)
library(reshape2)
library(dplyr)


###### Load all files
zipfile <- "Dataset.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, zipfile)
unzip(zipfile)

features <- read.table('./UCI HAR Dataset/features.txt',header=FALSE)
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE) 

subject_Train <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
x_Train <- read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE) 
y_Train <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)

subject_Test <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
x_Test <- read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE) 
y_Test <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)


###### 1- Merges the training and the test sets to create one data set

x_DataSet <- rbind(x_Train, x_Test)

#View(x_Train) #7352
#View(x_Test) #2947
#View(x_DataSet) #10299

y_DataSet <- rbind(y_Train, y_Test)
subject_DataSet <- rbind(subject_Train, subject_Test)


###### 2- Extracts only the measurements on the mean and standard deviation for each measurement.

#View(features)
mean_and_std <- grep("mean\\(\\)|std\\(\\)", features[, 2]) #get all rownum where the string std or mean exists
x_DataSet1 <- x_DataSet[, mean_and_std] # Only gonna have the columns selected
#names(x_DataSet1)
names(x_DataSet1) <- features[mean_and_std, 2] # assign column names


###### 3- Uses descriptive activity names to name the activities in the data set

#View(y_DataSet)
#View(activity_labels)
y_DataSet[, 1] <- activity_labels[y_DataSet[, 1], 2]
#View(y_DataSet)
names(y_DataSet) <- "activity"
y_DataSet1 <- y_DataSet
#View(y_DataSet1)


###### 4- Appropriately labels the data set with descriptive variable names

#View(x_DataSet1)
#View(y_DataSet1)
#View(subject_DataSet)
names(subject_DataSet) <- "subject"
ALL <- cbind(x_DataSet1, y_DataSet1, subject_DataSet)
#View(ALL)

###### 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

avg_ALL <- ddply(ALL, .(subject, activity), function(x) colMeans(x[, 1:66]))


