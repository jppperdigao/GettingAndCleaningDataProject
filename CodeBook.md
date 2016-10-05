#Code Book 
Describes the variables, the data, and any transformations or work that was performed to clean up the data called.

R script called run_analysis.R should perform the following steps:

1- Merges the training and the test sets to create one data set.

**Answer:** First of all load all the .txt files and saved them in variables with read.table(). Merged all the similar data based on the content with rbind() function.

2- Extracts only the measurements on the mean and standard deviation for each measurement.

**Answer:** Search for all partial strings "mean" and "std" and select them. Also assign column names from features.txt.

3- Uses descriptive activity names to name the activities in the data set

**Answer:** From activity_labels.txt gather the activity names (description) and replace by the codes in the correspondent dataset.

4- Appropriately labels the data set with descriptive variable names.

**Answer:** Assigned the lables left in order to have the merged dataset (ALL) labeled.

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Answer:** 

## Variables


