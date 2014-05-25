Project for Getting and Cleaning Data
=======================

The Repo contains the R.script and the final, cleaned data set for the project.
The original data contained measurements from 561 activities of smartphone users, seperated into a train and test group.

run_analysis.R performs five steps on the raw data in order to obtain a useable dataset. The script assumes that the zip file containing the original data is extracted into the current work directory in an order called "UCI HAR Dataset", as is in the zip file.
The following steps are performed:

  1. Merge the 'x_train.tst' and 'x_test.txt' datasets into one data frame
  2. Only retain variables that report the mean and standard deviation of a measurement
  3. Use the information in 'features.txt' to obtain meaningful column names
  4. Use the information in 'y_train.txt' and 'y_test.txt' to obtain meaningful labels for the activities
  5. For each subject and activity, the average value of each measurement is calculated
  
The last step creates the final data set. The first column contains the subject ID, the second column the activity.
Columns 3 to 81 contain the average value for each of the variables (described in detail in the codebook.md file)

The last step also saves the final file as "tidy_dataset.txt" in the current working directory.
