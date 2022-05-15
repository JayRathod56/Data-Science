install.packages("tidyverse")
install.packages("fpp2")
library(tidyverse)
library(fpp2) 

# create training and validation of the Google stock data
goog.train <- window(goog, end = 900)
goog.test <- window(goog, start = 901)

# create training and validation of the AirPassengers data
qcement.train <- window(qcement, end = c(2012, 4))
qcement.test <- window(qcement, start = c(2013, 1))

#######################################
## Simple Exponential Smoothing ##
######################################
ses.goog <- ses(goog.train, alpha = .2, h = 100)
autoplot(ses.goog)

#difference our data to remove the trend
# goog.dif represents the change in stock price from the previous day.
goog.dif <- diff(goog.train)
autoplot(goog.dif)

#we've effectively removed the trend from our data and 
#can reapply the SES model.
ses.goog.dif <- ses(goog.dif, alpha = .2, h = 100)
autoplot(ses.goog.dif)

#first we need to create a differenced validation set 
#since our training data was built on differenced data.
#then we can compare our forecasts to our validation data set.
#We see that performance measures are smaller on the test set than the training 
#so we are not overfitting our model.
goog.dif.test <- diff(goog.test)
accuracy(ses.goog.dif, goog.dif.test)

#we can tune our alpha parameter to identify the value that reduces our 
#forecasting error. Here we loop through alpha values from 0.01-0.99 
#and identify the level that minimizes our test RMSE. 
#Turns out that ??= 0.05 minimizes our prediction error.
# identify optimal alpha parameter
alpha <- seq(.01, .99, by = .01)
RMSE <- NA
for(i in seq_along(alpha)) {
  fit <- ses(goog.dif, alpha = alpha[i], h = 100)
  RMSE[i] <- accuracy(fit, goog.dif.test)[2,2]
}

# convert to a data frame and idenitify min alpha value
alpha.fit <- data_frame(alpha, RMSE)
alpha.min <- filter(alpha.fit, RMSE == min(RMSE))

# plot RMSE vs. alpha
ggplot(alpha.fit, aes(alpha, RMSE)) +
  geom_line() +
  geom_point(data = alpha.min, aes(alpha, RMSE), size = 2, color = "blue")  

# refit model with alpha = .05
ses.goog.opt <- ses(goog.dif, alpha = .05, h = 100)

# performance eval
accuracy(ses.goog.opt, goog.dif.test)
# plotting results
autoplot(ses.goog.opt) +
  theme(legend.position = "bottom")
autoplot(goog.dif.test) +
  autolayer(ses.goog.opt, alpha = .5) +
  ggtitle("Predicted vs. actuals for the test data set")
          
          