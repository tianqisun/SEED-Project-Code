function [neurSize] = NeuronSize(R)
%NeuronSize: finds the estimated 2D area of smallest circle that
%encompasses entire neuron
%Input: Array A, n by 7, from swc file
%Output: area of smallest all-encompassing circle of neuron
neurSize = pi*R*R;
end

