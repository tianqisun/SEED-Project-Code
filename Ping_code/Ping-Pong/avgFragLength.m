function [ avgLength ] = avgFragLength( M )
%input: SWC file
% average length of path distance between branch points and leaf nodes
% total length of neuron / number of fragments
%output: average length of fragments
degree = getDegree(M);
avgLength = getDistance(M)/(sum(degree~=2) -1);
end

