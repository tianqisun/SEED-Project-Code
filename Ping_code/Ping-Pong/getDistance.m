function [ sum ] = getDistance( M )
% input: SWC file
% finds total path distance of neuron
% output: distance
one = getAdjacencyMatrix(M);
[a,b] = find(tril(one));
sum = 0;
    for i= 1: length(a)
        sum = sum + sqrt((M(a(i),3)-M(b(i),3))^2 + (M(a(i),4)-M(b(i),4))^2+(M(a(i),5)-M(b(i),5))^2);
    end

end

