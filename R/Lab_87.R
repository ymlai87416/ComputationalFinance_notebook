# All data and CER parameters are preloaded in your workspace.  Type 'ls()' in the console to see them.

# risk free rate
t_bill_rate = 0.005

# Tangency portfolio short sales allowed
tangency_portfolio_short = tangency.portfolio(mu_hat_month, cov_mat_month, risk.free=t_bill_rate, short=TRUE)

summary(tangency_portfolio_short)
#plot


# Tangency portfolio short sales not allowed
tangency_portfolio_no_short = tangency.portfolio(mu_hat_month, cov_mat_month, risk.free=t_bill_rate, short=FALSE)

summary(tangency_portfolio_no_short)
#plot
plot(tangency_portfolio_short)

plot(tangency_portfolio_no_short)