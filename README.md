### This is Project assignment for Course:*Getting and Cleaning data*.


  *The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.*


### Data Set Information:

   *The information about data set is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)*
   

### The R script called run_analysis.R does the following:

1. Download and unzip the datafile "w4project_data.zip".
2. set the working directory to "UCI HAR Dataset/".
3. Reading text files: 

    +     "features.txt" in features_var.   (**measurements**)
    +     "activity_labels.txt" in activity. (**six activities**)
    +     "subject_train.txt" in train_subject (**volunteers for training data**)
    +     "subject_test.txt" in test_subject  (**volunteers for test data**)
    +     "y_train.txt" in train_level.  (**activity levels for training data**)
    +     "y_test.txt" in test_level	    (**activity levels for test data**)
    
4. Convert the atomic data type in train_level and test_level and replacing activity levels by corresponding activity labels (name).
5. *xtrain* and *xtest* read the training and test data and labels the data set with descriptive variable names.
6. *Extracts* the measurements on the mean and standard deviation for each measurement.
7. Add *subject* and *activity* level to the *xtrain* and *xtest* data set.
8. *merge* the training and test data to creat one data set:*tt_data* and name the 1^st^ and 2^nd^ variable as *subject* and *activity* respectively.
9. group the merged data to find the average of each variable for each activity and each subject.
10. write grouped  average data to the text file *tidy.txt*
11. change working directory to original one. 


