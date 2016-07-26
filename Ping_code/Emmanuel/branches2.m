function result= branches2(data, thr)
% BRANCHES  count # of branches ,remove branchpoints within the threshold
% Input: data - n-by-7 matrix from neuron file (swc file), distance threshold
% Output: result - number of branches

% find all possible branch points
[n, b]= branches(data);

% remove branch points that are too close together
keep = true(n,1);
branchpoint = data(b, 3:5);
for i = 1:n
    idx = true(n,1); 
    idx(i) = false;
    points = branchpoint(keep & idx,:);
    d = bsxfun(@minus, points, branchpoint(i,:));
    d = sqrt(sum(d.^2, 2));
    if any(d < thr)
        keep(i) = false;
    end
end
result = sum(keep);

end