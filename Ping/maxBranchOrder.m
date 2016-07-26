function [ order ] = maxBranchOrder( M )
%input: SWC file
% calculates the maximum number of times the tree branched before reaching the
% leaf node
% output: number of branches or order
[~,I] = getSomaBran(M);
[ matrix, tmp ] = fragAdjacencyMatrix(M);
[~,~,pred]=bfs(matrix,tmp(I));
A = getDegree(M);
array = zeros(length(matrix),1);
B = find(tmp);
for i = 1:length(matrix)
    if A(B(i)) == 1
        P = path_from_pred(pred, i);
        array(i) = length(P)-2;
%             text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(array(i)));
    end
end
order = max(array);
end

