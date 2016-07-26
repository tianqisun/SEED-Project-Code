function [ arr_gau ] = barCodeRad( M )
% Input: SWC file
% calculates birth and death times end points, killing the ones with
% smaller radial distance. Plots the times as barcodes and scatterplots.
% Makes a heat map based on scatter plot distribution.
% 64 by 64, gaussian 16, 6
% Output: single column heat map 
[~,I] = getSomaBran(M);
A = getDegree(M);
[matrix,tmp] = fragAdjacencyMatrix(M);
v = zeros(size(matrix,1),1);

D = [];
B = find(tmp);

[~, ~, ft, ~] = dfs(matrix, tmp(I));
[~,idx] = sort(ft);
act = false(1, size(matrix,1));

% figure, drawNeuron(M);
% hold on
% scatter3(M(I,3), M(I,4), M(I,5));
for p = idx'
% 	text(M(B(p),3),M(B(p),4),M(B(p),5), num2str(getLength(M, B(p), I)));
    if A(B(p)) == 1
        v(p) = getLength(M, B(p), I);
        act(p) = true;
    else
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
% hold off

figure;
hold on
for i = 1: size(D,1)
    plot([D(i, 1), D(i,2)], [i, i],'LineWidth',3);
end
hold off
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

arr_gau = imfilter(arr, fspecial('gaussian', 16, 6));
arr_gau = bsxfun(@minus, arr_gau, min(arr_gau(:)))/max(arr_gau(:));
% figure, imagesc(arr_gau); colormap jet;
% set(gca, 'Ydir', 'normal')
arr_gau = arr_gau(:);
title('Barcode-Radial', 'FontSize', 15);
%     set(gca, 'XTick',[],'YTick',[],'ZTick',[]);
%     xlabel('')
%     ylabel('')
%     zlabel('')

end

