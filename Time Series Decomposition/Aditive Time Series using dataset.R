library(fpp)
data <- AirPassengers
print(data)
timeseries_passengers = tail(head(data, 17*4+2),17*4-4)
print(timeseries_passengers)
plot(as.ts(timeseries_passengers))

library(forecast)
trend_passengers = ma(timeseries_passengers, order = 4, centre = T)
print(trend_passengers)
plot(as.ts(timeseries_passengers))
lines(trend_passengers)
plot(as.ts(trend_passengers))

detrend_passengers = timeseries_passengers - trend_passengers
plot(as.ts(detrend_passengers))

m_passengers = t(matrix(data = detrend_passengers, nrow = 4))
seasonal_passengers = colMeans(m_passengers, na.rm = T)
plot(as.ts(rep(seasonal_passengers,16)))

random_passengers = timeseries_passengers - trend_passengers - seasonal_passengers
plot(as.ts(random_passengers))

recomposed_passengers = trend_passengers+seasonal_passengers+random_passengers
plot(as.ts(recomposed_passengers))

ts_passengers = ts(timeseries_passengers, frequency = 4)
decompose_passengers = decompose(ts_passengers, "additive")

plot(as.ts(decompose_passengers$seasonal))
plot(as.ts(decompose_passengers$trend))
plot(as.ts(decompose_passengers$random))
plot(decompose_passengers)

ts_passengers = ts(timeseries_passengers, frequency = 4)
stl_passengers = stl(ts_passengers, "periodic")
seasonal_stl_passengers   <- stl_passengers$time.series[,1]
trend_stl_passengers     <- stl_passengers$time.series[,2]
random_stl_passengers  <- stl_passengers$time.series[,3]

plot(ts_passengers)
plot(as.ts(seasonal_stl_passengers))
plot(trend_stl_passengers)
plot(random_stl_passengers)
plot(stl_passengers)

library(Ecdat)
data(AirPassengers)
timeseries_air = AirPassengers
plot(as.ts(timeseries_air))

library(forecast)
trend_air = ma(timeseries_air, order = 12, centre = T)
plot(as.ts(timeseries_air))
lines(trend_air)
plot(as.ts(trend_air))

detrend_air = timeseries_air / trend_air
plot(as.ts(detrend_air))

m_air = t(matrix(data = detrend_air, nrow = 12))
seasonal_air = colMeans(m_air, na.rm = T)
plot(as.ts(rep(seasonal_air,12)))

random_air = timeseries_air / (trend_air * seasonal_air)
plot(as.ts(random_air))

recomposed_air = trend_air*seasonal_air*random_air
plot(as.ts(recomposed_air))

ts_air = ts(timeseries_air, frequency = 12)
decompose_air = decompose(ts_air, "multiplicative")

plot(as.ts(decompose_air$seasonal))
plot(as.ts(decompose_air$trend))
plot(as.ts(decompose_air$random))
plot(decompose_air)

