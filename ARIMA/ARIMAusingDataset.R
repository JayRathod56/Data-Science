data <- read.csv("Z:\\Jay\\Data Science Advance\\ARIMA\\Dataset1.csv")
print(data)
head(data)


N <- 3 # how many periods lookback
n_ahead <- 10 # how many periods forecast

# build autoregressive model with ar.ols()
model_ar <- ar.ols(data, order.max = N) # ar-model
pred_ar <- predict(model_ar, n.ahead = n_ahead)
pred_ar$pred


plot(data, xlim = c(1, length(data) + 15), ylim = c(min(data), max(data) + 10))
lines(pred_ar$pred, col = "blue", lwd = 5)

