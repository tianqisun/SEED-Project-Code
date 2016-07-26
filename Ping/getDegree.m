function [ s ] = getDegree( M )
%input: adjacency Matrix
%   Detailed explanation goes here
    one = getAdjacencyMatrix(M);
    s = sum(one, 1);
%         text(M(:,3),M(:,4),M(:,5), num2str(s(:)));

end

