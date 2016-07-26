function [LOA] = LengthOverArea(A,R)
%LengthOverArea: finds the ratio of length of neuron over estimated size
% Input: Array A, n by 7, swc file
%Output: ratio of length over estimated size of neuron
length = Length(A);
size = NeuronSize(R);
LOA = length/size;
end

