run_analysis <- function(){
    
    ## Charge libraries
    library(dplyr)
    
    ##----------------------------------------------------------------------------
    
    
    ## LOAD GENERIC DATA
    

    features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)
    selection <- grep(("mean|std"),features[,2], value = F)                 ##Vector with index of features containing "mean" or "std"
    features <- features[selection,2]                                       ##Character vector corresponding to features
    
    
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)
    activity_labels <- factor(activity_labels[,2], activity_labels[,2])     ##Factor corresponding to activities      
    
    
    ## LOAD AND MANIPULATE 'test' DATA
    
    activity <- "UCI HAR Dataset/test/y_test.txt"
    activity <- read.table(activity)
    activity <- activity_labels[activity[,1]]                               ##Factor corresponding to activity label in each row of 'test' data 
    
    subject <- "UCI HAR Dataset/test/subject_test.txt"
    subject <- read.table(subject)
    subject <- factor(subject[,1])                                          ##Factor corresponding to subject label in each row of 'test' data 
    
    data_test <- "UCI HAR Dataset/test/X_test.txt"
    data_test <- read.table(data_test)
    data_test <- data_test[,selection]                                      ##Select colums that contain "mean" or "std"
    names(data_test) <- features                                            ##Change column names
    data_test <- cbind(subject, activity, data_test)
    
    
    
    ## LOAD AND MANIPULATE 'train' DATA
    
    activity <- "UCI HAR Dataset/train/y_train.txt"
    activity <- read.table(activity)
    activity <- activity_labels[activity[,1]]                               ##Factor corresponding to activity label in each row of 'test' data 
    
    subject <- "UCI HAR Dataset/train/subject_train.txt"
    subject <- read.table(subject)
    subject <- factor(subject[,1])                                          ##Factor corresponding to subject label in each row of 'test' data 
    
    data_train <- "UCI HAR Dataset/train/X_train.txt"
    data_train <- read.table(data_train)
    data_train <- data_train[,selection]                                    ##Select colums that contain "mean" or "std"
    names(data_train) <- features                                           ##Change column names
    data_train <- cbind(subject, activity, data_train)
    
    
    ## Merge data by rows
    
    data <- rbind(data_test, data_train)
    data <- arrange(data, subject)
    rm(list=(ls()[ls()!="data"]))                                           ##Remove all variables except data
    
    
    ## Create new dataset out of the data folder
    
    write.table(data, file="result.txt", row.names=F)

}
