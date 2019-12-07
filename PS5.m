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


