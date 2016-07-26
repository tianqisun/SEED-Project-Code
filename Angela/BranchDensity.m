function [branchDens] = BranchDensity(A,R)
%BranchDensity: ratio of total number of branches over "size" of  neuron,
%this calculates the cluster of the neuron and determines how close the
%cluster areas of the neuron are to one another
%Input: swc file of neuron
%Output: average number of branches per micrometer using total
%number of branches in neuron over estimated 2-D size of neuron

branch = sum(degree(A) > 2);
size = NeuronSize(R);
branchDens = branch/size;
end

