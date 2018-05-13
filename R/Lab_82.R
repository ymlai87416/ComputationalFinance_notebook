# All data is preloaded in your workspace.  Type 'ls()' in the console to see what has been loaded.

# Parameters CER model
mu_hat_month = apply(returns_df, 2, mean)
mu_hat_month
sigma2_month = apply(returns_df, 2, var)

sigma2_month
sigma_month = apply(returns_df, 2, sd)

sigma_month
cov_mat_month = var(returns_df)
cov_mat_month
cor_mat_month = cor(returns_df)

cor_mat_month

# Pairwise scatterplots
pairs(coredata(returns_df), col="blue", pch=16)