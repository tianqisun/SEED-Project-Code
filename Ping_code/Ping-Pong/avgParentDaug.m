function [ avg ] = avgParentDaug( M )
%input: SWC file
% calculates all parent to daughter ratios by path lengths. Parent =
% fragment before branch point, daughter = fragments after branch point
%output: average parent/ daughter ratios
[~,I] = getSomaBran(M);
[ matrix, tmp ] = fragAdjacencyMatrix(M );
[~,~,pred]=bfs(matrix,tmp(I));
ratio = zeros(length(matrix),1);
B = find(tmp);
for i = 1: length(matrix)
    if i ~= tmp(I),
        parent = pred(i);
        if parent ~= tmp(I)
            pparent = pred(parent);
            ratio(i) = matrix(pparent, parent)/matrix(i, parent);
%                 text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(ratio(i)));
        end
    end
end
avg = mean(ratio(ratio>0));
end

