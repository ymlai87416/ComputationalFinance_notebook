# All data and CER parameters are preloaded in your workspace.  Type 'ls()' in the console to see them.

# The efficient frontier of risky assets 
efficient_frontier = efficient.frontier(mu_hat_month, cov_mat_month, alpha.min=-1, alpha.max=1)
summary(efficient_frontier)

# The plot
plot(efficient_frontier, plot.assets=TRUE, col="blue", lwd=2)  
