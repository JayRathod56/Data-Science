# R program to illustrate
# Time Series Analysis 
# Using ARIMA model in R

# Install the library for forecast()
install.packages("forecast")

# library required for forecasting 
library(forecast)

# Output to be created as png file
png(file = "TimeSeriesGFG.png")

# Plotting graph without forecasting
plot(BJsales, main = "Graph without forecasting",
     col.main = "darkgreen")

# Saving the file
dev.off()

# Output to be created as png file 
png(file = "TimeSeriesARIMAGFG.png")

# Fitting model using arima model 
fit <- auto.arima(BJsales)

# Next 10 forecasted values 
forecastedValues <- forecast(fit, 10)

# Print forecasted values
print(forecastedValues)

plot(forecastedValues, main = "Graph with forecasting",
     col.main = "darkgreen") 

# saving the file  
dev.off() 