##Code Book for run_analysis.R

This Code Book will explain the details of my code for this assignment, which was to create a summary file from a large data set obtained from accelerometers on a Samsung Smart Phone. The summary file presents means and standard deviations of various accelerometer parameters for 30 different individuals engaged in 6 different activities.

Here is a full description of the data:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

Here is the source of the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

The original data comprised 10299 observations of 561 variables. T

##Variables

Variables include:
- *Subject_ID*, which is a number, 1 through 30. There were 30 subjects in the Samsung experiment.
- *Activity*, the activity the subjects were engaged in. There are six: Walking, Walking downstairs, Walking upstairs, Standing, Sitting, and Lying down ("Laying" is not good English).
- 66 other variables, as described in the "features_info.txt" document available at the URL above. I kept these variable names. They were better than anything I could come up with, as I am not an expert in accelerometer data.

##Data handling

The original data was broken into two pieces. My code:

- joins them
- selects the relevant columns (mean and standard deviation), 
- substitutes descriptive words for activity codes according to in the original data set entitled *activity_labels.txt*, 
- adds activity and subject ID to the selected data file, 
- groups the selected data by subject ID and activity, and, finally,
- creates a new file of means of the relevant columns for each unique subject ID/activity combination, of which there are 180 (30 subjects X 6 activities).