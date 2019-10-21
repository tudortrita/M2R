%data1 = the maxima of Greek earthquakes data (1901-2017)
%estimates parameters from initial sample [location, scale]
initialparame= [6.519436417; 0.656697667];

n = 117;  %size of each data set
nReps = 2000;  %number of data sets or 'experiments'
id = ceil(rand(n,nReps)*n);
bootstrapData2 = data1(id);
%'empty' matrix to fill in parameter estimates from 2000 resamples
paramresamplee= ones(2,2000);

%work out what parameter estimation method using (MoM, MLE, PWM) for gumbel
%change pwmfitgumbel to momgumbel / 'evfit' function
for i=1:2000
    paramresamplee(:,i)=pwmfitgumbel(bootstrapData2(:,i),true,0.35);
end

%bootstrap difference for each parameter estimate 
%deltastar1e for location
deltastar1e= paramresamplee(1,:) - initialparame(1)*ones(1,2000);
%deltastar1e for scale
deltastar2e= paramresamplee(2,:) - initialparame(2)*ones(1,2000);

%work out quantiles of deltastar, 0.025 and 0.975
%95% confidence interval for parameter
%location 95% bootstrap ci [CI11e, CI12e]
CI11e = initialparame(1) - quantile(deltastar1e, 0.975);
CI12e = initialparame(1) - quantile(deltastar1e, 0.025);
%shape 95% bootstrap ci [CI21e, CI22e]
CI21e = initialparame(2) - quantile(deltastar2e, 0.975);
CI22e = initialparame(2) - quantile(deltastar2e, 0.025);