function [LOA] = LengthOverArea(A,R)
%LengthOverArea: finds the ratio of length of neuron over 2-D  estimated size
% Input: Array A, n by 7, swc file
%Output: ratio of length over size of neuron(estimated
length = Length(A);
size = NeuronSize(R);
LOA = length/size;
end

