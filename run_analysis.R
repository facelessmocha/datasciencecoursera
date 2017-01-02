### Question 1: Merges the training and the test sets to create one data set.

## load train and test data
X_train_data = read.table("train/X_train.txt")
y_train_data = read.table("train/y_train.txt")
subject_train_data = read.table("train/subject_train.txt")

X_test_data = read.table("test/X_test.txt")
y_test_data = read.table("test/y_test.txt")
subject_test_data = read.table("test/subject_test.txt")

## merge data
X_merged = rbind(X_train_data, X_test_data)
y_merged = rbind(y_train_data, y_test_data)
subject_merged = rbind(subject_train_data, subject_test_data)

### Question 2: Extracts only the measurements on the mean and standard deviation for each measurement.

## load measurements
measurements = read.table("features.txt")
measurements = measurements[, 2]

## extract only mean and std measurements
mean_std_rows = grep("-(mean|std)\\(\\)", measurements)
measurments_mean_std_only = measurements[mean_std_rows]

### Question 3: Uses descriptive activity names to name the activities in the data set

activity_lables = read.table("activity_labels.txt")


### Question 4: Appropriately labels the data set with descriptive variable names.

## update X_merged labels
colnames(X_merged) = measurements

### Question 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## rename y_merged and subject_merged
colnames(y_merged) = "activity_label"
colnames(subject_merged) = "subject"

## combine all data
data_combined = cbind(X_merged[, mean_std_rows], y_merged, subject_merged)

result = aggregate(data_combined, by=list(activity_label = data_combined$activity_label, subject=data_combined$subject), mean)
result[,69] = factor(result$activity_label, levels = activity_lables[,1], labels = activity_lables[,2])

write.table(result, "../tidy_data.txt", row.name=FALSE)