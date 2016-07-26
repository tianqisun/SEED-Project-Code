function [ num ] = numFrag( M )
%input: SWC file
%output: number of fragments: paths between branch points and/or leaf nodes
A = getDegree(M);
num = sum(A==1) + sum(A>2) - 1;

end

