function [ matrix, tmp ] = fragAdjacencyMatrix(M )
% input: index of soma, adjacency matrix, SWC file
% output: the Adjacency Matrix using only branches or leaf nodes as nodes
% with values equaling the path length betweeen nodes. tmp shows the
% relationship between the original SWC file and the new adjacency matrix

one = getAdjacencyMatrix(M);
[~,I] = getSomaBran(M);
A = getDegree(M);

branch_arr = A==1| A>2;
branch_arr(I) = true;

tmp = cumsum(branch_arr);
tmp(~branch_arr) = 0;

%     drawNeuron(M);
%     hold on
%     scatter3(M(I,3),M(I,4),M(I,5),'LineWidth',3,'MarkerEdgeColor','r')

matrix = sparse(zeros(sum(branch_arr)));
[~,~,pred]=bfs(one,I);
for i = 1:length(one)
    if (A(i)==1 || A(i)>2) && i ~= I
        mypath = path_from_pred(pred, i);
       
        idx = find(branch_arr(mypath));
        array = mypath(idx(end-1):idx(end));
        
        fragLength = sum(sqrt(sum((M(array(1:end-1),3:5) - M(array(2:end),3:5)).^2,2)));
%         fragLength = 0;
%         for j = 1: length(array)-1
%             fragLength = fragLength + getLength(M, array(j), array(j+1));
%         end
%         keyboard;
%             text(M(array(end),3),M(array(end),4),M(array(end),5), num2str(fragLength));
        matrix(tmp(array(1)), tmp(array(end))) = fragLength;
    end
end
matrix = matrix + matrix';
end

