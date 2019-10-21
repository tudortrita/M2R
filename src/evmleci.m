data1= [5.8
6.6
8
7.8
7.4
5.7
6.2
6.4
6.1
6.2
6.5
7.3
5.7
6.1
6.5
5.8
6.1
6.2
7
6
6
6.9
6.6
5.5
5.8
7.3
6.5
7.1
5.2
6.2
6.8
7.1
6.7
6.3
7.1
5.5
5.6
6.1
7
6.1
6.3
6.1
5.8
7
6.4
6
6.7
7.2
7
5.3
5.6
6.6
7.4
6.7
7
7.4
7.1
6.5
6.9
6.4
6.4
6.6
6.3
7
5.9
6
6.6
6.7
6.6
5.4
5.3
6.1
5.5
5
5.7
5.6
5.9
6
6.8
6
6.3
6.4
6.6
5.9
5.3
5.5
5.4
5.5
5.4
5.5
5.3
5.8
5.4
5.9
6.1
6.1
6.1
5.5
5.4
5.4
5.3
6.1
5.9
6
5.7
6.4
5.5
6.5
5.8
5.4
6.2
5.8
6.2
6.3
6.1
5.5
6.2];

paramresamplee= ones(2,2000);
initialparame= [6.519436417; 0.656697667];

n = 117;  %size of each data set
nReps = 2000;  %number of data sets or 'experiments'
id = ceil(rand(n,nReps)*n);
bootstrapData2 = data1(id);

%work out what parameter is from statistic (MoM, MLE, PWM)
for i=1:2000
    paramresamplee(:,i)=evfit(bootstrapData2(:,i));
end

%bootstrap difference
deltastar1e= paramresamplee(1,:) - initialparame(1)*ones(1,2000);
deltastar2e= paramresamplee(2,:) - initialparame(2)*ones(1,2000);

%work out quantiles of deltastar, 0.025 and 0.975
%95% confidence interval for parameter
CI11e = initialparame(1) - quantile(deltastar1e, 0.975);
CI12e = initialparame(1) - quantile(deltastar1e, 0.025);
CI21e = initialparame(2) - quantile(deltastar2e, 0.975);
CI22e = initialparame(2) - quantile(deltastar2e, 0.025);