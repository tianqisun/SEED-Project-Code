function [Degree] = degree (A)
%Input:SWC FILE
m = adjacencyMatrixFunction(A);
Degree = sum(m,1);
end

