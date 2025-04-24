# metachronal-swimming-analysis
Matlab code for analyzing numerical simulation results of metachronal swimming

# CTphi_space_Gaussian_interpolation.m 
It is used to plot contours of thrust coefficients. This code interpolates the results of numerical simulation with discontinuous parameters to obtain a continuous surface.
It can obtain figure 2C and D.

# CTxyplot_make.m
It is used to plot figure 2A. This code requires time-averaged thrust coefficients as input files. Corresponding author can be contacted for input files.

# MLdata.xlsx
This excel file contains two tables. Table 'literature data' provides all the available data surveyed according to the previous literature. These papers provide quantitative appendage spacing and the exact phase lags.
Table 'Re100+Re300' show time-averaged thrust coefficients and normalized time-averaged thrust coefficients for all the cases with Re=100 and 300. 
'phi_cor' represents normalized phase lag. 'spacing' represents dimensionless spacing s*. 'phi_boundary' represents collision phase lag.

# functiontest.m
It is used to fit the maximum lift coefficients and solve for the proposed fit parameters.

# inter_phi_contourML.m
It is used to solve collision phase lag and optimal phase lag implicitly.

# normalcurve.mlx
It is used to normalize the angle of the appendages obtained from literature.

# pearson_correction.m
It is used to perform pearson correction test and solve p-value. 'X' is an array of Reynolds numbers or dimensionless spacing. 'Y' is the average phase lag.
