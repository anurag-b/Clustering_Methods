function [cluster1,cluster2] = spectral_clustering(data)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[features N]=size(data);
%% perform spectral clustering
W = zeros(N,N);
D = zeros(N,N);

for i=1:N
    for j=1:N
        xixj2 = (data(1,i)-data(1,j))^2 + (data(2,i)-data(2,j))^2 ;
        W(i,j) =  exp(-1*xixj2 /10 ) ;   % compute weight here %(2*sigma^2)
        %          if (i==j)
        %              W(i,j)=0;
        %          end;
    end
    D(i,i) = sum(W(i,:))    ;
end

L = D - W ;

% Ng-Jordan-Weiss Algorithm
normL = D^-0.5*L*D^-0.5;
[u,s,v] = svd(normL);

%% New code below this point
c1 = find(u(:,end-1) >= 0);
c2 = find(u(:,end-1) < 0);
cluster1 = data(:,c1);
cluster2 = data(:,c2);
end

