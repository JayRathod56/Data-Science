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
