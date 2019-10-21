%data1 = the maxima of Greek earthquakes data (1901-2017)
%estimates parameters from initial sample [shape, scale, location]
initialparam= [-0.124315603879923; 0.583335943880307; 5.92695649405941];

n = 117;  %size of each data set
nReps = 2000;  %number of data sets or 'experiments'
id = ceil(rand(n,nReps)*n);
bootstrapData = data1(id);
%'empty' matrix to fill in parameter estimates from 2000 resamples
paramresample= ones(3,2000);

%work out what parameter estimation method using (MoM, MLE, PWM) for GEV
%change pwmfitgev to momgev / 'gevfit' function
for i=1:2000
    paramresampleg(:,i)=pwmfitgev(bootstrapData(:,i), true, 0.35);
end

%bootstrap difference for each parameter estimate 
%deltastar1g for shape
deltastar1g= paramresampleg(1,:) - initialparam(1)*ones(1,2000);
%deltastar2g for scale
deltastar2g= paramresampleg(2,:) - initialparam(2)*ones(1,2000);
%deltastar3g for location
deltastar3g= paramresampleg(3,:) - initialparam(3)*ones(1,2000);

%work out quantiles of deltastar, 0.025 and 0.975
%95% confidence interval for parameter
%shape 95% bootstrap ci [CI11g, CI12g]
CI11g = initialparam(1) - quantile(deltastar1g, 0.975);
CI12g = initialparam(1) - quantile(deltastar1g, 0.025);
%scale 95% bootstrap ci [CI21g, CI22g]
CI21g = initialparam(2) - quantile(deltastar2g, 0.975);
CI22g = initialparam(2) - quantile(deltastar2g, 0.025);
%location 95% bootstrap ci [CI31g, CI32g]
CI31g = initialparam(3) - quantile(deltastar3g, 0.975);
CI32g = initialparam(3) - quantile(deltastar3g, 0.025);
