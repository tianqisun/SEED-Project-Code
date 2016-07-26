function [ avg ] = avgNode2Soma( M )
% input: SWC file
% finds all path lengths from leaf node to soma and averages the length
% output: all average path lengths of node to soma
[~,I] = getSomaBran(M);
[ matrix, tmp ] = fragAdjacencyMatrix(M );
[~,~,pred]=bfs(matrix,tmp(I));
A = degree(M);
B = find(tmp);
len = zeros(length(matrix),1);
for i = 1: length(matrix)
    if A(B(i)) == 1 && i ~= tmp(I)
        P = path_from_pred(pred, i);
        for j = 2: length(P)
            len(i) = len(i) + matrix(P(j), pred(P(j)));
        end
%             text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(len(i)));
    end
end
avg = mean(len);
end

