
###Explanation of how the data was transformed into a tidy set
#the Content of th repository

CodeBook.md : it indicates the variables of the tidy data set.
README.md : it explains the transformations that were done to the data.
run_analysis.R : it contains the R code to transform the data to a tidy data set.
tidyset.txt : it represents the tidy data set produced as an output from the R script.

### first upload the files
FEATURES
X-TRAIN
Y-TRAIN
SUBJECT-TRAIN
X-TEST
Y-TEST
SUBJECT-TEST

### Then run the R code given which will create a tidy data set in a file named tidyset.txt

### Step-wise Transformation

### Step 1
Both datasets train and test are loaded in separate dataframes.
Feature list is loaded which is formatted to good variable names.
This vector is now used to rename the columns of both data frames
### Step 2
Out of 561 columns of the data frames only the ones with mean and standard deviation are used (68 in number).
meanFreq() columns are not used as they are derived columns.
### Step 3
Activity labels are loaded are binded to the data frames of test and train.
Labels are then replaced by more descriptive names.
### Step 4
Subjects are now loaded and binded to the test and train data frames.
### Step 5
Merge both data frames together
### Step 6
dplyr package is used to group merged data frame by subject and activity and written to tidyset.txt in the working directory.
