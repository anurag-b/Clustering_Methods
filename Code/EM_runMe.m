clc;
clear all;

%temp_data = load('/home/dark_knight/UMD/Courses/ENEE439M/data1.mat');
temp_data = load('/home/dark_knight/UMD/Courses/ENEE439M/data2.mat');

data = temp_data.X;
prompt = 'Enter the the number of classes 2 or 4 or 8\n';
K = input(prompt);

%% Perform EM and get the parameters
[means covariance priors label] = EM(data,K);
disp('The means are:')
disp(means);
disp('The covariances are:')
disp(covariance);

%% Plot here
figure(gcf);
clf;
hold on;
mkr = '.+*osd^x';
color = 'brgmcykb';
m = length(color);
c = max(label);
for i = 1:c
    plot(data(1,label==i),data(2,label==i),[mkr(i) color(i)]);%,'MarkerSize',5);
end
plot(means(1,:),means(2,:),['.' 'k'],'MarkerSize',15);
axis equal;
grid on;
title(sprintf('2D GMM for cluster size =%d',c));
hold off;