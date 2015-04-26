# run_analysis.R script

## Before using this script
* This script assumes that you have downloaded the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and that you have unzipped it and placed its parent folder, UCI HAR Dataset, along with all of its contents in your working directory.  
  
* This script assumes that you have installed the package reshape2.  
  
## What this script does

1. Reads in the Subject data for the test and train data.  
2. Reads in the Activity data for the test and train data.  
        + Replaces the numeric Activity labels found in the 'y_test.txt' and 'y_train.txt' files with the descriptive names for Activities found in the 'activity_labels.txt' file.  
3. Creates a list of descriptive Measurement names for any measurements providing a  mean or standard deviation.  
        + The descriptive names are based on the information found in the 'features.txt' and 'features_info.txt' and 'README.txt' files included in the downloaded data.  
4. Reads in the Measurement data for the test and train data, saving the full data to  'testSet' and 'trainSet'.  
5. Creates subsets of the Measurement data, 'testSet1' and 'trainSet1', which include only Measurements where the mean or standard deviation is provided.  
        + These columns from 'testSet' and 'trainSet' are included in 'testSet1' and 'trainSet1' respectively: 1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503:504, 513, 516:517, 526, 529:530, 539, 542:543, 552  
6. Applies the descriptive Measurement names to the columns in the Measurement subsets.  
7. Creates a test dataframe 'testDF' and a train dataframe 'trainDF' by column binding their respective Subject, Activity, and Measurement data.  
8. Creates a single comprehensive dataframe 'fullDF' by row binding the 'testDF' and 'trainDF' dataframes.  
9. Melts 'fullDF' using Subject and Activity as identity variables, creating 'fullDFmelt'.  
10. Aggregates the 'fullDFmelt' Value field by Subject, Activity and Measurement using the mean function.  This produces this fullDFmeans dataframe, which provides the Mean of each Measurement for each Subject and Activity.  
11. Writes the final output fullDFmeans to a .txt file in the working directory.