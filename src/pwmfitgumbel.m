function paramhat = pwmfitgumbel(X, consistent, a)
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
for j = 1:n
    sum1 = sum1 + (j-1)/(n-1)*X(j);
end

ub1 = sum1/n;

%Consistent estimator - choose value of a between 0 and 1
sum3 = 0;
for j = 1:n
    sum3 = sum3 + ((j-a)/(n))*X(j);
end

cb1 = sum3/n;

% Which statistic to use?
if consistent
    b1 = cb1;
else
    b1 = ub1;
end

%Calculation of estimates for scale, location - orders used 0,1
sigma = (2*b1 - b0)/log(2);
mu = b0 - sigma*eulergamma;
paramhat = [vpa(sigma), vpa(mu)];
end
