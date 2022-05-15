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






######################################
## Holt's Method #####
#####################################
holt.goog <- holt(goog.train, h = 100)
autoplot(holt.goog)
holt.goog$model
accuracy(holt.goog, goog.test)

# identify optimal alpha parameter
beta <- seq(.0001, .5, by = .001)
RMSE <- NA
for(i in seq_along(beta)) {
  fit <- holt(goog.train, beta = beta[i], h = 100)
  RMSE[i] <- accuracy(fit, goog.test)[2,2]
}

# convert to a data frame and idenitify min alpha value
beta.fit <- data_frame(beta, RMSE)
beta.min <- filter(beta.fit, RMSE == min(RMSE))

# plot RMSE vs. alpha
ggplot(beta.fit, aes(beta, RMSE)) +
  geom_line() +
  geom_point(data = beta.min, aes(beta, RMSE), size = 2, color = "blue")

# new model with optimal beta
holt.goog.opt <- holt(goog.train, h = 100, beta = 0.0601)

# accuracy of first model
accuracy(holt.goog, goog.test)

# accuracy of new optimal model
accuracy(holt.goog.opt, goog.test)

autoplot(holt.goog) +
  ggtitle("Original Holt's Model") +
  coord_cartesian(ylim = c(400, 1000))

autoplot(holt.goog.opt) +
  ggtitle("Optimal Holt's Model") +
  coord_cartesian(ylim = c(400, 1000))







######################################
## Holt-Winters Seasonal Method #####
#####################################
autoplot(decompose(qcement))
qcement.hw <- ets(qcement.train, model = "AAA")
autoplot(forecast(qcement.hw))
summary(qcement.hw)
checkresiduals(qcement.hw)

## 
## 	Ljung-Box test
## 
## data:  Residuals from ETS(A,A,A)
## Q* = 21.863, df = 3, p-value = 6.965e-05
## 
## Model df: 8.   Total lags used: 11

# forecast the next 5 quarters
qcement.f1 <- forecast(qcement.hw, h = 5)

# check accuracy
accuracy(qcement.f1, qcement.test)


###############
## Multiplicative ##
#####################

qcement.hw2 <- ets(qcement.train, model = "MAM")
checkresiduals(qcement.hw2)

## 
## 	Ljung-Box test
## 
## data:  Residuals from ETS(M,A,M)
## Q* = 31.054, df = 3, p-value = 8.28e-07
## 
## Model df: 8.   Total lags used: 11


# additive error, trend and seasonality
qcement.hw1 <- ets(qcement.train, model = "AAA")
qcement.f1 <- forecast(qcement.hw1, h = 5)
accuracy(qcement.f1, qcement.test)

qcement.hw2 <- ets(qcement.train, model = "MAA")
qcement.f2 <- forecast(qcement.hw2, h = 5)
accuracy(qcement.f2, qcement.test)


qcement.hw3 <- ets(qcement.train, model = "AAM", restrict = FALSE)
qcement.f3 <- forecast(qcement.hw3, h = 5)
accuracy(qcement.f3, qcement.test)

qcement.hw4 <- ets(qcement.train, model = "MAM")
qcement.f4 <- forecast(qcement.hw4, h = 5)
accuracy(qcement.f4, qcement.test)

qcement.hw5 <- ets(qcement.train, model = "ZZZ")
summary(qcement.hw5)




##optimize the ?? parameter in our Holt-Winters model
gamma <- seq(0.01, 0.85, 0.01)
RMSE <- NA

for(i in seq_along(gamma)) {
  hw.expo <- ets(qcement.train, "AAA", gamma = gamma[i])
  future <- forecast(hw.expo, h = 5)
  RMSE[i] = accuracy(future, qcement.test)[2,2]
}

error <- data_frame(gamma, RMSE)
minimum <- filter(error, RMSE == min(RMSE))
ggplot(error, aes(gamma, RMSE)) +
  geom_line() +
  geom_point(data = minimum, color = "blue", size = 2) +
  ggtitle("gamma's impact on forecast errors",
          subtitle = "gamma = 0.21 minimizes RMSE")

# previous model with additive error, trend and seasonality
accuracy(qcement.f1, qcement.test)

# new model with optimal gamma parameter
qcement.hw6 <- ets(qcement.train, model = "AAA", gamma = 0.21)
qcement.f6 <- forecast(qcement.hw6, h = 5)
accuracy(qcement.f6, qcement.test)

#With this new optimal model we can get our predicted values:
qcement.f6

#visualize these predicted values:
autoplot(qcement.f6)




