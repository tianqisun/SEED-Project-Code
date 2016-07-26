function [neurSize] = NeuronSize(R)
%NeuronSize: finds the estimated 2D area of smallest circle that
%encompasses entire neuron, sets this as estimated neuronal size, which is
%used in different ratios for cluster
%Input:swc file of neuron
%Output: area of smallest all-encompassing circle of neuron
neurSize = pi*R*R;
end

