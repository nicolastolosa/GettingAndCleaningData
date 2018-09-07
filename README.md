IMPORTANT NOTE: dplyr package is needed for executing the code.

###PROCESS TO OBTAIN CLEAN DATA

1. Download raw data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. UnZip de file in the working directory
3. Run "run_analysis.R". No arguments are needed.
4. Clean data will appear in the working directory as "result.txt"


##EXPLAINATION OF THE CODE
The way the code works is explained in the following list.

1. First data out of the folders "train" and "test" is loades into "features" and "activity_labels" variables.
2. A variable called "selection" is created to select the features that contain "std" or "mean" string
3. Numeric data of the activity located in "activity_test.txt" is loaded into "activity" variable.
4. Descriptive names are assigned to "activity" by the use of "activity_labels".
5. Numeric data of the subject that was performing the measure located in "subject_test.txt" is loaded into the "subject" variable and converted into a factor.
6. Values of the measures are loaded into "data_test" from "X_test.txt" file.
7. Columns that correspond to "mean" or "std" features are selected using the "selection" variable.
8. Names of the columns are assigned by "features" variable
9. Information located in "subject" and "activity" is added in new columns by cbind() command.
10. Similar process is carried out with data in "train" folder and is saved in "train_data" data frame.
11. Information in "train_data" and "test_data" is merged by using the command rbind and arranged in descending order of subject