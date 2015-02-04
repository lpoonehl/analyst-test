##############
# Question 5 #
##############

#sink("Question5.txt", append=TRUE)

# Read the dataset from the path that it has been saved as a "csv" file; 
#(Different in each computer); 
data<-read.csv("/Users/pooneh/Desktop/analyst-data.csv", header=TRUE)
#attach(data)


data <- rename(data, c(v1="normal", v2="poisson", v3="gauss"))
names(data) <- c("id", "time", "cats", "normal", "poisson", "gauss")



# To determine if there are significant category (cats) effects,
# First we can use side-by-side boxplots to have an overview of the impact of categories
# of "cats" on "gauss";
dev.new()    # Save plots to eps file;
postscript("side-by-side boxplot of gauss by cats.eps", paper="letter")   # Name of the saved file which is included the plot;
boxplot(gauss~cats, xlab=expression("Levels of 'cats'"), ylab=expression("gauss"))
mtext(expression("side-by-side boxplot of 'gauss' by 'cats'"), padj=-1)
dev.off()

## From side-by-side boxplot, we can see that there is a difference in 
# the "gauss" values which are in the third category comparing other two
# categories;
# Categories one and two are slightly different.
# (A lot of outliers are also observed in all categories).


# Then use a linear mix model to verify our claim;
install.packages("lme4")
library(lme4)
model1<-lmer(gauss~cats+(1|id), REML=FALSE)  # Use ML approach;
s1=summary(model1)
print(s1)

## "id" does not show too much variability (Variance close to zero), 
# so it makes sense to consider it as random effect.

## For the fixed effect, "cats", which is a categorical variable:
# gauss is higher for cats='three' than cats='one' by 7.99,
# and it is higher in cats='two' than cats='one' by 3.99.
# So we can say categories 'one' and 'two' are included more similar values of "gauss" than category 'three'.
 

# we can also use Anova which gives us p-value;
install.packages("car")
library(car)
A1=Anova(model1)
print(A1)

## From p-value obtained from Wald-type chi-sq test which is very small (< 2.2e-16),
# we may say there is a significant difference in "gauss" values 
# corresponding the different levels of "cats" considering "id" as a random effect.
# BUT unfortunately, p-values for mixed models are not as straightforward as they are for the linear model,



##################
### CINCLUSION ###
##################
## Thus, we can conclude that there is a SLIGHT difference in "gauss" values
# corresponding to the three different categories of variable "cats". 


#sink()

