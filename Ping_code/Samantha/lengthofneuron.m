function d = lengthofneuron (data) 
%LENGTHOFNEURON finds the distance between pairs of nodes that are
%connected by an edge and adds up all the distances for a value that
%represents the total distance of the neuron branch
%Input: data from a swc file
%Output: d, which represents the total length of the neuron

d = 0;

for i = 1: size(data,1)
    if data(i,7) > 0
                
    X = data(data(i,1),3) - data(data(i,7),3);
    Y = data(data(i,1),4) - data(data(i,7),4);
    Z = data(data(i,1),5) - data(data(i,7),5);
    d = d + sqrt (X^2 + Y^2 + Z^2);
    end
end