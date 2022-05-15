#import dataset
dataset = read.csv("Z:\\Jay\\Data Science Advance\\K-fold Validation\\Salary_Data.csv")

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

