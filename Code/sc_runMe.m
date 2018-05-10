clc;
clear all;

%% Load the data
data = load('/home/dark_knight/UMD/Courses/ENEE439M/data2.mat');
[features N] = size(data.X);;
prompt = 'Enter the the number of classes 2 or 4 or 8\n';
c = input(prompt);

%% Plot to visualise the data
figure; hold on;
for i=1:N
    plot(data.X(1,i), data.X(2,i),'o');
end

%% perform spectral clustering
[cluster1 cluster2]= spectral_clustering(data.X);
[c1_1 c1_2] = spectral_clustering(cluster1);
[c2_1 c2_2] = spectral_clustering(cluster2);
[c1 c2] = spectral_clustering(c1_1);
[c3 c4] = spectral_clustering(c1_2);
[c5 c6] = spectral_clustering(c2_1);
[c7 c8] = spectral_clustering(c2_2);

figure(gcf);
clf;
if c==2
    plot(cluster1(1,:),cluster1(2,:),'.b');
    hold on
    plot(cluster2(1,:),cluster2(2,:),'.r');
    axis equal;
    grid on;
    title(sprintf('Spectral Clustering for cluster size =%d',c));
    hold off
elseif c==4
    plot(c1_1(1,:),c1_1(2,:),'.b');
    hold on
    plot(c1_2(1,:),c1_2(2,:),'*g');
    plot(c2_1(1,:),c2_1(2,:),'or');
    plot(c2_2(1,:),c2_2(2,:),'+m');
    axis equal;
    grid on;
    title(sprintf('Spectral Clustering for cluster size =%d',c));
    hold off
elseif c==8
    plot(c1(1,:),c1(2,:),'.b');
    hold on
    plot(c2(1,:),c2(2,:),'*g');
    plot(c3(1,:),c3(2,:),'or');
    plot(c4(1,:),c4(2,:),'+m');
    plot(c5(1,:),c5(2,:),'xc');
    plot(c6(1,:),c6(2,:),'sy');
    plot(c7(1,:),c7(2,:),'dk');
    plot(c8(1,:),c8(2,:),'^b');
    axis equal;
    grid on;
    title(sprintf('Spectral Clustering for cluster size =%d',c));
    hold off
else
    display('Invalid number of clusters selected');
    return;
end

%% Calculate the mean squared error
if c==2
    sum_error_sq_c1 = 0;
    sum_error_sq_c2 = 0;
    mean_1 = mean(cluster1,2);
    mean_2 = mean(cluster2,2);
    for i = 1:size(cluster1,2);
        sum_error_sq_c1 = sum_error_sq_c1 + norm(cluster1(:,i) - mean_1)^2;
    end
    for i = 1:size(cluster2,2);
        sum_error_sq_c2 = sum_error_sq_c2 + norm(cluster2(:,i) - mean_2)^2;
    end
    total_sum_squared_error = sum_error_sq_c1 + sum_error_sq_c2;
    fprintf('Sum Squared Error = %f\n',total_sum_squared_error);
elseif c==4
    sum_error_sq_c1 = 0;
    sum_error_sq_c2 = 0;
    sum_error_sq_c3 = 0;
    sum_error_sq_c4 = 0;
    mean_1 = mean(c1_1,2);
    mean_2 = mean(c1_2,2);
    mean_3 = mean(c2_1,2);
    mean_4 = mean(c2_2,2);
    for i = 1:size(c1_1,2);
        sum_error_sq_c1 = sum_error_sq_c1 + norm(c1_1(:,i) - mean_1)^2;
    end
    for i = 1:size(c1_2,2);
        sum_error_sq_c2 = sum_error_sq_c2 + norm(c1_2(:,i) - mean_2)^2;
    end
    for i = 1:size(c2_1,2);
        sum_error_sq_c3 = sum_error_sq_c3 + norm(c2_1(:,i) - mean_3)^2;
    end
    for i = 1:size(c2_2,2);
        sum_error_sq_c4 = sum_error_sq_c4 + norm(c2_2(:,i) - mean_4)^2;
    end
    total_sum_squared_error = sum_error_sq_c1 + sum_error_sq_c2 + sum_error_sq_c3 + sum_error_sq_c4;
    fprintf('Sum Squared Error = %f\n',total_sum_squared_error);
