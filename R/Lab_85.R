# All data and CER parameters are preloaded in your workspace.  Type 'ls()' in the console to see them.

# highest average return
mu_target = max(mu_hat_month)

# short sales allowed
efficient_porfolio_short = efficient.portfolio(mu_hat_month, cov_mat_month, mu_target, short=TRUE)

efficient_porfolio_short
plot(efficient_porfolio_short)

# no short sales allowed
efficient_porfolio_no_short = efficient.portfolio(mu_hat_month, cov_mat_month, mu_target, short=FALSE)

efficient_porfolio_no_short
plot(efficient_porfolio_no_short)