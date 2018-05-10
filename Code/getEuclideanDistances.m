function dist = getEuclideanDistances(x1,x2)
% calculate every distances from each point in x1 to every points in x2.
%------------------------------ INPUT ------------------------------
% x1     : D X N1
% x2     : D X N2
%
%------------------------------ OUTPUT ------------------------------
% dist   : Distances from each point in x1 to every points in x2.
%          N1 X N2

[dim N1] = size(x1);
N2 = size(x2,2);
dist = zeros(N1,N2);
for i=1:1:N1
    dx = x2 - repmat(x1(:,i),1,N2);
    dist(i,:) = sqrt(sum(dx.*dx,1));
end
end