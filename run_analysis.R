# Load necessary libraries
library(dplyr)

# Step 1: Download and unzip the dataset if it's not already done
filename <- "UCI_HAR_Dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}



# Step 2: Load the data
# Read feature names and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "featureName"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read training and test data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$featureName)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$featureName)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")

# Step 3: Merge the training and the test sets to create one dataset
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

all_data <- cbind(subject, y_data, x_data)

# Step 4: Extract only the measurements on the mean and standard deviation for each measurement
mean_std_columns <- grep("-(mean|std)\\(\\)", features$featureName)
selected_data <- all_data[, c(1, 2, mean_std_columns + 2)]

# Step 5: Use descriptive activity names to name the activities in the dataset
selected_data$Activity <- activities[selected_data$Activity, 2]

# Step 6: Appropriately label the dataset with descriptive variable names
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))

# Step 7: From the data set, create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- selected_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Step 8: Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)

