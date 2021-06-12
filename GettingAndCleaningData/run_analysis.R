#load dplyr for grouping and getting summary for step5
library(dplyr)
#download the zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","samsungdata.zip")
unzip("samsungdata.zip")

#read training informations and create the complete dataset
train_data<-read.table("UCI HAR Dataset/train/X_train.txt")
train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
train_activity<-read.table("UCI HAR Dataset/train/y_train.txt")

train_dataset<-cbind(train_subject,train_activity,train_data)

#read test informations and create the complete dataset
test_data<-read.table("UCI HAR Dataset/test/X_test.txt")
test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
test_activity<-read.table("UCI HAR Dataset/test/y_test.txt")

test_dataset<-cbind(test_subject,test_activity,test_data)

#1. merge both training and test data set
final_dataset<-rbind(train_dataset,test_dataset)

#set names to the dataset
features<-read.table("UCI HAR Dataset/features.txt")
names(final_dataset)<-c("subjectId","activity",features$V2)

#2.Extracts only the measurements on the mean and standard deviation for each measurement
requiredfield<-names(final_dataset)[(grepl("mean\\(\\)",names(final_dataset))|grepl("std\\(\\)",names(final_dataset)))]
temp_dataset<-final_dataset[,requiredfield]
subjectId<-final_dataset$subjectId
activity<-final_dataset$activity
required_dataset<-cbind(subjectId,activity,temp_dataset)

#3.Uses descriptive activity names to name the activities in the data set
activityfields<-read.table("UCI HAR Dataset/activity_labels.txt")
#4.Appropriately labels the data set with descriptive variable names. 
required_dataset$activity<-factor(required_dataset$activity,levels = activityfields$V1,labels = activityfields$V2)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
required_dataset<-group_by(required_dataset,subjectId,activity)
finaloutput<-summarise(required_dataset,across("tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-std()",mean))

#write to a file
write.table(finaloutput, "finaloutput.txt", row.names=FALSE)
