
# Tidy Data Set Code Book

## About the Data

1. The data contained in the generated data set ("tidy_data_set.txt") is the result of a series of processing steps that were applied to the raw data set. See "Processing Steps" section below. 
2. The raw data from which this tidy data set derives from, was a data set used in a classification study. The predicting/features variables were the result of applying certain functions to raw signals produced by the gyroscope and the accelerometer of a Samsung Galaxy S Phone. The predicted variable was the physical activity (running, walking, ...) that the subjects were performing at the time the signals were measured.
3. This data set contains one observation for each subject_id/activity pair. There were 30 subjects and 6 activities, so the total number of rows is 30 x 6 = 180 observations.
4. In addition to the subject_id/activity values, each observation contain 66 summarizing variables. Each one of those variables represents the average value of a certain feature that was included in the raw data. Such features were the result of applying a mean()/std() function to other measurements involved in the original study.

## Processing Steps

The processing steps that were applied to the raw data set can be summarized as follows:

1. Merge the "train" and "test" original data sets into an unified data set (CI HAR Dataset/train/X_train.txt and UCI HAR Dataset/test/X_test.txt).
2. The feature names contained in "UCI HAR Dataset/features.txt" were used to properly label the variables of the merged data. These labels were not altered, as they provide enough representative names already.
3. Only the columns that applied the mean() or std() functions to a measurement were conserved. Everything else was removed.
4. The activity ids were added to each correspoding record in the merged set. These were taken from "UCI HAR Dataset/train/y_train.txt" and "UCI HAR Dataset/test/y_test.txt".
5. The subject ids were added to each correspoding record in the merged set. These were taken from "UCI HAR Dataset/train/subject_train.txt" and "UCI HAR Dataset/test/subject_test.txt".
6. The activity ids were replaced with the corresponding names according to "UCI HAR Dataset/activity_labels.txt".
7. Data was grouped by activity_name/subject_id pair and all the variables aggregated using the mean() function. Variables names were updated to reflect this aggregation. At this point we have the described tidy data set.

The provided R script "run_analysis.R" can be used to reproduce the 7 previously described steps. More comments detailing the process can be found at the source code.

## Variables

Here we attach some descriptions of the variables involved in the tidy data set.

1. "activity.name" (categorical): corresponds to one of the 6 activities that were performed by the subjects in the original study. The possible values are: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS.
2. "subject.id" (number): a number ranging from 1 to 30 used to identify the subjects involved in the original study.

For the rest of the summarizing variables some general statements can be made.

* All the values are real numbers ranging in the interval [-1,1].
* Those variables average mean()/std() values that were part of the features contained in the raw data set. The list of values from which the features of the **raw set** derive from are the following:

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
5. tBodyGyro-XYZ
6. tBodyGyroJerk-XYZ
7. tBodyAccMag
8. tGravityAccMag
9. tBodyAccJerkMag
10. tBodyGyroMag
11. tBodyGyroJerkMag
12. fBodyAcc-XYZ
13. fBodyAccJerk-XYZ
15. fBodyGyro-XYZ
16. fBodyAccMag
17. fBodyAccJerkMag
18. fBodyGyroMag
19. fBodyGyroJerkMag

The list of summarizing variables included in the **tidy data set** is the following:

3. "tBodyAcc-mean()-X-average"
4. "tBodyAcc-mean()-Y-average"
5. "tBodyAcc-mean()-Z-average"
6. "tBodyAcc-std()-X-average"
7. "tBodyAcc-std()-Y-average"
8. "tBodyAcc-std()-Z-average"
9. "tGravityAcc-mean()-X-average"
10. "tGravityAcc-mean()-Y-average"
11. "tGravityAcc-mean()-Z-average"
12. "tGravityAcc-std()-X-average"
13. "tGravityAcc-std()-Y-average"
14. "tGravityAcc-std()-Z-average"
15. "tBodyAccJerk-mean()-X-average"
16. "tBodyAccJerk-mean()-Y-average"
17. "tBodyAccJerk-mean()-Z-average"
18. "tBodyAccJerk-std()-X-average"
19. "tBodyAccJerk-std()-Y-average"
20. "tBodyAccJerk-std()-Z-average"
21. "tBodyGyro-mean()-X-average"
22. "tBodyGyro-mean()-Y-average"
23. "tBodyGyro-mean()-Z-average"
24. "tBodyGyro-std()-X-average"
25. "tBodyGyro-std()-Y-average"
26. "tBodyGyro-std()-Z-average"
27. "tBodyGyroJerk-mean()-X-average"
28. "tBodyGyroJerk-mean()-Y-average"
29. "tBodyGyroJerk-mean()-Z-average"
30. "tBodyGyroJerk-std()-X-average"
31. "tBodyGyroJerk-std()-Y-average"
32. "tBodyGyroJerk-std()-Z-average"
33. "tBodyAccMag-mean()-average"
34. "tBodyAccMag-std()-average"
35. "tGravityAccMag-mean()-average"
36. "tGravityAccMag-std()-average"
37. "tBodyAccJerkMag-mean()-average"
38. "tBodyAccJerkMag-std()-average"
39. "tBodyGyroMag-mean()-average"
40. "tBodyGyroMag-std()-average"
41. "tBodyGyroJerkMag-mean()-average"
42. "tBodyGyroJerkMag-std()-average"
43. "fBodyAcc-mean()-X-average"
44. "fBodyAcc-mean()-Y-average"
45. "fBodyAcc-mean()-Z-average"
46. "fBodyAcc-std()-X-average"
47. "fBodyAcc-std()-Y-average"
48. "fBodyAcc-std()-Z-average"
49. "fBodyAccJerk-mean()-X-average"
50. "fBodyAccJerk-mean()-Y-average"
51. "fBodyAccJerk-mean()-Z-average"
52. "fBodyAccJerk-std()-X-average"
53. "fBodyAccJerk-std()-Y-average"
54. "fBodyAccJerk-std()-Z-average"
55. "fBodyGyro-mean()-X-average"
56. "fBodyGyro-mean()-Y-average"
57. "fBodyGyro-mean()-Z-average"
58. "fBodyGyro-std()-X-average"
59. "fBodyGyro-std()-Y-average"
60. "fBodyGyro-std()-Z-average"
61. "fBodyAccMag-mean()-average"
62. "fBodyAccMag-std()-average"
63. "fBodyBodyAccJerkMag-mean()-average"
64. "fBodyBodyAccJerkMag-std()-average"
65. "fBodyBodyGyroMag-mean()-average"
66. "fBodyBodyGyroMag-std()-average"
67. "fBodyBodyGyroJerkMag-mean()-average"
68. "fBodyBodyGyroJerkMag-std()-average"

Note that all the previous values are averages of features included in the raw set. Features themselfs are the result of applying some function (mean() or sd() in this case) to the original accelerometer or gyroscope values. These are usually divided by axis: x, y or z. For a deeper explanation about the features included in the original raw set please take a look at "features_info.txt" of the original set (a link is provided at README.md).