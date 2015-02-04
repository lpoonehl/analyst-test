##############
# Question 4 #
##############

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



# For histogram of this data with lines at the X = median and X = mean;
install.packages("graphics")
library(graphics)
dev.new()    # Save plots to eps file;
postscript("Q.4 histogram of poisson.eps", paper="letter")   # Name of the saved file which is included the plot;
bins=seq(min(poisson), max(poisson), by=1)
hist(poisson)
axis(1, at=bins, labels=c(bins))
mx=mean(poisson)        # Mean of variable "poisson";
medx=median(poisson)    # Median of variable "poisson";
abline(v=mx, col="steelblue", lwd=7)   # Blue thiker line at the mean of X=poisson; 
abline(v= medx, col="red", lwd=2, lty=11)  # Red thinner dashed line at the median of X=poisson; 
legend('topright', lty=c(1,11), c("mean", "median"), lwd=c(7,2),col=c("steelblue","red"))
dev.off()

# The two lines of X=mean and X=median are overlaped;
# i.e., mean(poisson)=median(poisson) -> 2.997513=3




# NOTE: If you block commands:
# dev.new(),
# postscript("Q.4 histogram of poisson.eps") and 
# dev.off();
# you can see the plot in the R output graph window;
# Otherwise it will be saved in a "eps" file named "Q.4 histogram of poisson.eps".
