#install.packages("fpp")
library(fpp)
data(ausbeer)
print(ausbeer)
timeserie_beer = tail(head(ausbeer, 17*4+2),17*4-4)
plot(as.ts(timeserie_beer))

# Australian beer production clearly follows annual seasonality. 
#As it is recorded quarterly, 
#there are 4 data points recorded per year, 
#and we use a moving average window of 4.

#install.packages("forecast")
library(forecast)
trend_beer = ma(timeserie_beer, order = 4, centre = T)
plot(as.ts(timeserie_beer))
lines(trend_beer)
plot(as.ts(trend_beer))

#
#Step 3: Detrend the Time Series
#Removing the previously calculated trend from the time series will 
#result into a new time series that clearly exposes seasonality.
#
detrend_beer = timeserie_beer - trend_beer
plot(as.ts(detrend_beer))

# Step 4: Average the Seasonality
#Quarterly seasonality: we use a matrix of 4 rows. 
#The average seasonality is repeated 16 times 
#to create the graphic to be compared later

m_beer = t(matrix(data = detrend_beer, nrow = 4))
seasonal_beer = colMeans(m_beer, na.rm = T)
plot(as.ts(rep(seasonal_beer,16)))

#Step 5: Examining Remaining Random Noise
#The previous steps have already extracted most of the data 
#from the original time series, leaving behind only "random" noise.
#The additive formula is 
#"Time series = Seasonal + Trend + Random", 
#which means "Random = Time series - Seasonal - Trend"
random_beer = timeserie_beer - trend_beer - seasonal_beer
plot(as.ts(random_beer))

#Step 6: Reconstruct the Original Signal
#The additive formula is "Time series = Seasonal + Trend + Random", 
#which means "Random = Time series - Seasonal - Trend"
recomposed_beer = trend_beer+seasonal_beer+random_beer
plot(as.ts(recomposed_beer))

# DECOMPOSE( ) and STL(): Time Series Decomposition in R
# To make life easier, 
# some R packages provides decomposition with a single line of code.
# As expected, our step-by-step decomposition provides the same results 
# as the DECOMPOSE( ) and STL( ) functions (see the graphs).
#Additive
#The only requirement: seasonality is quarterly (frequency = 4)
#Using the DECOMPOSE( ) function:
ts_beer = ts(timeserie_beer, frequency = 4)
decompose_beer = decompose(ts_beer, "additive")

plot(as.ts(decompose_beer$seasonal))
plot(as.ts(decompose_beer$trend))
plot(as.ts(decompose_beer$random))
plot(decompose_beer)

#Now using the STL( ) function:
ts_beer = ts(timeserie_beer, frequency = 4)
stl_beer = stl(ts_beer, "periodic")
seasonal_stl_beer   <- stl_beer$time.series[,1]
trend_stl_beer     <- stl_beer$time.series[,2]
random_stl_beer  <- stl_beer$time.series[,3]

plot(ts_beer)
plot(as.ts(seasonal_stl_beer))
plot(trend_stl_beer)
plot(random_stl_beer)
plot(stl_beer)





#Multiplicative

#install.packages("Ecdat")
library(Ecdat)
data(AirPassengers)
timeserie_air = AirPassengers
plot(as.ts(timeserie_air))


#install.packages("forecast")
library(forecast)
trend_air = ma(timeserie_air, order = 12, centre = T)
plot(as.ts(timeserie_air))
lines(trend_air)
plot(as.ts(trend_air))

detrend_air = timeserie_air / trend_air
plot(as.ts(detrend_air))

m_air = t(matrix(data = detrend_air, nrow = 12))
seasonal_air = colMeans(m_air, na.rm = T)
plot(as.ts(rep(seasonal_air,12)))

random_air = timeserie_air / (trend_air * seasonal_air)
plot(as.ts(random_air))

recomposed_air = trend_air*seasonal_air*random_air
plot(as.ts(recomposed_air))





#Multiplicative with Decompose

ts_air = ts(timeserie_air, frequency = 12)
decompose_air = decompose(ts_air, "multiplicative")

plot(as.ts(decompose_air$seasonal))
plot(as.ts(decompose_air$trend))
plot(as.ts(decompose_air$random))
plot(decompose_air)

