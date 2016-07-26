function [ratio] = NeuronDensity(A,V)
%NeuronDensity:calculate ratio of true volume over volume of convex hull
%Input: swc file of neuron
%Output: ratio of total length of neuron over convex hull volume
%(use length rather than actually "volume" because thickness of neuron is
%not given and the formula is length * r^2, we can just assume that radius
%is constant through the entire neuron)
length = Length(A);
ratio = length/V;
end

