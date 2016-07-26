function [ ratio ] = neuriteEndptRatio( M )
%neuriteEndptRatio: determines how many additional branching outs there are
%Input: SWC file of neuron
%Oputput: number of branches at soma/ number of endpoints ratio
[~,I] = getSomaBran(M);
A = degree(M);
ratio = A(I)/sum(A==1);
end

