# All data and CER parameters are preloaded in your workspace.
# Type "ls()" in the console to see them.

# Annual risk-free rate of 3% per year for the T-bill
t_bill_rate = 0.03

# Set of tangency portfolio weights
tangency_weights = seq(from=0, to=2, by=0.1)

# Portfolio parameters
mu_portfolio_tangency_bill = t_bill_rate + tangency_weights * (tangency_portfolio$er - t_bill_rate)

sigma_portfolio_tangency_bill = tangency_portfolio$sd*tangency_weights

# Plot previous exercises
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="MSFT", pos=4)

# Plot portfolio combinations of tangency portfolio and T-bills
text(x=tangency_portfolio$sd, y=tangency_portfolio$er, labels="Tangency", pos=2)
points(sigma_portfolio_tangency_bill, mu_portfolio_tangency_bill, col="blue", type="b", pch=16)