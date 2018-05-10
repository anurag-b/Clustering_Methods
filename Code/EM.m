function [means, covariance, priors, label] = EM(data, K)
%% initialise mean and covariance
[features N] = size(data);
means = randi([-5, 5], features, K);
covariance = zeros(features, features,K);
for i = 1:K
    covariance(:,:,i) = eye(features);
end

%% initialise expectation matrix
expectation = zeros(N,K);

%% initialise class prob as equal
priors = zeros(1,K);
for i = 1:K
    priors(1:i)=1/K;
end

%% Expectation Maximization begins here
for iter = 1:100
    %expectation step - Calculate expectation for each sample
    for i = 1:N
        px = 0;
        sample = data(:,i);
        for j = 1:K %for each class
            px = px + gaussian(sample, means(:,j),covariance(:,:,j))*priors(j);
        end
        for j = 1:K
            expectation(i,j) = gaussian(sample,means(:,j), covariance(:,:,j))/px;
        end
    end
    
    %maximaization step - Recalculates means and covariances for each class
    % Recalculate the means here
    for j = 1:K
        denominator = 0;
        numerator = 0;
        for k = 1:N
            denominator = denominator + expectation(k,j);
            numerator = numerator + expectation(k,j)*data(:,k);
        end
        means(:, j) = numerator/denominator;
    end
    % Recalculate the covariances here
    for j = 1:K
        denominator = 0;
        numerator = 0;
        for k = 1:N
            cov = data(:,k)-means(:,j);
            denominator = denominator + expectation(k,j);
            numerator = numerator + expectation(k,j)*cov*cov';
        end
        covariance(:,:, j) = numerator/denominator;
    end
end

%% Assign each sample to the class with maximum expectation
% recalculate the prior probabilities
clusters = zeros(1,N);
%assign clusters
for i = 1:N
    [~,I] = sort(expectation(i,:), 'descend');
    clusters(i) = I(1);
    priors(I(1)) = priors(I(1)) + 1;
end
priors = priors/N;
label = clusters';
end