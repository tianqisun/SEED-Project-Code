function [ M ] = adjacencyMatrixFunction( A )
%UNTITLED converts array A into adjacency matrix M
%Input: array A = readswc('trial.swc')
n = length(A);
% M = zeros(n,n);
B = A(:, [1 7]);
B(any(B<1,2),:) = [];
M = sparse(B(:,1), B(:,2), 1, n, n);
% for i=1:n
%     B = A(i,[1,7]);
%     if any(B < 1)
%         continue
%     end
%     
%     M(B(1), B(2)) = 1;
%    
% end
M = M + M';

end

