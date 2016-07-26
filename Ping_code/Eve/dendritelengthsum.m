function result = dendritelengthsum(data, s, thr)
% DENDRITELENGTHSUM finds the sum of the dendrite lengths
% input = data - n-by-7 matrix data from neuron file (.swc file)
% output = result - sum of dendrite lengths 

leaf = leafnode(data);
dis = distancesoma(data);

ds = bsxfun(@minus, data(:,3:4), s);
dslen = sqrt(sum(ds.^2,2))';
soma = dslen < thr;

result = sum(dis(leaf&~soma));

end

