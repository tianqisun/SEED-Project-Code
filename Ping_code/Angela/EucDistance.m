function [EucDist,p1,p2] = EucDistance(A)
%Input: N by 7 array of swc file
%Output: Largest Euclidean Distance of Neuron
k = find(degree(A)==1);
n = size(k,2);
newpoints = A(k,3:5);
    
% compute length
dis = zeros(n,n);
for i = 1:n;
    dis(i,i+1:n) = sqrt(sum(bsxfun(@minus,newpoints(i,1:3),newpoints(i+1:n,1:3)).^2,2)); 
end

[EucDist, idx] = max(dis(:));

[p1, p2] = ind2sub(size(dis), idx);
p1 = k(p1);
p2 = k(p2);


% point1 = A(newind(p1),3:5);
% point2 = A(newind(p2),3:5);
end

