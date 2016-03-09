library(dplyr)

#set path to the project folder
setwd("C:\\Users\\Bharath.Sivaraman\\Documents\\R programming\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset")

# import acitivity label file and get the columm names to be used in the final output file.select only columns that have mean or std.
activity_labels<-read.csv("activity_labels.txt",sep="",header=FALSE)
features<-read.csv("features.txt",sep="",header=FALSE)
cols_pos<-grep(".*mean.*|.*std.*", features[,2])
features_cols<-features[grep(".*mean.*|.*std.*", features[,2]),2]
features_cols<-gsub("-mean","Mean",features_cols)
features_cols<-gsub("-std","Std",features_cols)
features_cols<-gsub("[-()]","",features_cols)

# get the inidvidual training files and combine them into a final file
train_x<-read.csv("train\\X_train.txt", sep="", header=FALSE)[cols_pos]
train_y<-read.csv("train\\Y_train.txt", sep="", header=FALSE)
subject_train<-read.csv("train\\subject_train.txt", sep="", header=FALSE)
train<-cbind(train_y,subject_train,train_x)

#get the test files and combine them into a final fine
test_x<-read.csv("test\\X_test.txt", sep="", header=FALSE)[cols_pos]
test_y<-read.csv("test\\y_test.txt", sep="", header=FALSE)
subject_test<-read.csv("test\\subject_test.txt", sep="", header=FALSE)
test<-cbind(test_y,subject_test,test_x)
complete_set<-rbind(train,test)

#rename the columns of the final data set
colnames(complete_set)<-c("Activity","Subject",features_cols)
complete_set<-tbl_df(complete_set)

# Summarized table based on activity. Use Dplyr for this purpose
Activity_summarize<-inner_join(activity_labels,complete_set,by=setNames("Activity","V1"))
colnames(Activity_summarize)[2]<-"Activity"


Activity_summarize<-Activity_summarize%>%
  select(-V1)%>%
    group_by(Subject,Activity)%>%
      summarize_each(funs(mean))

write.csv(Activity_summarize,file="tidy.csv")


