##############
# Question 6 #
##############

sink("Question61.txt", append=TRUE)

# Read the dataset from the path that it has been saved as a "csv" file; 
#(Different in each computer); 
data<-read.csv("/Users/pooneh/Desktop/analyst-data.csv", header=TRUE)
#attach(data)

library(reshape)
data <- rename(data, c(v1="normal", v2="poisson", v3="gauss"))
names(data) <- c("id", "time", "cats", "normal", "poisson", "gauss")



# Create new variable "cru";
set.seed(2015)
N=nrow(data)
cru=c(rnorm((N/3),33,10),rnorm((N/3),34,10),rnorm((N/3),5,10))


# Add the new variable "cru" to the existing dataset;
new.data=data.frame(data,cru)
# To see the new variable is added, 
# print the name of existing variables in the new dataset;
print(names(new.data))
print(head(new.data))

#====================
# To see the effect of "time" as a fixed categorical effect on the 
# variable "cru" cosidering "id" as the random effect, 
# Use "lme";
#install.packages("nlme")
library(nlme)
model3=lme(cru~factor(time)-1, new.data, random=~1|id)
s3=summary(model3)
print(s3)
#anova(model3)

sink()

