### Getting and Cleaning Data Project

## The folder contains:

1. Data set in subfolder "UCI HAR Dataset"
2. The complete script is in run_analysis.R
3. Codebook.md indicates all variables
4. tidy_data.txt contains cleaned data

## Step of analsis:

1. Read all the data from file. Including training and testing data
2. Merge training and testing data
3. Read all the measurements from file
4. Filter the measurements and get those only related to mean and std
5. Read activity labels from file. Then rename activity for y data.
6. Rename column names for X data.
7. Merge X,y and subject information.
8. Use aggregate function to find mean of each measurement based on subject and activity
9. Output the tidy data to file.