function [ one] = getAdjacencyMatrix( M )
% input: SWC file
% makes an n by n adjacency matrix (n = length of swc file) with 1
% representing a connection and 0 representing no connection between points
% output: adjacency matrix
    n = size(M, 1);
    B = M(:, [1,7]);
    edge = B(all(B >=1,2),:);
    p = sparse(edge(:,1),edge(:,2), 1,n,n);
    one = p + p';
%     n = size(M,1);
%     one = zeros(n);
%     for i=1: n
%         a = M(i,7);
%         if (a == -1)
% 
%         else
%             one(i,a)= 1;
%             one(a,i)= 1;
%         end
% 
%     end
% %
end

