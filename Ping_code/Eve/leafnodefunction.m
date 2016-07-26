function result = leafnodefunction(data ,issoma)
% LEAFNODEFUNCTION count number of leaf nodes
% Input: data - n-by-7 matrix of neuron file (swc file)
% Output: result - number of leaf node

leaf = leafnode(data);
result = sum(leaf);
if issoma
    result = result - 2;
end
end


