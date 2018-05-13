set.seed(123);
# Simulate 250 observations from the described MA(1) model
ma1_sim = arima.sim(model=list(ma=0.5), n=250, mean=0, sd=0.1) + 0.05;
# Generate the theoretical ACF with upto lag 10
acf_ma1_model = ARMAacf(ma = 0.5, lag.max = 10, pacf = FALSE)

# Split plotting window in three rows
par(mfrow=c(3,1))
# First plot: The simulated observations
plot(ma1_sim, type="l",main="MA(1) Process: mu=0.05, theta=0.5",xlab="time",ylab="y(t)")
abline(h=0)
# Second plot: Theoretical ACF
plot(1:10, acf_ma1_model[2:11], type="h", col="blue",  ylab="ACF", main="theoretical ACF")
# Third plot: Sample ACF
tmp = acf(ma1_sim, lag.max = 10)
  # Reset graphical window to only one graph
  par(mfrow=c(1,1))
