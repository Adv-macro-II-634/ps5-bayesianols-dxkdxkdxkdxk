% HW5
clear
clc
close all
dataT = readtable('card.csv');
data = table2array(dataT);

lwage = data (:,33);
educ  = data (:,4);
exper = data (:,32);
SMSA  = data (:,23);
Race  = data (:,22);
Regi  = data (:,24);

X = [educ exper SMSA Race Regi];
Y = lwage;
[N,k] = size(X);
X_wI = [ones(N,1) X];


ols = fitlm(X,Y,'VarNames',{'educ','exper','smsa','black','south','lwage'});
df = ols.DFE;                                     
beta_hat_ini = table2array(ols.Coefficients(:, 1));  
se_beta_hat_ini = ols.Coefficients(:,2);              
var_beta_hat_ini = diag(ols.CoefficientCovariance);   
sigma_sq_hat_ini = ols.MSE;                       
sigma_hat_ini = ols.RMSE;
sigma_var_ini = 2/df*(sigma_sq_hat_ini);

save(fullfile(tempdir,'OLS_results'));