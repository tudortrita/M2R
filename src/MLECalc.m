taiwanmax = [6.5, 7.1 ,6.1 ,6.2, 7.3, 6.7, 6.7,6.8,6.5,7.1,7,7,6.6,6.4,6.9,6.8,6.3,6.6,6.8,6.7,6.4,6.9,6,6.2];
taiwanmaxtrunc = [6.8,6.5,7.1,7,7,6.6,6.4,6.9,6.8,6.3,6.6,6.8,6.7,6.4,6.9,6,6.2];
philmax = [7.5,7.5,6.5,6.5,6.4,6.3,6.4,6.9,6.6,7.6,6.4,7.6,7.2,6.6,6.1,6.3,6.9];

gevtaiwan = gevfit(taiwanmaxtrunc);
gevphil = gevfit(philmax);

gumbeltaiwan = evfit(taiwanmaxtrunc);
gumbelphil = evfit(philmax);

bootstrap = zeros(17, 10);
matrix = zeros(2,10);
for i = 1:10
   bootstrap(:,i) = philmax;
   matrix(:,i) = evfit(bootstrap(:,i));
end

matrix

