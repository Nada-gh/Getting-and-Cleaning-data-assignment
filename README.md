# Getting and Cleaning Data Assignment

This project gives a good practice to what has been taught in "Getting and Cleaning Data" course at Coursera. 
The "run_Analysis.R" script, does several tasks:

1. To save time and memory, checks if the file already exists in the working directory.

2. reads different files individually, the training files, the testing files, the activities' labels,and features file.

3. Based on the dimensions of every loaded file "treating them as Lego pieces", merging the training files together and the testing files together, and then attaching both in one file using "rbind" command.

4. Using the features vector, extracts only the variables that have the "mean" or "std" keywords to be kept in the dataset.

5. To have a clear tidy dataset, this code maps the activity values (1,2,3,4,5,6) to descriptive names (Walking,Walking-upstairs, Walking-downstairs, Sitting, Standing, Laying) respectively.

6. Melt the dataset to stack the measurements in compressed or narrow format instead of wide format.

7. Generate an independent dataset calculated by applying the mean function on the combination of the variables in the previous narrow function.

8. Write the calculated average data to a new text file ("finaltidydata.txt"). 

Notes:

 * Read back the result dataset with the command
  - read.table("finaltidydata.txt", header = TRUE)
  
 * attached, there is CodeBook.md file which describes all the variables of the final tidy dataset.
  
  

The final result is clean tidy dataset because it provides the main properties needed:

1. Every column represents only one variable.
2. Every observation gives an action for one unit.
3. No duplication in the measurements. 
4. The variable names are descriptive. 
5. The activity labels are descriptive as well(Walking, Sitting,..).




