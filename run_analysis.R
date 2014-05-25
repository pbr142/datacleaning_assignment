## Getting and Cleaning Data
## Assigment

## 1. Merge the training and the test sets to create one data set.
data_train <- read.table("UCI HAR Dataset/train/x_train.txt", header=FALSE)
data_test <- read.table("UCI HAR Dataset/test/x_test.txt", header=FALSE)
data_combined <- rbind(data_train, data_test)


## 2. Extract the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
cols_mean <- grep(pattern="mean", features$V2)
cols_std  <- grep(pattern="std", features$V2)
cols <- sort(c(cols_mean, cols_std))
dataset <- data_combined[,cols]


## 3. Use Descriptive Names for Activities
colnames(dataset) <- features$V2[cols]


## 4. Appropriately label the data set with descriptive activity names.
labels_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
labels_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
labels_combined <- c(labels_train$V1, labels_test$V1)
labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
dataset$activity <- labels$V2[labels_combined]


## 5. Create a tidy data set with the average of each variable for each activity and each subject.
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
subject_combined <- c(subject_train$V1, subject_test$V1)
dataset$subject <- subject_combined
dataset_mean <- aggregate(x=dataset[,1:79], by=list(subject=as.factor(dataset$subject), activity=as.factor(dataset$activity)), FUN=mean)


## write tidy table to file
write.table(dataset_mean, "tidy_dataset.txt", sep="\t", col.names=TRUE, row.names=FALSE)