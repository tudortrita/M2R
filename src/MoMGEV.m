function [para] = MoMGEV(X)
g = skewness(X); v = var(X); m = mean(X);
h = linspace(-0.5,0.5,10000);
y = []; 
for i = 1:length(h)
y(i) = sign(h(i))*(-gamma(1+3*h(i))+3*gamma(1+h(i))*gamma(1+2*h(i))-2*(gamma(1+h(i)))^3)/((gamma(1+2*h(i))-(gamma(1+h(i)))^2)^1.5) - g;
end
p = find(abs(y)<=min(abs(y)));
k = h(p);
s = (sign(k)*sqrt(v)*k)/((gamma(1+2*k)-(gamma(1+k))^2)^0.5);
mu = m - (s/k)*(1-gamma(1+k));
para(1) = mu; para(2) = s; para(3) = -k;
end