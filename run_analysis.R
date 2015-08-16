
# dplyr package is a dependency for running this script, so please make sure it's installed on your computer.
library(dplyr)

# Here we load both the "train" and "test" data sets, and then we merged them in a single unified data set using the "rbind" function.
training.data <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
test.data <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
merged.data <- rbind(training.data, test.data)

# On the following two lines, we load and assign meaningful names for the variables. We take those names from the "features.txt" file from the raw set.
features <- read.table(file = "UCI HAR Dataset/features.txt", col.names = c("id", "feature.name"))
colnames(merged.data) <- features$feature.name

# We preserve only the columns that applied the mean or std function to a measurement. We use a regex for that.
merged.data <- merged.data[grep(pattern = "(?:mean|std)\\(\\)", x = names(merged.data))]

# We add to our data set the activity id to each corresponding row.
training.activities <- read.table(file = "UCI HAR Dataset/train/y_train.txt", col.names = "activity.id")
test.activities <- read.table(file = "UCI HAR Dataset/test/y_test.txt", col.names = "activity.id")
merged.activities <- rbind(training.activities, test.activities)
merged.data <- cbind(merged.data, merged.activities)

# We add to our data set the subject id to each corresponding row.
training.subjects <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", col.names = "subject.id")
test.subjects <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", col.names = "subject.id")
merged.subjects <- rbind(training.subjects, test.subjects)
merged.data <- cbind(merged.data, merged.subjects)

# We substitute the activities ids with meaningful activities names. We use the "merge" command in conjunction with "activity_labels.txt" data. At the end we get rid of the "activity.id" column because it's no longer necessary.
activity.labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity.name"))
merged.data <- merge(x = merged.data, y = activity.labels, by.x = "activity.id", by.y = "id")
merged.data$activity.id <- NULL

# We group the data by the "activity.name" and "subject.id" columns. The result is a new data set with a row for each "activity.id"/"subject.id" pair that summarizes the average values for each variable included in the source data set.
groups <- group_by(merged.data, activity.name, subject.id)
final.data.set <- summarise_each(groups, funs(mean))
final.data.set <- as.data.frame(final.data.set)

# We rename some of the variables names in order to make it clear that those are summarized values. Finally the resulting data set is stored in the "tidy_data_set.txt" file.
colnames(final.data.set) <- c(colnames(final.data.set)[c(1,2)], paste0(colnames(final.data.set), "-average")[c(-1,-2)])
write.table(x = final.data.set, file = "tidy_data_set.txt", row.names = FALSE)
