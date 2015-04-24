## read feature and activity names.
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
## read train and test data and assign
## feature names to the columns.
d1 <- rbind(read.table("train/X_train.txt")
            ,read.table("test/X_test.txt")) 
names(d1) <- features[,2]

## select measurements only on mean and 
## standard deviation and assign them 
## to a variable called cleanData.
selected.features <- 
  features[grep("mean\\()|std\\()",names(d1)),]

cleanData <- d1[,selected.features[,1]]

## read labels, replace them by descriptive 
## activity names.
labels <- rbind(read.table("train/y_train.txt")
                ,read.table("test/y_test.txt"))
for (ii in 1:nrow(labels)){
  labels[ii,2] <- activity[labels[ii,1],2] 
}

## read subjects
subject <- rbind(read.table("train/subject_train.txt")
                ,read.table("test/subject_test.txt"))

## Assign subject and activity names
##  to the cleanData.

cleanData <- cbind(subject, labels[,2], cleanData)
names(cleanData)[1] <- paste("subject")
names(cleanData)[2] <- paste("activity")

## Use descriptive variable names insted of abbreviations
names(cleanData)<-gsub("^f", "frequency", names(cleanData))
names(cleanData)<-gsub("^t", "time", names(cleanData))
names(cleanData)<-gsub("Acc", "Accelerometer", names(cleanData))
names(cleanData)<-gsub("Gyro", "Gyroscope", names(cleanData))
names(cleanData)<-gsub("Mag", "Magnitude", names(cleanData))

## Write descriptive variable names to file
sf <- cbind(1:66,names(cleanData[,3:68]))
write.table(sf, file = "features_mean.txt",
            row.name=FALSE, col.name=FALSE, quote = FALSE)

## calculate mean with respect to activity for each subject
## and arrange them with respect to the subjects.
library(plyr);
mean.cleanData <- aggregate(. ~subject+activity , cleanData, mean)
mean.cleanData <- arrange(mean.cleanData,subject)

## Write processed tidy data to a text file
write.table(mean.cleanData, file = "tidy_data.txt", row.name=FALSE)

