function [ arr_gau ] = barCodePath( M )
% Input: SWC file M
% calculates birth and death times end points, killing the ones with
% smaller path distance. Plots the times as barcodes and scatterplots.
% Makes a heat map based on scatter plot distribution.
% Output: single column heat map 
[~,I] = getSomaBran(M);
A = getDegree(M);
[matrix,tmp] = fragAdjacencyMatrix(M);
v = zeros(size(matrix,1),1);

D = [];
B = find(tmp);

[~, ~, ft, pred] = dfs(matrix, tmp(I));
[~,idx] = sort(ft);
act = false(1, size(matrix,1));

% figure, drawNeuron(M);
% hold on
% scatter3(M(I,3), M(I,4), M(I,5));
for p = idx'
    if A(B(p)) == 1
        path = path_from_pred(pred, p);
        for j = 1: length(path)-1
            v(p) = v(p) + matrix(path(j), path(j+1));
        end
%         text(M(B(p),3),M(B(p),4),M(B(p),5), num2str(v(p)));
        act(p) = true;
    else
         c = find(act & matrix(p,:)>0);

         [m, idxs] = max(v(c));
         act(p) = true;
         for j = 1: length(c)
             act(c(j)) = false;
             if j ~= idxs
                 path = path_from_pred(pred, p);
                 for l = 1: length(path)-1
                 v(p) = v(p) + matrix(path(l), path(l+1));
                 end
                 D = vertcat(D, [v(c(j)), v(p)]);
%                  text(M(B(p),3),M(B(p),4),M(B(p),5), num2str(v(p))) ;
             end
         end
         v(p) = m;
    end
end
D = vertcat(D, [v(tmp(I)), 0]);
% hold off
% figure;
% hold on
% for i = 1: size(D,1)
%     plot([D(i, 1), D(i,2)], [i, i]);
% end
% hold off
% figure; scatter(D(:,1), D(:,2));
% figure; drawNeuron(M);

d = 64;
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

arr_gau = imfilter(arr, fspecial('gaussian', 10, 3));
arr_gau = bsxfun(@minus, arr_gau, min(arr_gau(:)))/max(arr_gau(:));
% figure; imagesc(arr_gau); colormap jet;
% set(gca, 'Ydir', 'normal')
arr_gau = arr_gau(:)';

end

