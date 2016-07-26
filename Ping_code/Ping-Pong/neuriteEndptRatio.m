function [ ratio ] = neuriteEndptRatio( M )
%Input: SWC file
%Oputput: number of branches at soma/ number of endpoints ratio
[~,I] = getSomaBran(M);
A = getDegree(M);
ratio = A(I)/sum(A==1);
end

