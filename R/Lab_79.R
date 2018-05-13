# All data and CER parameters are preloaded in your workspace.
# Type "ls()" in the console to see them.

# Define the portfolio ratio's
tangency_weight = 0.3
t_bill_weight = 1 - tangency_weight

# Define the portfolio parameters
mu_portfolio_efficient = t_bill_rate +  tangency_weight * (tangency_portfolio$er-t_bill_rate)

sd_portfolio_efficient = tangency_weight * tangency_portfolio$sd

# Plot previous exercises
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="MSFT", pos=4)
text(x=tangency_portfolio$sd, y=tangency_portfolio$er, labels="Tangency", pos=2)
points(sigma_portfolio_tangency_bill, mu_portfolio_tangency_bill, type="b", col="blue", pch=16)

# Plot Efficient Portfolio with 30% Tangency

text(x=sd_portfolio_efficient, y=mu_portfolio_efficient, labels="Efficient Portfolio with 30% Tangency", pos=4, cex=0.75)
points(sd_portfolio_efficient, mu_portfolio_efficient, type="p", pch=16, cex=2, col="orange")