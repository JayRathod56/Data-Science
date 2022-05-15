#import dataset
dataset = read.csv("E:\\Jay\\Data Science Advance\\Simple Regression Model 2\\Salary_Data.csv")

#install and import library caTools
#caTools Contains several basic utility functions including: moving (rolling, running) 
#window statistic functions, read/write for GIF and ENVI binary files, fast 
#calculation of AUC, LogitBoost classifier,
#base64 encoder/decoder, round-off error free sum and cumsum, etc


#Then we split the dataset into training set and test set.
library(caTools)
split_data = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set_data = subset(dataset, split = TRUE)
test_set_data = subset(dataset, split = FALSE)

#The lm function is used to fit linear models. 
linear_regressor = lm(formula = Salary ~ YearsExperience, data = training_set_data)



#And we can apply this model to the test set to predict salary in test set.
salary_prediction = predict(linear_regressor, newdata = test_set_data)

##Then we can compare the predicted value and the real value.
print(data.frame(Salary = test_set_data$Salary, Salary_Predict = salary_prediction))



####We can also plot our data to visualize the linear model we have built. We will use ggplot2 to plot our data.
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set_data$YearsExperience, y = training_set_data$Salary), colour = 'green') +
  geom_point(aes(x = test_set_data$YearsExperience, y = test_set_data$Salary), colour = 'red') +
  geom_line(aes(x = training_set_data$YearsExperience, y = predict(linear_regressor, newdata = training_set_data)), colour = 'blue') +
  ggtitle('Salary vs Experience (Green: Training Set, Red: Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')


linearMod <- lm(dist ~ speed, data=cars)  # build linear regression model on full data
print(linearMod)
summary(linearMod)

# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))  # row indices for training data
trainingData <- cars[trainingRowIndex, ]  # model training data
testData  <- cars[-trainingRowIndex, ]   # test data

# Build the model on training data 
lmMod <- lm(dist ~ speed, data=trainingData) # build the model 
distPred <- predict(lmMod, testData) # predict distance


summary (lmMod)  # model summary
#Calculate prediction accuracy and error rates
actuals_preds <- data.frame(cbind(actuals=testData$dist, predicteds=distPred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)  # 82.7%
head(actuals_preds)


# Min-Max Accuracy Calculation
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  
# => 38.00%, min_max accuracy

# MAPE Calculation
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
# => 69.95%, mean absolute percentage deviation


# K-fold validation
library(DAAG)
cvResults <- suppressWarnings(CVlm(data = cars, form.lm=dist ~ speed, m=5, dots=FALSE, seed=29, legend.pos="topleft",  printit=FALSE, main="Small symbols are predicted values while bigger ones are actuals."));  # performs the CV
attr(cvResults, 'ms')

