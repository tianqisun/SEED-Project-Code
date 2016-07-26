function [ arr_gau ] = barCode( M )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[~,I] = getSomaBran(M);
A = degree(M);
[matrix,tmp] = fragAdjacencyMatrix(M);
v = zeros(size(matrix,1),1);

D = [];
B = find(tmp);

[~, ~, ft, pred] = dfs(matrix, tmp(I));
[~,idx] = sort(ft);
act = false(1, size(matrix,1));
act(tmp(A == 1)) = true;

for i = tmp(A == 1)
    v(i) = getLength(M, B(i), I);
end
for i = idx'
    if act(i) == true && i ~= tmp(I)
         p = pred(i);
         c = find(act & matrix(p,:)>0);

         [m, idxs] = max(v(c));
         act(p) = true;
         for j = 1: length(c)
             act(c(j)) = false;
             if j ~= idxs
                 D = vertcat(D, [v(c(j)), getLength(M, B(p), I)]);
             end
         end
         v(p) = m;
    end
end

D = vertcat(D, [v(tmp(I)), 0]);
% figure;
% hold on
% for i = 1: size(D,1)
%     plot([D(i, 1), D(i,2)], [i, i]);
% end
% hold off
% figure; scatter(D(:,1), D(:,2));
% figure; hold on
% plot_neuron(M);
% scatter3(P(1),P(2),P(3));
% hold off;

d = 150;
arr = zeros(d);
X = [min(D(:,1)):range(D(:,1))/d: max(D(:,1))];
Y = [min(D(:,2)):range(D(:,2))/d: max(D(:,2))];
for i=1:length(X)-1
    for j=1:length(Y)-1
        U = D(:,1)>= X(i) & D(:,1) <= X(i+1);
        N = D(:,2)>= Y(j) & D(:,2) <= Y(j+1);
        arr(j, i) = length(find(U&N));
    end
end
% imagesc(arr); colormap jet;
% set(gca, 'Ydir', 'normal')

arr_gau = imfilter(arr, fspecial('gaussian', 25, 5));
arr_gau = bsxfun(@minus, arr_gau, min(arr_gau(:)))/max(arr_gau(:));
% imagesc(arr_gau); colormap jet;
% set(gca, 'Ydir', 'normal')
arr_gau = arr_gau(:);

end

