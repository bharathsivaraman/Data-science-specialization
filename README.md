# This file details how the script "run_analysis.R" was coded.
1. Read all the activity label and features file. The feature file conmtains that columns that need to be added to our data set. 
2. Filter out all columns except those that have mean and std in thier name. 
3. Read the files under test and tain folder. Each folder has three file. All the files must be compiled into a single file
4. Append the column names to the final data set.
5.Summaize the data into acitivity and calculate the average activity for all the variables. (use dplyr for this. Import it at the beggining)
write the output into a CSV file.
