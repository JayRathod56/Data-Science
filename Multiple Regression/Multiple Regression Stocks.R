#import dataset
stock_data <- read.csv("Z:\\Jay\\Data Science Advance\\Multiple Regression\\APPL.csv")
head(stock_data)

#Then we split the dataset into training set and test set.
#The following code splits 70% of the data selected randomly into training set and
#the remaining 30% sample into test data set.
dt = sort(sample(nrow(stock_data), nrow(stock_data)*.7))
train<-stock_data[dt,]
test<-stock_data[-dt,]

#The lm function is used to fit linear models.
stock_model <-lm(High~Open+Low+Adj_Close+Volume,data=stock_data)
summary(stock_model)
#And we can apply this model to the test set to predict salary in test set.
stock_prediction = predict(stock_model , newdata = test)
##Then we can compare the predicted value and the real value.
prediction=data.frame(Year = test$Year,High = test$High, stock_Predict =
                        stock_prediction)
print(prediction)

library(ggplot2)
#blue color show stock predicted value
#red color show stock original values value
ggplot()+
  geom_line(data=prediction,mapping=aes(x=Year,y=High),color="red")+
  geom_line(data=prediction,mapping=aes(x=Year,y=stock_Predict),color="blue")+
  ggtitle("Original stock price vs Predicted stock price")

