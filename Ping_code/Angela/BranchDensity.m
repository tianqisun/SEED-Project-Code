function [branchDens] = BranchDensity(A,R)
%BranchDensity: ratio of total number of branches over estimated 2-D size
%of neuron using minboundcircle size
%Input: Array A, n by 7, swc file format
%Output: average number of branches per micrometer using total
%number of branches in neuron over estimated 2-D size of neuron

branch = sum(degree(A) > 2);
size = NeuronSize(R);
branchDens = branch/size;
end

