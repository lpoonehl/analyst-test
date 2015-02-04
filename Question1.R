#============================================
# Program for Clinical Research Unit Analyst,
# Test Data Worksheet.
# Written by Pooneh Pordeli
# Feb. 2015
#============================================

#sink("Question1.txt", append=TRUE)

# Defining required libraries in "R";
install.packages("stats")  # ... for statistical operations;
library(stats)      

##############
# Question 1 #
##############

# Read the dataset from the path that it has been saved as a "csv" file; 
#(Different in each computer); 
data<-read.csv("/Users/pooneh/Desktop/analyst-data.csv", header=TRUE)
#attach(data)



# Define existing variables in the dataset for "R";
id=data$X.id
time=data$time
cats=data$cats
v1=data$v1
v2=data$v2
v3=data$v3


# Descriptive statistics for the three numerical variables v1,v2,v3;
# There are different packages in "R" that give us different descriptive statistics,
# This package provides more practical desc. stats. where we may need some of them;
# It gives us: 
# nbr.val(number of values for each variable), 
# nbr.null(number of zeros for each variable), 
# nbr.na(number of missing values for each variable), 
# min, max, range, sum, median, mean,
# SE.mean(standard error of the mean), 
# CI.mean(confidence interval of the mean at level 0.05, by default), 
# var, std.dev, and coef.var(standard deviation divided by the mean);

install.packages("pastecs")
library(pastecs)
desc1=stat.desc(data[,c("v1","v2","v3")])



# OR
# We can also calculate descriptive statistics one by one for each variable of interest;
# Such as: min, max, mean, median, variance, standard deviation, range;

## For min and max;
min.est=apply(data[4:6], 2, min)  #data[4:6] -> variables 4,5,6 in the dataset;
max.est=apply(data[4:6], 2, max)


## For mean;
mean.est=apply(data[4:6], 2, mean)   


## For median;
med.est=apply(data[4:6], 2, median)   


## For variance;
var.est=apply(data[4:6], 2, var)   


## For standard deviation;
sd.est=apply(data[4:6], 2, sd)   




# This function also gives us quantiles, such as 1st and 3rd quantiles;
summary.qn=summary(data)
Q1=summary.qn[2,4:6]   # Gives us first quantiles for variables 4(v1), 5(v2) and 6(v3) of the dataset;
Q3=summary.qn[5,4:6]   # Gives us third quantiles for variables 4(v1), 5(v2) and 6(v3) of the dataset;






cat("##########   PRINTING RESULTS  ###########" ,"\n")



cat("Number of variables:", ncol(data), "\n")
cat("Number of observations:", nrow(data), "\n \n")

cat("Descriptive statistics:", "\n")
print(desc1)
cat("", "\n \n \n")



cat("OR       ", "\n")
cat("Descriptive statistics from another method:", "\n")
cat("Min of variables v1, v2 and v3:", "\n",   min.est, "\n \n")
cat("Max of variables v1, v2 and v3:", "\n",   max.est, "\n \n")
cat("Mean of variables v1, v2 and v3:", "\n",   mean.est, "\n \n")
cat("Median of variables v1, v2 and v3:", "\n",   med.est, "\n \n")
cat("Variance of variables v1, v2 and v3:", "\n",   var.est, "\n \n")
cat("Standard deviation of variables v1, v2 and v3:", "\n",   sd.est, "\n \n")
cat("1st quantile of variables v1, v2 and v3:", "\n",   Q1, "\n \n")
cat("3rd quantile of variables v1, v2 and v3:", "\n",   Q3, "\n \n")

#sink()



