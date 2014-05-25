Codebook for tidy_dataset.txt
---

The following five steps are performed on the original data.
1. Merge the training (x_train.txt) and the test (x_test.txt) sets to create one data set.
2. Extract the mean and standard deviation for each measurement. Only variables that contain mean or std in their label are retained. The variable labels are taken from the features.txt file.
3. The activitie names are taken from the second column of the features.txt file.
4. Labels for the activities for the training (y_train.txt) and test (y_test.txt) subjects are applied to the data.
5. The subjects ids are added for the training (subject_train.txt) and test (subject_test.txt) subjects. In addition, for each subject, the average value of each subject is extracted using the aggregate function to apply the mean function for each subject in the dataset.


The data set can be loaded using the following call:
read.table("tidy_dataset.txt", sep="\t", header=T, colClasses=c("character","factor", rep("numeric",79)))

