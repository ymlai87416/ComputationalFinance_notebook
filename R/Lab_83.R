# All data and CER parameters are preloaded in your workspace.  Type 'ls()' in the console to see them.

# Calculate the global minimum variance portfolio
global_min_var_portfolio = globalMin.portfolio(mu_hat_month, cov_mat_month, short=TRUE)

global_min_var_portfolio

# Plot the portfolio weights of our four stocks
plot(global_min_var_portfolio)