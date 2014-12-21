CourseProjectGetCleanData
=========================

This repo contains the assignment for the course project for the Coursera Getting and Cleaning Data project

The repo contains an R script entitled run_analysis.R, a codebook with information about the data used, and this ReadMe, which details the workings of the R script.

The process is as follows:

1. the two large data files "X_test.txt" and "X_train.txt" are read in with "read.table".
2. They are combined with rbind.
3. The file containing column headings, "features.txt", is read in.
4. A function "findColumns" is called to find the indices of the relevant column headings (mean and std deviation).
5. The large combined data file is subsetted for relevant columns. The subsetted data is called "selectData".
6. Activity codes are read in for the test and train data sets from "y_test.txt" and "y_train.txt". The two resulting vectors are concatenated. The codes are converted to descriptive names using the "gsub" function.
7. A vector of descriptive activity names is attached to the subsetted data set with cbind.
8. The subject IDs are read in from "subject_test.txt" and "subject_train.txt". They are concatenated and attached to the subsetted data set with cbind.
9. Appropriate names are attached to the subsetted data set.
10. The requested summary table of means of all parameters in this data set for each subject/activity pair is produced using dplyr functions "summarise_each" and "group_by".


