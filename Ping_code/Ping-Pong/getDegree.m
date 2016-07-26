function [ s ] = getDegree( M )
%input: SWC file
% calculates the degrees (the number of points connected to it)of all points
%output: sparse with indices and degrees
    one = getAdjacencyMatrix(M);
    s = sum(one, 1);
%         text(M(:,3),M(:,4),M(:,5), num2str(s(:)));

end

