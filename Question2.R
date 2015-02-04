#============================================
# Program for Clinical Research Unit Analyst,
# Test Data Worksheet.
# Written by Pooneh Pordeli
# Feb. 2015
#============================================

#sink("Question2.txt", append=TRUE)

# Defining required libraries in "R";
#install.packages("stats")  # ... for statistical operations;
library(stats)

##############
# Question 2 #
##############

# Read the dataset from the path that it has been saved as a "csv" file; 
#(Different in each computer); 
data<-read.csv("/Users/pooneh/Desktop/analyst-data.csv", header=TRUE)
#attach(data)



# Rename variables v1, v2 and v3 as normal, poisson and gauss respectively,
# and store them on a new dataset named "data_renamed";
install.packages("reshape")
library(reshape)
data_renamed <- rename(data, c(v1="normal", v2="poisson", v3="gauss"))
names(data_renamed) <- c("id", "time", "cats", "normal", "poisson", "gauss")

# To see the given variable names in the new dataset;
new_var_names=names(data_renamed)

# OR, to see some first lines of the dataset with new variable names;
print(head(data_renamed))

# Print new variable names with an expression;
cat("Name of variables in the new dataset:", "\n", new_var_names, "\n")

#sink()
