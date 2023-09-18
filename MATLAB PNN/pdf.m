function [temp] = pdf(centre, x, sigma)
temp = -sum((centre - x).^2);
temp = temp./(2*sigma*sigma);
temp = exp(temp);
