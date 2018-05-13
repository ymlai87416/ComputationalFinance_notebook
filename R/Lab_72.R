# The returns_df data is preloaded in your workspace

# Estimate the parameters: multivariate
mu_hat_annual = apply(returns_df,2,mean)*12   
sigma2_annual = apply(returns_df,2,var)*12   
sigma_annual = sqrt(sigma2_annual)
cov_mat_annual = cov(returns_df)*12 
cov_hat_annual = cov(returns_df)[1,2]*12    
rho_hat_annual = cor(returns_df)[1,2]

# The annual estimates of the CER model parameters for Boeing and Microsoft
mu_boeing = mu_hat_annual["rboeing"]
mu_msft = mu_hat_annual["rmsft"]
sigma2_boeing =  sigma2_annual["rboeing"]
sigma2_msft = sigma2_annual["rmsft"]
sigma_boeing = sigma_annual["rboeing"]
sigma_msft = sigma_annual["rmsft"]
sigma_boeing_msft = cov_hat_annual
rho_boeing_msft =rho_hat_annual 