elseif c==8
    sum_error_sq_c1 = 0;
    sum_error_sq_c2 = 0;
    sum_error_sq_c3 = 0;
    sum_error_sq_c4 = 0;
    sum_error_sq_c5 = 0;
    sum_error_sq_c6 = 0;
    sum_error_sq_c7 = 0;
    sum_error_sq_c8 = 0;
    mean_1 = mean(c1,2);
    mean_2 = mean(c2,2);
    mean_3 = mean(c3,2);
    mean_4 = mean(c4,2);
    mean_5 = mean(c5,2);
    mean_6 = mean(c6,2);
    mean_7 = mean(c7,2);
    mean_8 = mean(c8,2);
    for i = 1:size(c1,2);
        sum_error_sq_c1 = sum_error_sq_c1 + norm(c1(:,i) - mean_1)^2;
    end
    for i = 1:size(c2,2);
        sum_error_sq_c2 = sum_error_sq_c2 + norm(c2(:,i) - mean_2)^2;
    end
    for i = 1:size(c3,2);
        sum_error_sq_c3 = sum_error_sq_c3 + norm(c3(:,i) - mean_3)^2;
    end
    for i = 1:size(c4,2);
        sum_error_sq_c4 = sum_error_sq_c4 + norm(c4(:,i) - mean_4)^2;
    end
    for i = 1:size(c5,2);
        sum_error_sq_c5 = sum_error_sq_c5 + norm(c5(:,i) - mean_5)^2;
    end
    for i = 1:size(c6,2);
        sum_error_sq_c6 = sum_error_sq_c6 + norm(c6(:,i) - mean_6)^2;
    end
    for i = 1:size(c7,2);
        sum_error_sq_c7 = sum_error_sq_c7 + norm(c7(:,i) - mean_7)^2;
    end
    for i = 1:size(c8,2);
        sum_error_sq_c8 = sum_error_sq_c8 + norm(c8(:,i) - mean_8)^2;
    end
    total_sum_squared_error = sum_error_sq_c1 + sum_error_sq_c2 + sum_error_sq_c3 + sum_error_sq_c4 + sum_error_sq_c5 + sum_error_sq_c6 + sum_error_sq_c7 + sum_error_sq_c8;
    fprintf('Sum Squared Error = %f\n',total_sum_squared_error);
end


