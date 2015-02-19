library(tidyr)
library(dplyr)
setwd("C:/Studies/ReadingAndCleaning/Assignment/")

## Load in all the necessary files

x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activities.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjects.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activities.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjects.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Combine training and test data NOTE: The order of combination must be consistent.

subjects <- bind_rows(subjects.train, subjects.test)
x <- bind_rows(x.train, x.test)
activities <- bind_rows(activities.train, activities.test)

## Attach appropriate labels to all variables where needed

names(x) <- make.names(features$V2)
names(subjects) <- c("Subject")
names(activities) <- c("ActivityId")
names(activity.labels) <- c("ActivityId", "Activity")

## Include subject id and activity id

x2 <- bind_cols(subjects, x) %>% bind_cols(activities)

## Remove duplicated columns

dup.names <- duplicated(names(x2))
x.no.dup <-  x2[, !dup.names]

## Select only variables pertaining to Subject, ActivityId, mean and standard deviation

x.std.mean <- select(x.no.dup, matches("Subject|Activity|\\.mean\\.|\\.std\\.")) 

x.grouped <- merge(x.std.mean, activity.labels) %>%
group_by(Activity, Subject)

x.means <- summarise_each(x.grouped, funs(mean)) %>% select(-ActivityId)


write.table(x.means, file = "tidy.txt", row.names = F)
