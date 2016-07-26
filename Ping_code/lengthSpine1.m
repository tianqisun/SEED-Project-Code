function [ totLength, idxs ] = lengthSpine1(M)
%input: Adjacency Matrix M
% finds all path lengths from leaf node to soma, + picks the longest two with
% no common branch point
%output: total length of the spine of the matrix based on maximum path
%length, indices of the leaf nodes of the spine
I = getSomaBran(M);
[ matrix, tmp ] = fragAdjacencyMatrix(M );
[~,~,pred]=bfs(matrix,tmp(I));
A = getDegree(M);
B = find(tmp);
len = zeros(length(matrix),1);
for i = 1: length(matrix)
    if A(B(i)) == 1 && i ~= tmp(I)
        P = path_from_pred(pred, i);
        for j = 2: length(P)
            len(i) = len(i) + matrix(P(j), pred(P(j)));
        end
    end
end
visited_branch = false(size(matrix,1),1);
cur = 1;
spine_len = zeros(1,2);
idxs = zeros(1,2);
for i = 1: length(len)
    [pmax, idx] = max(len);
    A = path_from_pred(pred, idx);
    len(idx) = 0;
    if pmax <= 0,
        break
    end
    
    if ~visited_branch(A(2))
        visited_branch(A(2)) = true;
    	spine_len(cur) = pmax;
        idxs(cur) = B(idx);
        cur = cur + 1;
        if cur > 2
            break
        end
    end
end
totLength = sum(spine_len);
% getLines(M);
% hold on
% scatter3(M(I,3),M(I,4),M(I,5), 'r')
% 
% [~,~,pred_original]=bfs(one,I);
% path_ori = path_from_pred(pred_original, B(idxs(1)));
% plot3(M(path_ori,3),M(path_ori,4),M(path_ori,5),'g+-');
% 
% path_ori = path_from_pred(pred_original, B(idxs(2)));
% plot3(M(path_ori,3),M(path_ori,4),M(path_ori,5),'c+-');
% hold off
% ------------plots lines to check----------------

% A = getDegree( one );
% array = zeros(A(I), 1);
% branch = find(matrix(tmp(I), :))
% length = zeros(length(branch), 1)
% for i = 1: length(matrix)
%     if i ~= tmp(I)
%         A = path_from_pred(pred, i)
%         for i = 1: length(branch)
%             if A(2)== branch(i)
%                 
%----------------Not finished... trying to find average length of each individual neurite
%pointless---------------------------------------------------------------
%         
%     end
% end

end

