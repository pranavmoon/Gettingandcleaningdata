#---------- Download and unzip data file ------
zipfileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfilename<-"w4project_data.zip"
if(!file.exists(zipfilename)){download.file(zipfileurl,zipfilename)}
unzip(zipfilename)
#------------------ set directory -------

setwd("UCI HAR Dataset/")

#---------------Reading txt files -------
features_var<-read.table("features.txt")     
activity<-read.table("activity_labels.txt") 
train_subject<-read.table("train/subject_train.txt")
test_subject<-read.table("test/subject_test.txt")
train_level<-read.table("train/y_train.txt")
test_level<-read.table("test/y_test.txt")

#---------------------converting atomic class of y_train and y_test data----------
train_level$V1<-as.character(train_level$V1)
test_level$V1<-as.character(test_level$V1)

##----------- replacing levels by corresponding activity label name------
activity$V2<-as.character(activity$V2)
train_level$V1<-factor(train_level$V1, levels=activity$V1, labels = activity$V2)
test_level$V1<-factor(test_level$V1, levels=activity$V1, labels = activity$V2)

#-----read and assign name the column of X_train and X_test files------------
xtrain<-read.table("train/X_train.txt")
colnames(xtrain)<-features_var$V2

xtest<-read.table("test/X_test.txt")
colnames(xtest)<-features_var$V2

#-----------------------extract mean and std variables------
train_index_mean_std<-grep("mean|std",names(xtrain))
test_index_mean_std<-grep("mean|std",names(xtest))
xtrain<-xtrain[,train_index_mean_std]
xtest<-xtest[,test_index_mean_std]
##------ add subject and activity level column to xtrain and xtest respectively---
train<-cbind(train_subject,train_level,xtrain)
test<-cbind(test_subject,test_level,xtest)
#----------------------merge xtrain and xtest--------------
tt_data<-rbind(train,test)
colnames(tt_data)[c(1,2)]<-c("subject","activity")
#----------------------arrange tt_data by subject----------
library(dplyr)
tt_data<-arrange(tt_data,subject)
##---------------------- group data by subject then activity --------
library(reshape2)
tt_data_grouped<- melt(tt_data, id = c("subject", "activity"))
tt_group_mean<-dcast(tt_data_grouped, subject+activity~variable, mean)
#------- Exporting grouped mean data as tidy.txt file----------

write.table(tt_group_mean, file="tidy.txt",row.names = FALSE)

#---- set directory back to original-------
setwd("../")

