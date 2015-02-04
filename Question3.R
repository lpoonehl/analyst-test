##############
# Question 3 #
##############

#sink("Question3.txt", append=TRUE)

# Read the dataset from the path that it has been saved as a "csv" file; 
#(Different in each computer); 
data<-read.csv("/Users/pooneh/Desktop/analyst-data.csv", header=TRUE)
#attach(data)


# Define existing variables in the dataset for "R";
id=data$X.id
time=data$time
cats=data$cats
normal=data$v1
poisson=data$v2
gauss=data$v3


# Calculate the mean and standard deviation of each of the three distributions,
# For variable "normal" by "time", (100k in each of the 3 levels);

# Mean of variable "normal" for each group of "time";
mean1_normal=tapply(normal, time, mean)
# Print the means, where 1 is for group "1", 2 for group "2",
# and 3 for group "3" of variable "time";
cat("Mean for each of the three normal distributions:", "\n")
print(mean1_normal)
cat("", "\n \n")

# OR
library(stats)
mean2_normal=aggregate(normal,by=list(time), mean)
cat("Mean for each of the three normal distributions from another method:", "\n")
print(mean2_normal)
cat("", "\n \n \n")
# NOTE: mean_normal1 = mean_normal2 = means of variable "normal" for each group of "time", 
# (Calculated with different functions)

#==================================================================

# Standard deviation of variable "normal" for each group of "time";
sd1_normal=tapply(normal, time, sd)
# Print the standard deviations, where 1 is for group "1", 2 for group "2",
# and 3 for group "3" of variable "time";
cat("Standard deviation for each of the three normal distributions:", "\n")
print(sd1_normal)
cat("", "\n \n")

# OR
sd2_normal=aggregate(normal,by=list(time), sd)
cat("Standard deviation for each of the three normal distributions from another method:", "\n")
print(sd2_normal)

# NOTE: sd1_normal = sd2_normal = standard deviations of variable "normal" for each group of "time", 
# (Calculated with different functions)



#sink()
