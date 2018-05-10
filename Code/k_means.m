clc;
clear all;
data = load('/home/dark_knight/UMD/Courses/ENEE439M/data1.mat');
%data = load('/home/dark_knight/UMD/Courses/ENEE439M/data2.mat');
% scatter(data.X(1,:),data.X(2,:));
[features N] = size(data.X);
cnt = 1;
prompt = 'Enter the the number of clusters\n';
K = input(prompt);

%% Initialise centers of K clusters
centers = data.X(:,randi(N,1,K));

%% Assign each data to closest center
distance = getEuclideanDistances(data.X, centers);
[minDist label] = min(distance,[],2);

%% Calculate the K-means with newly assigned clusters
for i = 1:K
    centers(:,i) = mean(data.X(:,label == i),2);
end

last_label = label;

while(1)
    cnt = cnt + 1;
    distance = getEuclideanDistances(data.X, centers);
    [minDist label] = min(distance,[],2);
    if label==last_label
        break;
    end
    for i = 1:K
        centers(:,i) = mean(data.X(:,label == i),2);
    end
    last_label = label;
end

figure(gcf);
clf;
hold on;
mkr = '.+*osd^x';
color = 'brgmcykb';
m = length(color);
c = max(label);
for i = 1:c
    plot(data.X(1,label==i),data.X(2,label==i),[mkr(i) color(i)]);%,'MarkerSize',5);
end
plot(centers(1,:),centers(2,:),['.' 'k'],'MarkerSize',15);
axis equal;
grid on;
title(sprintf('K-Means for cluster size =%d',c));
hold off;

error_temp =0;
cluster_1 = data.X(:,label==1);
for i = 1:size(cluster_1,2)
    error_temp = error_temp + (cluster_1(1,i)-centers(1,1))^2 + (cluster_1(2,i)-centers(2,1))^2;
end

sum_error_sq = 0;
total_sum_squared_error = 0;
%% Calculate the mean squared error
for i = 1:c
    cluster = data.X(:,label==i);
    for j = 1:size(cluster,2)
        sum_error_sq = sum_error_sq + norm(cluster(:,j) - centers(:,i))^2;
    end
    total_sum_squared_error = total_sum_squared_error + sum_error_sq;
end
sprintf('SSE = %f',total_sum_squared_error)
%% Calculate determinant criteria
sw = 0;
for i = 1:c
    cluster = data.X(:,label==i);
    si = 0;
    for j = 1:size(cluster,2)
        x_hat = cluster(:,j) - centers(:,i);
        si = si + (x_hat * x_hat');
    end
    sw = sw + si;
end
j_d = det(sw);
sprintf('Determinant Criteria = %f',j_d)
%% Calculate minimum variance
temp2 = 0;
for i = 1:c
    cluster = data.X(:,label==i);
    temp = 0;
    for j = 1:size(cluster,2)
        for k = 1:size(cluster,2)
            temp = temp + norm(cluster(:,j)-cluster(:,k))^2;
        end
    end
    si = temp/size(cluster,2)^2;
    temp2 = temp2 + (size(cluster,2)*si);
end
je = temp2/2;
sprintf('Minimum Variance = %f',je)