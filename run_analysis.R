library(dplyr)

findColumns <- function(dataFile){
    ##this function finds a vector of relevant columns -
    ##in other words, columns containing mean and std deviation data.
    ##It looks for "mean()" or "std()" in the column heading.
    subsetVector <- c()
    for (i in 1:nrow(dataFile)){
        testString <- unlist(strsplit(dataFile[i,2], "-"))[2]            
        if (identical(testString,"mean()") ==TRUE|identical(testString,"std()") ==TRUE) {
            subsetVector <- c(subsetVector, i)            
        }        
    }
    subsetVector        
}


testData <- read.table("X_test.txt", stringsAsFactors = FALSE)
trainData <- read.table("X_train.txt", stringsAsFactors = FALSE)
    ##read in the two big data files

bigComboData <- rbind(testData, trainData)
    ##combine them into one large file - step 1 in assignment

columnHeadings <- read.table("features.txt", stringsAsFactors = FALSE)
    ## read in column headings from features.txt

subsetVector <- findColumns(columnHeadings)
    ## get vector of position of column headings with mean and std dev

selectData <- bigComboData[, subsetVector]
    ## subset combo data file for all columns of mean and std dev 
    ## this is step 2 of the assignment

testActivities <- read.table("y_test.txt", stringsAsFactors = FALSE)
trainActivities <- read.table("y_train.txt", stringsAsFactors = FALSE)
    ## read in the files with activity data (by number)

comboActivities <- as.character(c(testActivities[,1], trainActivities[,1]))
    ##combine activities into 1 vector

comboActivities <- gsub("1", "Walking", comboActivities)
comboActivities <- gsub("2", "Walking_Upstairs", comboActivities)
comboActivities <- gsub("3", "Walking_Downstairs", comboActivities)
comboActivities <- gsub("4", "Sitting", comboActivities)
comboActivities <- gsub("5", "Standing", comboActivities)
comboActivities <- gsub("6", "Lying_Down", comboActivities)
    ##Replace activity numbers with descriptive names - step 3 of assignment

selectData <- cbind(comboActivities, selectData)
    ##add activities to data file with means and std deviations

testSubjects <- read.table("subject_test.txt")[,1]
trainSubjects <- read.table("subject_train.txt")[,1]
allSubjects <- c(testSubjects, trainSubjects)
    ##read in subject IDs and concatenate into one vector of length 10299

selectData <- cbind(allSubjects, selectData)
    ##add subject IDs to big data file

colnames(selectData) <- c("Subject_ID", "Activity", columnHeadings[subsetVector,2])
    ## add column names to the big data file - step 4 of the assignment

summaryData <- summarise_each(group_by(selectData, Subject_ID, Activity), funs(mean))
    ## use the dplyr functions to get means of each variable for each
    ## subject/activity pair.

