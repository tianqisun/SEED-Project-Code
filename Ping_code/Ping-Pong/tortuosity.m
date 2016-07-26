function [ array ] = tortuosity (M )
%input: SWC file
%output: average fragment length over euclidean distance between endpoints.
%also known as contraction
[~,I] = getSomaBran(M);
[ matrix, tmp ] = fragAdjacencyMatrix(M );
[~,~,pred]=bfs(matrix,tmp(I));
B = find(tmp);
array = [];

% drawNeuron(M);
% hold on
% scatter3(M(I,3),M(I,4),M(I,5),'LineWidth',3)
% scatter3(cen(1),cen(2),cen(3),'LineWidth',3)
for i = 1: length(matrix)
    if i ~= tmp(I)
        array = vertcat(array, matrix(i, pred(i))/getLength(M, B(i), B(pred(i))));
%         text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(array(end)))
    end
end
% hold off
array = mean(array);
end

