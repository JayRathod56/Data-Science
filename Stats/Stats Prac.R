#Jay Rathod
#Statistics Practical

#data() returns a list of currently loaded datasets or loads a dataset.
data()

#Prints first 10 rows of the dataset
head(airquality, 10)

#dim() is used to get or set the dimension of the specified matrix, array or data frame.
dim(airquality)

#name() returns names of the columns
names(airquality)

#The View() invokes a spreadsheet-style data viewer on a matrix-like R object.
View(airquality)

#str() is used for compactly displaying the internal structure of a R object.
str(airquality)

#ls() is used to list the names of all the objects that are present in the working directory.
ls(airquality)
#lists all objects from the memory
ls()

#rm() is used to delete objects from the memory.
rm("actuals_preds")
# It can be used with ls() function to delete all objects.
rm(list=ls())


#Find the correlation coefficient of eruption duration and waiting time in the data set faithful.
#Observe if there is any linear relationship between the variables.
cor(faithful)

#           eruptions   waiting
# eruptions 1.0000000 0.9008112
# waiting   0.9008112 1.0000000

# Since the correlation values are greater than 0.2 there is a significant relationship between eruptions and waiting


# Generate the Sample and use the following to get the probability/sample for Binomial
# distribution
# dbinom(x, size, prob)
# pbinom(x, size, prob)
# qbinom(p, size, prob)
# rbinom(n, size, prob)


# Create a sample of 100 numbers which are incremented by 2.
x <- seq(0,100,by = 2)

#dbinom gives the probability density distribution at each point.
# Create the binomial distribution.
y <- dbinom(x,50,0.5)

#pbinom gives the cumulative probability of an event. 
#It is a single value representing the probability.
# Probability of getting 20 or less heads from a 96 tosses of a coin.
x <- pbinom(20,96,0.5)

print(x)

#qbinom takes the probability value and gives a number whose cumulative value matches the probability value.
# How many heads will have a probability of 0.25 will come out when a coin
# is tossed 51 times.
x <- qbinom(0.25,51,1/2)

print(x)

#rbimon generates required number of random values of given probability from a given sample
# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,0.4)

print(x)


# Generate the random sample between 4 to 8 where

# i. replacement is allowed
#means numbers can be repeated

sample(4:8,10, replace=TRUE)


# ii. replacement is not allowed
#means numbers cannot be repeated
sample(4:8,5, replace=FALSE)


# If the coin is tossed 3 times generate the sample in tabular form along with the probability of each combination. 
library(prob)

s <- tosscoin(3)

print(s)

#probablity of each outcome
p <- probspace(tosscoin(3))


#Plot the Histogram and scatterplot using R internal data set.

#scatter plot
plot(p)

#histogram plot
hist(p$probs, )