% Calculate determinant criteria
if c==2
    sw = 0;
    si_1 = 0;
    si_2 = 0;
    mean_1 = mean(cluster1,2);
    mean_2 = mean(cluster2,2);
    for i = 1:size(cluster1,2)
        x_hat = cluster1(:,i) - mean_1;
        si_1 = si_1 + (x_hat * x_hat');
    end
    for i = 1:size(cluster2,2)
        x_hat = cluster2(:,i) - mean_2;
        si_2 = si_2 + (x_hat * x_hat');
    end
    sw = si_1 + si_2;
elseif c==4
    sw = 0;
    si_1 = 0;
    si_2 = 0;
    si_3 = 0;
    si_4 = 0;
    mean_1 = mean(c1_1,2);
    mean_2 = mean(c1_2,2);
    mean_3 = mean(c2_1,2);
    mean_4 = mean(c2_2,2);
    for i = 1:size(c1_1,2)
        x_hat = c1_1(:,i) - mean_1;
        si_1 = si_1 + (x_hat * x_hat');
    end
    for i = 1:size(c1_2,2)
        x_hat = c1_2(:,i) - mean_2;
        si_2 = si_2 + (x_hat * x_hat');
    end
    for i = 1:size(c2_1,2)
        x_hat = c2_1(:,i) - mean_3;
        si_3 = si_3 + (x_hat * x_hat');
    end
    for i = 1:size(c2_2,2)
        x_hat = c2_2(:,i) - mean_4;
        si_4 = si_4 + (x_hat * x_hat');
    end
    sw = si_1 + si_2 + si_3 + si_4;
elseif c==8
    sw = 0;
    si_1 = 0;
    si_2 = 0;
    si_3 = 0;
    si_4 = 0;
    si_5 = 0;
    si_6 = 0;
    si_7 = 0;
    si_8 = 0;
    mean_1 = mean(c1,2);
    mean_2 = mean(c2,2);
    mean_3 = mean(c3,2);
    mean_4 = mean(c4,2);
    mean_5 = mean(c5,2);
    mean_6 = mean(c6,2);
    mean_7 = mean(c7,2);
    mean_8 = mean(c8,2);
    for i = 1:size(c1,2)
        x_hat = c1(:,i) - mean_1;
        si_1 = si_1 + (x_hat * x_hat');
    end
    for i = 1:size(c2,2)
        x_hat = c2(:,i) - mean_2;
        si_2 = si_2 + (x_hat * x_hat');
    end
    for i = 1:size(c3,2)
        x_hat = c3(:,i) - mean_3;
        si_3 = si_3 + (x_hat * x_hat');
    end
    for i = 1:size(c4,2)
        x_hat = c4(:,i) - mean_4;
        si_4 = si_4 + (x_hat * x_hat');
    end
    for i = 1:size(c5,2)
        x_hat = c5(:,i) - mean_5;
        si_5 = si_5 + (x_hat * x_hat');
    end
    for i = 1:size(c6,2)
        x_hat = c6(:,i) - mean_6;
        si_6 = si_6 + (x_hat * x_hat');
    end
    for i = 1:size(c7,2)
        x_hat = c7(:,i) - mean_7;
        si_7 = si_7 + (x_hat * x_hat');
    end
    for i = 1:size(c8,2)
        x_hat = c8(:,i) - mean_8;
        si_8 = si_8 + (x_hat * x_hat');
    end
    sw = si_1 + si_2 + si_3 + si_4 + si_5 + si_6 + si_7 + si_8;
end
jd = det(sw);
fprintf('Determinant Criteria = %f\n',jd);
% Calculate minimum variance
if c == 2
    temp1 = 0;
    temp2 = 0;
    for i = 1:size(cluster1,2)
        for j = 1:size(cluster1,2)
            temp1 = temp1 + norm(cluster1(:,i) - cluster1(:,j))^2;
        end
    end
    s1 = temp1/size(cluster1,2)^2;
    for i = 1:size(cluster2,2)
        for j = 1:size(cluster2,2)
            temp2 = temp2 + norm(cluster2(:,i) - cluster2(:,j))^2;
        end
    end
    s2 = temp2/size(cluster2,2)^2;
    je = ((size(cluster1,2)*s1) + (size(cluster2,2)*s2))/2;
    fprintf('Minimum Variance = %f\n',je);
elseif c == 4
    temp1 = 0;
    temp2 = 0;
    temp3 = 0;
    temp4 = 0;
    for i = 1:size(c1_1,2)
        for j = 1:size(c1_1,2)
            temp1 = temp1 + norm(c1_1(:,i) - c1_1(:,j))^2;
        end
    end
    s1 = temp1/size(c1_1,2)^2;
    for i = 1:size(c1_2,2)
        for j = 1:size(c1_2,2)
            temp2 = temp2 + norm(c1_2(:,i) - c1_2(:,j))^2;
        end
    end
    s2 = temp2/size(c1_2,2)^2;
    for i = 1:size(c2_1,2)
        for j = 1:size(c2_1,2)
            temp3 = temp3 + norm(c2_1(:,i) - c2_1(:,j))^2;
        end
    end
    s3 = temp3/size(c2_1,2)^2;
    for i = 1:size(c2_2,2)
        for j = 1:size(c2_2,2)
            temp4 = temp4 + norm(c2_2(:,i) - c2_2(:,j))^2;
        end
    end
    s4 = temp4/size(c2_2,2)^2;
    je = ((size(c1_1,2)*s1) + (size(c1_2,2)*s2) + (size(c2_1,2)*s3) + (size(c2_2,2)*s4))/2;
    fprintf('Minimum Variance = %f\n',je);
elseif c == 8
    temp1 = 0;
    temp2 = 0;
    temp3 = 0;
    temp4 = 0;
    temp5 = 0;
    temp6 = 0;
    temp7 = 0;
    temp8 = 0;
    for i = 1:size(c1,2)
        for j = 1:size(c1,2)
            temp1 = temp1 + norm(c1(:,i) - c1(:,j))^2;
        end
    end
    s1 = temp1/size(c1,2)^2;
    for i = 1:size(c2,2)
        for j = 1:size(c2,2)
            temp2 = temp2 + norm(c2(:,i) - c2(:,j))^2;
        end
    end
    s2 = temp2/size(c2,2)^2;
    for i = 1:size(c3,2)
        for j = 1:size(c3,2)
            temp3 = temp3 + norm(c3(:,i) - c3(:,j))^2;
        end
    end
    s3 = temp3/size(c3,2)^2;
    for i = 1:size(c4,2)
        for j = 1:size(c4,2)
            temp4 = temp4 + norm(c4(:,i) - c4(:,j))^2;
        end
    end
    s4 = temp4/size(c4,2)^2;
    for i = 1:size(c5,2)
        for j = 1:size(c5,2)
            temp1 = temp1 + norm(c5(:,i) - c5(:,j))^2;
        end
    end
    s5 = temp5/size(c5,2)^2;
    for i = 1:size(c6,2)
        for j = 1:size(c6,2)
            temp6 = temp6 + norm(c6(:,i) - c6(:,j))^2;
        end
    end
    s6 = temp6/size(c6,2)^2;
    for i = 1:size(c7,2)
        for j = 1:size(c7,2)
            temp7 = temp7 + norm(c7(:,i) - c7(:,j))^2;
        end
    end
    s7 = temp7/size(c7,2)^2;
    for i = 1:size(c8,2)
        for j = 1:size(c8,2)
            temp8 = temp8 + norm(c8(:,i) - c8(:,j))^2;
        end
    end
    s8 = temp8/size(c8,2)^2;
    je = ((size(c1,2)*s1) + (size(c2,2)*s2) + (size(c3,2)*s3) + (size(c4,2)*s4) + (size(c5,2)*s5) + (size(c6,2)*s6) + (size(c7,2)*s7) + (size(c8,2)*s8))^2;
    fprintf('Minimum Variance = %f\n',je);
end