function [ soma ] = getSomaBran2( M )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
one = getAdjacencyMatrix(M);
I = getSomaBran(M);
A = getDegree(M);
F = find(A ==1);
arr = zeros(length(F),2);
    drawNeuron(M);
    hold on
for i = 1: length(F)

%     scatter3(M(F(i),3),M(F(i),4),M(F(i),5),'LineWidth',3,'MarkerEdgeColor','r')
    [~, ~, ft, ~] = dfs(one,F(i));
    [ matrix1, tmp ] = fragAdjacencyMatrix(M );
    matrix2 = matrix1;
    [~,idx] = sort(ft);
    arr2 = zeros(size(matrix1,1),1);
    for h = idx'
        if A(h) == 0
            arr2(tmp(h)) = sum(nonzeros(matrix2(tmp(h),:)));
            matrix2(:, tmp(h)) = 0;
        elseif A(h) ~= 2
            j = find(matrix1(tmp(h),:))';
            arr2(tmp(h)) = sum(nonzeros(matrix2(tmp(h),:))) + sum(arr2(j));
            matrix2(:, tmp(h)) = 0;
        end
    end
    d = getDistance(M)/2;
    C = bsxfun(@minus, d, arr2);
    [m, idx] = min(abs(C));
    B = find(tmp);
    arr(i,:) = [m , B(idx)];
    
%     scatter3(M(B(idx),3),M(B(idx),4),M(B(idx),5),'LineWidth',3)
%     text(M(B(:),3),M(B(:),4),M(B(:),5), num2str(arr2(:)));

end
C = unique(arr,'rows');
[~, idx] = min(C(1));
soma = C(idx, 2);
scatter3(M(soma,3),M(soma,4),M(soma,5),'LineWidth',3,'MarkerEdgeColor','r')
end

