function result = shortestdendrite(data, s, thr)
%SHORTESTDENDRITE finds the length of the shortest dendrite
%Input - data - n-by-7 matrix data from neuron file (.swc file)
%s - soma coordinate
%Output - result - length of the shortest dendrite 

leaf = leafnode(data);
dis = distancesoma(data);

ds = bsxfun(@minus, data(:,3:4), s);
dslen = sqrt(sum(ds.^2,2))';
soma = dslen < thr;

result = min(dis(dis>0&leaf&~soma));
end
