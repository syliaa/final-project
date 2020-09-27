#### code R for the project 


##reading features 
features=read.table("C:/Users/hp/Desktop/features.txt", quote="\"", comment.char="")
##reading activities data
activities <- read.table("C:/Users/hp/Desktop/activity_labels.txt", quote="\"", comment.char="")

#reading train data
##Xtrain
train <- read.table("C:/Users/hp/Desktop/X_train.txt", quote="\"", comment.char="") 
colnames(train) <- features$V2 #descriptive column names for data (STEP 4)
##Ytrain
y_train <- read.table("C:/Users/hp/Desktop/y_train.txt", quote="\"", comment.char="") 
train$activity <- y_train$V1
###subject train
subject_train <- read.table("C:/Users/hp/Desktop/subject_train.txt", quote="\"", comment.char="") 
train$subject <- factor(subject_train$V1)


#reading test data
##xtest
test <- read.table("C:/Users/hp/Desktop/X_test.txt")
colnames(test) <- features$V2
##ytest
y_test <- read.table("C:/Users/hp/Desktop/y_test.txt") 
test$activity <- y_test$V1
###subject test 
subject_test <- read.table("C:/Users/hp/Desktop/subject_test.txt")
test$subject <- factor(subject_test$V1)
#####
###
#Merge train and test sets 
dataset <- rbind(test, train) 

#filter column names 
##
column.names <- colnames(dataset)

#get only columns for standard deviation and mean values, also saves activity and subject values 
column.names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)
dataset.filtered <- dataset[, column.names.filtered] 

#adding descriptive values for activity labels
dataset.filtered$activitylabel <- factor(dataset.filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#creating a tidy dataset with mean values for each subject and activity
features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)
dataset.melt <-melt(dataset.filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)
dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)

#creating a tidy dataset file  
write.table(dataset.tidy, file = "tidydataset.txt" row.names = FALSE)