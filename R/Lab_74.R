# All data and CER parameters are preloaded in your workspace.
# Type "ls()" in the console to see them.

# Annual risk-free rate of 3% per year for the T-bill
t_bill_rate = 0.03

# Ratio Boeing stocks
boeing_weights = seq(from=-1, to=2, by=0.1)

# Portfolio parameters
mu_portfolio_boeing_bill = boeing_weights * mu_boeing + (1-boeing_weights) * t_bill_rate

sigma_portfolio_boeing_bill = boeing_weights * sigma_boeing

# Plot previous exercise
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="MSFT", pos=4)

# Portfolio Combination Boeing and T-bills
points(sigma_portfolio_boeing_bill, mu_portfolio_boeing_bill, type="b", col="blue")