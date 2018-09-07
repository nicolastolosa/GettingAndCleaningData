## CODEBOOK
This codebook describes the characteristics of the output data and the meaning of its variables. For information on the operation of the scripts read "README.md".

### DESCRIPTION OF CLEAN DATA

- It is a data frame with 10299 observations and 81 variables
- It is called "result.txt" and can be loaded into R with read.table function

### TRANSFORMATIONS APPLIED TO RAW DATA

1. Titles of colums from "X_train.txt" and "X_test.txt" have been set with the information located in "features.txt".
2. The activity that took place during the measure has been extracted from "y_test.txt" and "y_train.txt" and set as new column of each file. To obtain a descriptive name of the activity, information saved in "activity_labels.txt" has been used".
3. The information about the subject that was performing the measure, located in "subject_test.txt" and "subject_train.txt" has been set as a new column.
4. All columns corresponding to mean and standard deviation features have been filtered.
5. All rows from the resulting files from "train" and "test" have been merged in a unique file called "result.txt".

### VARIABLES IN THE OUTPUT DATA (ordered by columns)

1. name: subject  class: factor  meaning: Integer from 1 to 30 indicating the ID of the subject that performed the measure
2. name: activity  class: factor  meaning: Name of the activity that the subject was performing when the measure took place
3. (from column 3 to 89): features from the measures that refer to a mean or standard deviation value. For further information about features check "features_info.txt" 


