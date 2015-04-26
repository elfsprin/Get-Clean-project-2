# Read in the test and train activity labels
        testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                quote="\"")
        trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                quote="\"")

# Create decriptive names for columns of interest
        features1 <- c("TimeBodyAccelerationMeanOfX",
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
                "FrequencyBodyAccelerationJerkMeanOfX",
                "FrequencyBodyAccelerationJerkMeanOfY",
                "FrequencyBodyAccelerationJerkMeanOfZ",
                "FrequencyBodyAccelerationJerkStandardDeviationOfX",
                "FrequencyBodyAccelerationJerkStandardDeviationOfY",
                "FrequencyBodyAccelerationJerkStandardDeviationOfZ",
                "FrequencyBodyGyroscopeMeanOfX","FrequencyBodyGyroscopeMeanOfY",
                "FrequencyBodyGyroscopeMeanOfZ",
                "FrequencyBodyGyroscopeStandardDeviationOfX",
                "FrequencyBodyGyroscopeStandardDeviationOfY",
                "FrequencyBodyGyroscopeStandardDeviationOfZ",
                "FrequencyBodyAccelerationMagnitudeMean",
                "FrequencyBodyAccelerationMagnitudeStandardDeviation",
                "FrequencyBodyAccelerationJerkMagnitudeMean",
                "FrequencyBodyAccelerationJerkMagnitudeStandardDeviation",
                "FrequencyBodyGyroscopeMagnitudeMean",
                "FrequencyBodyGyroscopeMagnitudeStandardDeviation",
                "FrequencyBodyGyroscopeJerkMagnitudeMean",
                "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation")
        
# Read in test and train sets, drop unneeded columns, apply descriptive names
        testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
        trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                quote="\"")
        
        testSet1 <- testSet[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,
                227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,
                529:530,542:543)]
        trainSet1 <- trainSet[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,
                227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,
                529:530,542:543)]

        names(testSet1) <- features1
        names(trainSet1) <- features1
        
# Read in test and train subjects
        subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                quote="\"", col.names=c("Subject"))
        subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                quote="\"", col.names=c("Subject"))

# Assign descriptive names to the test and train activities and apply column 
# name
        testLabels$V1[testLabels$V1 == 1] <- "WALKING"
        testLabels$V1[testLabels$V1 == 2] <- "WALKING_UPSTAIRS"
        testLabels$V1[testLabels$V1 == 3] <- "WALKING_DOWNSTAIRS"
        testLabels$V1[testLabels$V1 == 4] <- "SITTING"
        testLabels$V1[testLabels$V1 == 5] <- "STANDING"
        testLabels$V1[testLabels$V1 == 6] <- "LAYING"
        trainLabels$V1[trainLabels$V1 == 1] <- "WALKING"
        trainLabels$V1[trainLabels$V1 == 2] <- "WALKING_UPSTAIRS"
        trainLabels$V1[trainLabels$V1 == 3] <- "WALKING_DOWNSTAIRS"
        trainLabels$V1[trainLabels$V1 == 4] <- "SITTING"
        trainLabels$V1[trainLabels$V1 == 5] <- "STANDING"
        trainLabels$V1[trainLabels$V1 == 6] <- "LAYING"
        
        names(testLabels) <- c("Activity")
        names(trainLabels) <- c("Activity")

# Create test and train dataframes, do not rename columns
        testDF <- cbind(subjectTest,testLabels,testSet1,deparse.level=0)
        trainDF <- cbind(subjectTrain,trainLabels,trainSet1,
                deparse.level=0)

# Merge test and train dataframes, do not rename columns
        fullDF<-rbind(testDF,trainDF,deparse.level=0)

# Melt fullDF to prepare for aggregating
        library(reshape2)
        fullDFmelt <- melt(fullDF,id=c("Subject","Activity"))
        names(fullDFmelt) <- c("Subject","Activity","Measurement","Value")

# Aggregate the Value based on the other three columns, grouped, and rename
# the columns
        fullDFmeans <- aggregate(fullDFmelt$Value,list(fullDFmelt$Subject,
                fullDFmelt$Activity,fullDFmelt$Measurement),mean)
        names(fullDFmeans) <- c("Subject","Activity","Measurement","Mean")
