function [ratio] = NeuriteCluster(A)
%Neurite Cluster: shows amount of cluster around the neuronal spine
%Input: swc file of neuron
%output: ratio of total length of fragments over length spine
    spine = lengthSpine(A);
    ratio = (Length(A) - spine)/spine;
end

