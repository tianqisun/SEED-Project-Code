function [t, r] = trianglematrix(data)
%TRIANGLEMATRIX finds the distance between every leaf node to all the other
%leaf nodes and puts it in a table
%Input = data - n-by-7 matrix of neuron file
% Output = t - triangle matrix with values describing the length between
% each leaf node, r - longest distance between leaf nodes

result = leafnode(data);
n = size(data,1);
t = zeros(n,n);
idx = data(:,7) > 0;
G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);
for m = find(result);
    [~, ~, pred] = bfs(G,m);
    for f = find(result); 
        path = path_from_pred(pred,f);
        p = data(path,3:5);
        s = p(1:end-1, 1) - p(2:end,1);
        t(m, f) = sum(sqrt(sum(s.^2,2))); 
    end
end
t=t(result,result);
r = max(t(:));
end

