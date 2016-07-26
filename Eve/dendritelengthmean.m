function [Mean, STD] = dendritelengthmean(data, s, thr)
% DENDRITELENGTHSUM finds the mean of the dendrite lengths
% input = data - n-by-7 matrix data from neuron file (.swc file)
% output = Mean - mean of dendrite lengths, STD = standard deviation of dendrite lengths 

leaf = leafnode(data);
dis = distancesoma(data);

ds = bsxfun(@minus, data(:,3:4), s);
dslen = sqrt(sum(ds.^2,2))';
soma = dslen < thr;

Mean = mean(dis(leaf&~soma));
STD = std(dis(leaf&~soma));

end

