VBLTX_prices = get.hist.quote(instrument="vbltx", start="2005-09-01", end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")
FMAGX_prices = get.hist.quote(instrument="fmagx", start="2005-09-01", end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")
SBUX_prices = get.hist.quote(instrument="sbux", start="2005-09-01",end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")

# Change the class of the time index to yearmon, which is appropriate for monthly data.
# index() and as.yearmon() are functions in the zoo package 
index(VBLTX_prices) = as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) = as.yearmon(index(FMAGX_prices))
index(SBUX_prices) = as.yearmon(index(SBUX_prices))

# Create merged price data
all_prices = merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
# Rename columns
colnames(all_prices) = c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns = diff(log(all_prices))

# Create matrix with returns
return_matrix = coredata(all_returns)

# The variable return_matrix is preloaded in your workspace

# Number of observations
n_obs = nrow(return_matrix)

# Estimates of sigma2hat
sigma2hat_vals = apply(return_matrix, 2, var)
sigma2hat_vals

# Standard Error of sigma2hat
se_sigma2hat = sigma2hat_vals/sqrt(n_obs/2)

se_sigma2hat

# Calculate the correlation matrix
cor_matrix = var(return_matrix)

# Get the lower triangular part of that 'cor_matrix'
rhohat_vals = cor_matrix[lower.tri(cor_matrix)]

# Set the names
names(rhohat_vals) <- c("VBLTX,FMAGX","VBLTX,SBUX","FMAGX,SBUX")

# Compute the estimated standard errors for correlation
se_rhohat = (1-rhohat_vals)/sqrt(n_obs)

se_rhohat

t.test(all_returns[,"VBLTX"])

t.test(all_returns[,"FMAGX"])

cor.test(all_returns[,"VBLTX"], all_returns[,"FMAGX"])

cor.test(all_returns[,"VBLTX"], all_returns[,"SBUX"])

jarque.bera.test(all_returns[,"VBLTX"])

jarque.bera.test(all_returns[,"FMAGX"])

library("boot")
# Function for bootstrapping sample mean: 
mean_boot = function(x, idx) {
  ans = mean(x[idx])
  ans 
} 
# Construct VBLTX_mean_boot:
VBLTX_mean_boot = boot(return_matrix[,"VBLTX"], mean_boot, R = 999)
# Print the class of VBLTX_mean_boot
class(VBLTX_mean_boot)

# Print VBLTX_mean_boot
VBLTX_mean_boot

# Plot bootstrap distribution and qq-plot against normal
plot(VBLTX_mean_boot)