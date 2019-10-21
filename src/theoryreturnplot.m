% Code to plot a 'simulated' return level for 
% demonstration purposes

x = linspace(0,10);
% Creating a random sample between 0 and 10.
X = 10*rand(100, 1);

% Fitting a GEV distribution to the sample
param = pwmfitgev(X, true, 0.35); 

% Fitting a Gumbel distribution to the sample.
param1 = pwmfitgumbel(X, true, 0.35); 


% Plotting the Return Levels
plot(x,1./(1-gevcdf(x, param(1), param(2), param(3))),'r');
hold on;
plot(x,1./(1-evcdf(x,double(param1(1)), double(param1(2)))),'b');

% Legend, Title, etc.
legend('GEV', 'Gumbel')
xlabel('Return Level');
ylabel('Return Period');
title('Plot of return levels from random samples');
hold off

