function [ length ] = getLength( M, A, B )
%inputs: SWC file, index of starting point, index of ending point
%output: euclidean distance from A to B
length = sqrt((M(A,3)-M(B,3)).^2+(M(A,4)-M(B,4)).^2+(M(A,5)-M(B,5)).^2);

end

