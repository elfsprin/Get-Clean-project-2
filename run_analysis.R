# Read in test and train subjects and apply a column label
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                          quote="\"",col.names=c("Subject"))

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                           quote="\"",col.names=c("Subject"))

# Read in the test and train activity labels and apply a column label
        testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                quote="\"",col.names=c("Activity"))

        trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                quote="\"",col.names=c("Activity"))

# Assign descriptive names to the test and train activities. These replace 
# operations are based on the activity_labels.txt file found in the UCI HAR 
# Dataset folder in the data.
        testLabels$Activity[testLabels$Activity == 1] <- "WALKING"
        testLabels$Activity[testLabels$Activity == 2] <- "WALKING_UPSTAIRS"
        testLabels$Activity[testLabels$Activity == 3] <- "WALKING_DOWNSTAIRS"
        testLabels$Activity[testLabels$Activity == 4] <- "SITTING"
        testLabels$Activity[testLabels$Activity == 5] <- "STANDING"
        testLabels$Activity[testLabels$Activity == 6] <- "LAYING"

        trainLabels$Activity[trainLabels$Activity == 1] <- "WALKING"
        trainLabels$Activity[trainLabels$Activity == 2] <- "WALKING_UPSTAIRS"
        trainLabels$Activity[trainLabels$Activity == 3] <- "WALKING_DOWNSTAIRS"
        trainLabels$Activity[trainLabels$Activity == 4] <- "SITTING"
        trainLabels$Activity[trainLabels$Activity == 5] <- "STANDING"
        trainLabels$Activity[trainLabels$Activity == 6] <- "LAYING"

# Create decriptive names for columns of interest from the test and train sets
        features <- c("TimeBodyAccelerationMeanOfX",
                "TimeBodyAccelerationMeanOfY","TimeBodyAccelerationMeanOfZ",
                "TimeBodyAccelerationStandardDeviationOfX",
                "TimeBodyAccelerationStandardDeviationOfY",
                "TimeBodyAccelerationStandardDeviationOfZ",
                "TimeGravityAccelerationMeanOfX",
                "TimeGravityAccelerationMeanOfY",
                "TimeGravityAccelerationMeanOfZ",
                "TimeGravityAccelerationStandardDeviationOfX",
                "TimeGravityAccelerationStandardDeviationOfY",
                "TimeGravityAccelerationStandardDeviationOfZ",
                "TimeBodyAccelerationJerkMeanOfX",
                "TimeBodyAccelerationJerkMeanOfY",
                "TimeBodyAccelerationJerkMeanOfZ",
                "TimeBodyAccelerationJerkStandardDeviationOfX",
                "TimeBodyAccelerationJerkStandardDeviationOfY",
                "TimeBodyAccelerationJerkStandardDeviationOfZ",
                "TimeBodyGyroscopeMeanOfX","TimeBodyGyroscopeMeanOfY",
                "TimeBodyGyroscopeMeanOfZ",
                "TimeBodyGyroscopeStandardDeviationOfX",
                "TimeBodyGyroscopeStandardDeviationOfY",
                "TimeBodyGyroscopeStandardDeviationOfZ",
                "TimeBodyGyroscopeJerkMeanOfX","TimeBodyGyroscopeJerkMeanOfY",
                "TimeBodyGyroscopeJerkMeanOfZ",
                "TimeBodyGyroscopeJerkStandardDeviationOfX",
                "TimeBodyGyroscopeJerkStandardDeviationOfY",
                "TimeBodyGyroscopeJerkStandardDeviationOfZ",
                "TimeBodyAccelerationMagnitudeMean",
                "TimeBodyAccelerationMagnitudeStandardDeviation",
                "TimeGravityAccelerationMagnitudeMean",
                "TimeGravityAccelerationMagnitudeStandardDeviation",
                "TimeBodyAccelerationJerkMagnitudeMean",
                "TimeBodyAccelerationJerkMagnitudeStandardDeviation",
                "TimeBodyGyroscopeMagnitudeMean",
                "TimeBodyGyroscopeMagnitudeStandardDeviation",
                "TimeBodyGyroscopeJerkMagnitudeMean",
                "TimeBodyGyroscopeJerkMagnitudeStandardDeviation",
                "FrequencyBodyAccelerationMeanOfX",
                "FrequencyBodyAccelerationMeanOfY",
                "FrequencyBodyAccelerationMeanOfZ",
                "FrequencyBodyAccelerationStandardDeviationOfX",
                "FrequencyBodyAccelerationStandardDeviationOfY",
                "FrequencyBodyAccelerationStandardDeviationOfZ",
                "FrequencyBodyAccelerationMeanFrequencyOfX",
                "FrequencyBodyAccelerationMeanFrequencyOfY",
                "FrequencyBodyAccelerationMeanFrequencyOfZ",
                "FrequencyBodyAccelerationJerkMeanOfX",
                "FrequencyBodyAccelerationJerkMeanOfY",
                "FrequencyBodyAccelerationJerkMeanOfZ",
                "FrequencyBodyAccelerationJerkStandardDeviationOfX",
                "FrequencyBodyAccelerationJerkStandardDeviationOfY",
                "FrequencyBodyAccelerationJerkStandardDeviationOfZ",
                "FrequencyBodyAccelerationJerkMeanFrequencyOfX",
                "FrequencyBodyAccelerationJerkMeanFrequencyOfY",
                "FrequencyBodyAccelerationJerkMeanFrequencyOfZ",
                "FrequencyBodyGyroscopeMeanOfX","FrequencyBodyGyroscopeMeanOfY",
                "FrequencyBodyGyroscopeMeanOfZ",
                "FrequencyBodyGyroscopeStandardDeviationOfX",
                "FrequencyBodyGyroscopeStandardDeviationOfY",
                "FrequencyBodyGyroscopeStandardDeviationOfZ",
                "FrequencyBodyGyroscopeMeanFrequencyOfX",
                "FrequencyBodyGyroscopeMeanFrequencyOfY",
                "FrequencyBodyGyroscopeMeanFrequencyOfZ",
                "FrequencyBodyAccelerationMagnitudeMean",
                "FrequencyBodyAccelerationMagnitudeStandardDeviation",
                "FrequencyBodyAccelerationMagnitudeMeanFrequency",
                "FrequencyBodyAccelerationJerkMagnitudeMean",
                "FrequencyBodyAccelerationJerkMagnitudeStandardDeviation",
                "FrequencyBodyAccelerationJerkMagnitudeMeanFrequency",
                "FrequencyBodyGyroscopeMagnitudeMean",
                "FrequencyBodyGyroscopeMagnitudeStandardDeviation",
                "FrequencyBodyGyroscopeMagnitudeMeanFrequency",
                "FrequencyBodyGyroscopeJerkMagnitudeMean",
                "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation",
                "FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency")
        
