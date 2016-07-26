function [ spineDens ] = SpineDensity(A,R)
%SpineDensity: finds the ratio of length of spine over estimated "size" of
%neuron, which is the area of minboundcircle
% Input: swc file of neuron
%Output: ratio of length over size of neuron(estimated
spineDens = lengthSpine(A)/NeuronSize(R);
end

