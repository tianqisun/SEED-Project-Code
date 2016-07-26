function [result, b]= branches(data)
% BRANCHES count number of branches
% Input: data - n-by-7 matrix from neuron file (swc file)
% Output: result - number of branches, b - logical vector

d = zeros(size(data,1),1);
for i= 2:size(data,1)
    d(data(i,1))=d(data(i,1))+1;
    d(data(i,7))=d(data(i,7))+1;
end
b = d>=3;
result = sum(b);
end