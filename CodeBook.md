# CodeBook

## Overview
This codebook describes the variables, the data, and the transformations performed to clean and tidy the dataset from the "Human Activity Recognition Using Smartphones" project.

## Source of the Data
The data used in this project comes from the UCI Machine Learning Repository's [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Description
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S II smartphone on their waist. Using its embedded accelerometer and gyroscope, measurements were captured for 3-axial linear acceleration and 3-axial angular velocity.

The dataset contains various measurements of these signals and their derived variables.

## Variables
### Subject
- `Subject`: An identifier for the volunteer who performed the activity. Range: 1 to 30.

### Activity
- `Activity`: The activity performed by the subject. It takes the following values:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

### Features
The features selected for this dataset come from the accelerometer and gyroscope measurements, focusing on mean and standard deviation values.

Each feature is labeled according to its time or frequency domain (`Time` or `Frequency`), the measured axis (`X`, `Y`, or `Z`), and the instrument used (`Accelerometer` or `Gyroscope`), as follows:
- `TimeBodyAccelerometerMeanX`: Time domain signal for body accelerometer mean along the X-axis.
- `TimeBodyAccelerometerStdX`: Time domain signal for body accelerometer standard deviation along the X-axis.
- `TimeBodyGyroscopeMeanY`: Time domain signal for body gyroscope mean along the Y-axis.
- `FrequencyBodyAccelerometerMeanZ`: Frequency domain signal for body accelerometer mean along the Z-axis.
- And many more variables following this format...

### Transformation Steps
1. **Merge Training and Test Data**: The training and test datasets were merged to create one complete dataset.
2. **Extract Mean and Standard Deviation Features**: Only the measurements on the mean (`mean()`) and standard deviation (`std()`) for each measurement were extracted.
3. **Apply Descriptive Activity Names**: The numeric activity labels were replaced with descriptive names (e.g., `WALKING`, `SITTING`).
4. **Label Dataset with Descriptive Variable Names**: Descriptive labels were applied to the dataset variables by replacing abbreviations with full descriptive names (e.g., `tBodyAcc` to `TimeBodyAccelerometer`).
5. **Create a Tidy Data Set**: An independent tidy dataset was created with the average of each variable for each activity and each subject. This dataset is saved as `tidy_data.txt`.

## Output
- `tidy_data.txt`: A tidy dataset where each row represents the average value of each variable for a specific subject and activity.

## License
The data is publicly available and collected by the UCI Machine Learning Repository.