# Read in test and train sets, pull out the columns related to mean or standard
# deviation, apply descriptive names to those columns
        testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
        
        trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                quote="\"")
        
        testSet1 <- testSet[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,
                227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,
                452:454,503:504,513,516:517,526,529:530,539,542:543,552)]

        trainSet1 <- trainSet[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,
                227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,
                452:454,503:504,513,516:517,526,529:530,539,542:543,552)]

        names(testSet1) <- features

        names(trainSet1) <- features

# Create test and train dataframes by cbinding the subject, activity, and 
# measurement dataframes for each; do not rename columns
        testDF <- cbind(subjectTest,testLabels,testSet1,deparse.level=0)

        trainDF <- cbind(subjectTrain,trainLabels,trainSet1,
                deparse.level=0)

# Merge test and train dataframes via rbind; do not rename columns. fullDF is 
# the tidy dataset required in step 4 of this course project.
        fullDF<-rbind(testDF,trainDF,deparse.level=0)

# Melt fullDF to prepare for aggregating
        library(reshape2)
        fullDFmelt <- melt(fullDF,id=c("Subject","Activity"))
        names(fullDFmelt) <- c("Subject","Activity","Measurement","Value")

# Aggregate the Value field based on Subject, Activity and Measurement using 
# the mean function; reapply column names. fullDFmeans is the tidy dataset
# required in step 5 of this course project.

        fullDFmeans <- aggregate(fullDFmelt$Value,list(fullDFmelt$Subject,
                fullDFmelt$Activity,fullDFmelt$Measurement),mean)
        names(fullDFmeans) <- c("Subject","Activity","Measurement","Mean")
