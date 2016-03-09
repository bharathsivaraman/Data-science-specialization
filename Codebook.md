This is a code book for the "run_analysis.R" script

Data set information:

The data set contains results of expirement performed on 30 people. The participants performed sex activities wearing a smartphone to thier waist.
The results of the experiment are captured into the dataset.

the data set contains theree set of files
1. Training data
2. Test data
3. Variables names


The following variables are used in the scripts to store the inidvidual files:

1.activity_labels - Stores the list of activities
2.features_cols - Stores the columns that are needed to be combined with the data set (only mean and std columns)
3.train_x - Training data of features
4.train_y - Training data of activity
5.subject_train - Training data of subject
6.Train - Combined data set of all the training data
7.test_x - Test data for features
8.test_y - Test data for activities
9.subject_test- Test data for subjects

All these files are consolidated into:

Complete_set - This variable contains the final output of all the combined data.

The final out put is stored in the file tidy.csv
The output file contains all variables aggregated on the six activities
1. Walking
2. Walking upstairs
3.Walking downstairs
4.Sitting
5.Standing
6.Laying
