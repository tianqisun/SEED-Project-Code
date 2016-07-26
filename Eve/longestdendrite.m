function result = longestdendrite(data)
%LONGESRDENDRITE finds the length of the longest dendrite
%Input - data - n-by-7 matrix data from neuron file (.swc file)
%Output - result - length of the longest dendrite 

leaf = leafnode(data);
dis = distancesoma(data);
result = max(dis(leaf));

end

