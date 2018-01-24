library(tidyr)
library(dplyr)
library(reshape2)

## check the data file if it already exists in the working directory
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

if (!file.exists(filename)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}


## read the training data

s_trn<-read.table("UCI HAR Dataset/train/subject_train.txt")
x_trn<-read.table("UCI HAR Dataset/train/X_train.txt")
y_trn<-read.table("UCI HAR Dataset/train/y_train.txt")

## read the testing data
s_tst<-read.table("UCI HAR Dataset/test/subject_test.txt")
x_tst<-read.table("UCI HAR Dataset/test/X_test.txt")
y_tst<-read.table("UCI HAR Dataset/test/y_test.txt")

## read the descriptive names of the features
feats<-read.table("UCI HAR Dataset/features.txt")
feats[,2]<-as.character(feats[,2])

## read the activity labels
act_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
act_labels[,2]<-as.character(act_labels[,2])


##***************************************************************************************


##1. merges test and train datasets 
train_all<-cbind(s_trn,y_trn,x_trn)

test_all<-cbind(s_tst,y_tst,x_tst)

all_data<-rbind(train_all,test_all)

names(all_data)<-c("Subject_ID","Activity_name",feats[,2])

##2.Extracts only the measurements on the mean and standard deviation for each measurement

feats_selected<-grep("std|mean",names(all_data),value=TRUE)

all_data<-all_data[,c("Subject_ID", "Activity_name",feats_selected)]



## labeling the activities with the given descriptive names
all_data$Activity_name<- factor(all_data$Activity_name, levels = act_labels[,1], labels = act_labels[,2])

## maping the subject IDs to factor object to represent different levels

all_data$Subject_ID<-factor(all_data$Subject_ID)

## tidying the data by gathering all the measurements under one variable

tided <- melt(all_data, id = c("Subject_ID", "Activity_name"))


## create a new dataset which gives the average of each variable for each activity and each subject.
avg_data<- dcast(tided, Activity_name + Subject_ID ~ variable, mean)

## writing the claculated average data to a new file 
write.table(avg_data, file ="finaltidydata.txt",row.names = FALSE, col.names = TRUE)

## read the result back using "read.table" function



