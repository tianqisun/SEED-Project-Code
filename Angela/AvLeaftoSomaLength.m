function [average] = AvLeaftoSomaLength(A)
%Input: swc file
%Output: average EUCLIDEAN distance from leaf nodes to soma of neuron,
%this is a form a measure of cluster
 LeafNodes = find(degree(A) == 1);
 I = getSomaBran(A);
 endist = sum(sqrt(sum(bsxfun(@minus,I,A(LeafNodes,3:5)).^2,2)));
% endist = 0;
% for i=1:length(LeafNodes)
%     X1 = A(LeafNodes(i),3);
%     X2 = I(1);
%     Y1 = A(LeafNodes(i),4);
%     Y2 = I(2);
%     Z1 = A(LeafNodes(i),5);
%     Z2 = I(3);
%     distance = sqrt((X1-X2)^2 + (Y1-Y2)^2 + (Z1-Z2)^2);
%     endist = endist + distance;
% end
average = endist/length(LeafNodes);
end

