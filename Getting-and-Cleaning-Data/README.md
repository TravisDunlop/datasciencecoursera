==================================================================
Getting and Cleaning Data Project:
Cleaning and Tidying Data Provided from the study:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Data Cleaning completed by: Travis Dunlop
Raw Data Sourced From:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

In the file run_analysis.R the raw data from the study is assumed to be already loaded on the file on which the R program is running.  It first loads in the test, training, Subject, and Activity data.  Then it merges them into one dataset.  It then renames the columns to be more readable (find a codebook of all of the columns below) and elimantes and column that does not have a metric relating to either the mean or std (standard devation) of a particular aspect of the study.  It also replaces the numbers from the Activity column with the English values that they correspond to.  It then dedups the data set so that there is only one record per Subject, Activity pair.  As there are 30 subjects and 6 activities there are (30 * 6) 180 records in this tidy data set.  This tidy dataset is then printed to a file named CourseraProject_TidyDataSet.txt.

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

==================================================================

CODEBOOK:

The first two columns of the dataset is the Subject and Activity.  The subject is the identifier for which participant the data is referring to.  The activity describes which activity the participant was doing i.e. ("WALKING", "SITTING", etc.).

For columns 3 - 81 they refer to the average of varying metrics for that participant's activity.  They names can be broken down into four parts seperated by periods.

1) Time or Frequency
2) Metric label (i.e. BodyAcc, BodyGyro etc.)
3) Type of metric (i.e. mean or std)
4) If applicable, the direction in which the metric is measured (X, Y, or Z)

1:  Subject
2:  Activity
3:  Time.BodyAcc.mean.X
4:  Time.BodyAcc.mean.Y
5:  Time.BodyAcc.mean.Z
6:  Time.BodyAcc.std.X
7:  Time.BodyAcc.std.Y
8:  Time.BodyAcc.std.Z
9:  Time.GravityAcc.mean.X
10: Time.GravityAcc.mean.Y
11: Time.GravityAcc.mean.Z
12: Time.GravityAcc.std.X
13: Time.GravityAcc.std.Y
14: Time.GravityAcc.std.Z
15: Time.BodyAccJerk.mean.X
16: Time.BodyAccJerk.mean.Y
17: Time.BodyAccJerk.mean.Z
18: Time.BodyAccJerk.std.X
19: Time.BodyAccJerk.std.Y
20: Time.BodyAccJerk.std.Z
21: Time.BodyGyro.mean.X
22: Time.BodyGyro.mean.Y
23: Time.BodyGyro.mean.Z
24: Time.BodyGyro.std.X
25: Time.BodyGyro.std.Y
26: Time.BodyGyro.std.Z
27: Time.BodyGyroJerk.mean.X
28: Time.BodyGyroJerk.mean.Y
29: Time.BodyGyroJerk.mean.Z
30: Time.BodyGyroJerk.std.X
31: Time.BodyGyroJerk.std.Y
32: Time.BodyGyroJerk.std.Z
33: Time.BodyAccMag.mean
34: Time.BodyAccMag.std
35: Time.GravityAccMag.mean
36: Time.GravityAccMag.std
37: Time.BodyAccJerkMag.mean
38: Time.BodyAccJerkMag.std
39: Time.BodyGyroMag.mean
40: Time.BodyGyroMag.std
41: Time.BodyGyroJerkMag.mean
42: Time.BodyGyroJerkMag.std
43: Freq.BodyAcc.mean.X
44: Freq.BodyAcc.mean.Y
45: Freq.BodyAcc.mean.Z
46: Freq.BodyAcc.std.X
47: Freq.BodyAcc.std.Y
48: Freq.BodyAcc.std.Z
49: Freq.BodyAcc.meanFreq.X
50: Freq.BodyAcc.meanFreq.Y
51: Freq.BodyAcc.meanFreq.Z
52: Freq.BodyAccJerk.mean.X
53: Freq.BodyAccJerk.mean.Y
54: Freq.BodyAccJerk.mean.Z
55: Freq.BodyAccJerk.std.X
56: Freq.BodyAccJerk.std.Y
57: Freq.BodyAccJerk.std.Z
58: Freq.BodyAccJerk.meanFreq.X
59: Freq.BodyAccJerk.meanFreq.Y
60: Freq.BodyAccJerk.meanFreq.Z
61: Freq.BodyGyro.mean.X
62: Freq.BodyGyro.mean.Y
63: Freq.BodyGyro.mean.Z
64: Freq.BodyGyro.std.X
65: Freq.BodyGyro.std.Y
66: Freq.BodyGyro.std.Z
67: Freq.BodyGyro.meanFreq.X
68: Freq.BodyGyro.meanFreq.Y
69: Freq.BodyGyro.meanFreq.Z
70: Freq.BodyAccMag.mean
71: Freq.BodyAccMag.std
72: Freq.BodyAccMag.meanFreq
73: Freq.BodyBodyAccJerkMag.mean
74: Freq.BodyBodyAccJerkMag.std
75: Freq.BodyBodyAccJerkMag.meanFreq
76: Freq.BodyBodyGyroMag.mean
77: Freq.BodyBodyGyroMag.std
78: Freq.BodyBodyGyroMag.meanFreq
79: Freq.BodyBodyGyroJerkMag.mean
80: Freq.BodyBodyGyroJerkMag.std
81: Freq.BodyBodyGyroJerkMag.meanFreq
