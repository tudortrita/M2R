function paramhat = pwmfitgev(X, consistent, a)
% Setting consistent to be true will result in use of a consistent
% estimator.
% Setting consistent to be false will result in use of an unbiased
% estimator.
% The value a must between 0 and 1

n = length(X);
X = sort(X);
b0 = sum(X)/n;

%Unbiased estimator
sum1 = 0;
sum2 = 0;
for j = 1:n
    sum1 = sum1 + (j-1)/(n-1)*X(j);
    sum2 = sum2 + (((j-1)*(j-2))/((n-1)*(n-2)))*X(j);
end

ub1 = sum1/n;
ub2 = sum2/n;

%Consistent estimator - choose value of a between 0 and 1
sum3 = 0;
sum4 = 0;
for j = 1:n
    sum3 = sum3 + ((j-a)/(n))*X(j);
    sum4 = sum4 + ((j-a)/(n))^2*X(j);
end

cb1 = sum3/n;
cb2 = sum4/n;

% Which statistic to use?
if consistent
    b1 = cb1;
    b2 = cb2;
else
    b1 = ub1;
    b2 = ub2;
end

%Calculation of estimates for shape, scale, location - orders used 0,1,2
c = ((2*b1 - b0)/(3*b2 - b0)) - log(2)/log(3) ;
k = 7.8590*c + 2.9554*c^2;
sigma = ((2*b1 - b0)*k)/(gamma(1+k)*(1 - 2^(-k)));
mu = b0 + (sigma/k)*(gamma(1+k) - 1);
paramhat = [k, sigma, mu];
end
