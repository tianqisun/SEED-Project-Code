function [ratio] = NeuronDensity(A,V)
%NeuronDensity:calculate ratio of true volume over volume of convex hull
%Input: Array A: n by 7 array, swc file
%Output: ratio of total length over convex hull volume(area of neuron is
%essentially cylinder, and since the radius is nearly constant, it r^2 can
%be ignored in calculating this ratio
length = Length(A);
ratio = length/V;
end

