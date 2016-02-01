#run_analysis.R - Reads in data from UCI HAR Dataset and Creates Tidy Dataset

#setting file names to load in
X_trainURL <- "UCI HAR Dataset/train/X_train.txt"
X_testURL <- "UCI HAR Dataset/test/X_test.txt"

y_trainURL <- "UCI HAR Dataset/train/y_train.txt"
y_testURL <- "UCI HAR Dataset/test/y_test.txt"

subjectTrainURL <- "UCI HAR Dataset/train/subject_train.txt"
subjectTestURL <- "UCI HAR Dataset/test/subject_test.txt"

#reading files into raw tables
Xtrain_Data <- read.table(file = X_trainURL)
Xtest_Data <- read.table(file = X_testURL)

Ytrain_Data <- read.table(file = y_trainURL)
Ytest_Data <- read.table(file = y_testURL)

subjectTrain_Data <- read.table(file = subjectTrainURL)
subjectTest_Data <- read.table(file = subjectTestURL)

#merging appropriate columns together
allTrainData <- cbind(subjectTrain_Data, Ytrain_Data, Xtrain_Data)
allTestData <- cbind(subjectTest_Data, Ytest_Data, Xtest_Data)

#merging the testing and training data into one master dataset
allData <- rbind(allTrainData, allTestData)

#reading in the names of the columns
Xnames <- read.table(file = "UCI HAR Dataset/features.txt")
colNames <- as.vector(Xnames$V2)

#setting manually the first two column names
colNames <- append(colNames, c("subject", "y"), after = 0)

#setting the column names appropriately for the master data set
names(allData) <- colNames

#reading and setting activity labels
rawActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels <- as.vector(rawActivityLabels$V2)

allData$Activity <- activityLabels[allData$y]

#finding only the desired columns for the dataset mean and std metrics
meanColIndex <- grep("mean", colNames)
stdColIndex <- grep("std", colNames)
desiredColIndex <- c(meanColIndex, stdColIndex)
desiredColIndex <- sort(desiredColIndex)
desiredColIndex <- append(desiredColIndex, c(1, 564), 0)

meanStdData <- allData[, desiredColIndex]

meanStdColNames <- names(meanStdData)
meanStdColNames[1] <- "Subject"
meanStdColNames <- unlist(lapply(meanStdColNames, function(x) sub("^f", "Freq.", x)))
meanStdColNames <- unlist(lapply(meanStdColNames, function(x) sub("^t", "Time.", x)))
meanStdColNames <- unlist(lapply(meanStdColNames, function(x) gsub("\\(\\)", "", x)))
meanStdColNames <- unlist(lapply(meanStdColNames, function(x) gsub("-", ".", x)))
names(meanStdData) <- meanStdColNames

tidyDataSet <- aggregate(meanStdData[3:81], meanStdData[1:2], FUN = mean)

write.table(tidyDataSet, "CourseraProject_TidyDataSet.txt", row.names = FALSE, )
