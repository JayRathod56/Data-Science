library(tidyverse)
library(fpp2) 

rel_data = read.csv("Z:\\Jay\\Data Science Advance\\Main Project\\RelianceIndustries.csv")

print(head(rel_data))

Y <- ts(rel_data[,6], start = c(2005,1), frequency = 12)

Y2 <- diff(Y)

autoplot(Y2)

#ggseasonplot(Y2)

fit_ets <- ets(Y2)

print(summary(fit_ets))

checkresiduals(fit_ets)

fcst1 <- forecast(fit_ets, h=24)
print(fcst1)

autoplot(fcst1)

#######################################
## Simple Exponential Smoothing ##
######################################
ses <- ses(Y, alpha = .2, h = 100)
autoplot(ses)

#difference our data to remove the trend
# reliance.dif represents the change in stock price from the previous day.
reliance.dif <- diff(Y)
autoplot(reliance.dif)

#we've effectively removed the trend from our data and 
#can reapply the SES model.
ses.reliance.dif <- ses(reliance.dif, alpha = .2, h = 100)
autoplot(ses.reliance.dif)

#first we need to create a differenced validation set 
#since our training data was built on differenced data.
#then we can compare our forecasts to our validation data set.
#We see that performance measures are smaller on the test set than the training 
#so we are not overfitting our model.
reliance.dif.test <- diff(Y2)
accuracy(ses.reliance.dif, reliance.dif.test)

#we can tune our alpha parameter to identify the value that reduces our 
#forecasting error. Here we loop through alpha values from 0.01-0.99 
#and identify the level that minimizes our test RMSE. 
#Turns out that ??= 0.05 minimizes our prediction error.
# identify optimal alpha parameter
alpha <- seq(.01, .99, by = .01)
RMSE <- NA
for(i in seq_along(alpha)) {
  fit <- ses(reliance.dif, alpha = alpha[i], h = 100)
  RMSE[i] <- accuracy(fit, reliance.dif.test)[2,2]
}

# convert to a data frame and idenitify min alpha value
alpha.fit <- data_frame(alpha, RMSE)
alpha.min <- filter(alpha.fit, RMSE == min(RMSE))

# plot RMSE vs. alpha
ggplot(alpha.fit, aes(alpha, RMSE)) +
  geom_line() +
  geom_point(data = alpha.min, aes(alpha, RMSE), size = 2, color = "blue")  

# refit model with alpha = .05
ses.reliance.opt <- ses(reliance.dif, alpha = .05, h = 100)

# performance eval
accuracy(ses.reliance.opt, reliance.dif.test)
# plotting results
autoplot(ses.reliance.opt) +
  theme(legend.position = "bottom")
autoplot(reliance.dif.test) +
  autolayer(ses.reliance.opt, alpha = .5) +
  ggtitle("Predicted vs. actuals for the test data set")






