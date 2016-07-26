function [EucDist,p1,p2] = EucDistance(A)
%Input: N by 7 array of swc file
%Output: NOT Largest Euclidean Distance of Neuron, will run through all
%nodes in the future
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


% hold on
% plot_neuron(A);
% title('Maximum Euclidean Distance','fontsize', 40);
% plot3([A(p1,3) A(p2,3)],[A(p1,4) A(p2,4)],[A(p1,5) A(p2,5)],'linewidth',5);
% box on;
% hold off
end

