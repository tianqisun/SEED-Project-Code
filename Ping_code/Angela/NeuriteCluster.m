function [ratio] = NeuriteCluster(A)
%Neurite Cluster: find amount of cluster/spread of the neurite branches
%around the longest neurite/'spine'
%Input: Array A,n by 7, swc file of a neuron
%output: cluster ratio
    spine = lengthSpine(A);
    ratio = (Length(A) - spine)/spine;
end

