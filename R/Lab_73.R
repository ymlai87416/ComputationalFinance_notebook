# All data and CER parameters are preloaded in your workspace.
# Type "ls()" in the console to see them.

# The ratio Boeing stock vs Microsoft stock (adds up to 1)
boeing_weights = seq(from=-1, to=2, by=0.1)
msft_weights = 1-boeing_weights

# Portfolio parameters
mu_portfolio = boeing_weights * mu_boeing + msft_weights * mu_msft

sigma2_portfolio =  boeing_weights^2 * sigma2_boeing + msft_weights^2 * sigma2_msft + 2*boeing_weights*msft_weights*rho_boeing_msft*sigma_boeing*sigma_msft

sigma_portfolio = sqrt(sigma2_portfolio)

# Plotting the different portfolios
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="Microsoft", pos=4)
