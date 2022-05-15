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

