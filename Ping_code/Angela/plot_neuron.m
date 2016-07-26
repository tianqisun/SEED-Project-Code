function h = plot_neuron( A, col )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

B = A(:,[1,7]);
B(any(B<1,2),:) = [];
ni = B(:,1); nj = B(:,2);
X = [A(ni,3), A(nj,3), nan(length(ni),1)]';
Y = [A(ni,4), A(nj,4), nan(length(ni),1)]';
Z = [A(ni,5), A(nj,5), nan(length(ni),1)]';
if nargin < 2
    h = plot3(X(:), Y(:), Z(:),'LineWidth',2);
else
    h = plot3(X(:), Y(:), Z(:), 'Color', col);
end
xlabel('X')
ylabel('Y')
zlabel('Z')
end

