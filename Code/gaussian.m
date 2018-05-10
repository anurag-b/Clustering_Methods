function [prob] = gaussian(sample,mean,covariance)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
temp1 = (2*pi)^-1;
temp2 = det(covariance)^-0.5;
temp = temp1*temp2;
temp3 = sample -mean;
temp4 = inv(covariance);
exponent = exp(-0.5*temp3'*temp4*temp3);
prob = temp*exponent;
end

