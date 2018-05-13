# All data and CER parameters are preloaded in your workspace.
# Type "ls()" in the console to see them.

# The tangency portfolio
tangency_portfolio =  tangency.portfolio(mu_hat_annual, cov_mat_annual, 0.03)

tangency_portfolio

# Summary of tangency_portfolio with annual risk free rate of 3%
summary(tangency_portfolio, risk.free=0.03)

# Portfolio weights Boeing and Microsoft
plot(tangency_portfolio)