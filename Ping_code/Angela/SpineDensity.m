function [ spineDens ] = SpineDensity(A,R)
%SpineDensity: finds the ratio of length of neuron over 2-D  estimated size
%by finding area of circle of minboundsphere of the neuron
% Input: Array A, n by 7, swc file
%Output: ratio of length over size of neuron(estimated
length = lengthSpine(A);
size = NeuronSize(R);
spineDens = length/size;
end

