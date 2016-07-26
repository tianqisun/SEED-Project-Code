function [v] = heightandwidth(data)
%HEIGHTANDWIDTH find height and width of data
%Input:data - n-by-7 matrix from neuron file (swc file)
%Output:v - height and width of data
v = range(data(:,3:5));
end