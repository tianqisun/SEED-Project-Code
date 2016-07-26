function [ array ] = partitionAsymmetry( M )
% input: SWC file
% arr 1: partition asymmetry based on terminal nodes; arr2: length based
% partition symmetry
% output: average ratio of all branches; two values, first is terminal
% nodes, second is length
array = zeros(1,2);
one = getAdjacencyMatrix(M);
[~,I] = getSomaBran(M);
A = getDegree(M);

[~, ~, ft, ~] = dfs(one,I);
[ matrix1, tmp ] = fragAdjacencyMatrix(M );
matrix2 = matrix1;
[~,idx] = sort(ft);
arr1 = zeros(size(matrix1,1),1);
arr2 = zeros(size(matrix1,1),1);

for h = idx'
    if A(h) == 1
        arr1(tmp(h)) = 1;
        arr2(tmp(h)) = sum(nonzeros(matrix2(tmp(h),:)));
        matrix2(:, tmp(h)) = 0;
    elseif A(h) ~= 2 || h == I
        j = find(matrix1(tmp(h),:))';
        arr1(tmp(h)) = sum(arr1(j));
        arr2(tmp(h)) = full(sum(matrix2(tmp(h),:))) + sum(arr2(j));
        matrix2(:, tmp(h)) = 0;
    end
end
B = find(tmp);
ratio1 = -ones(size(matrix1,1),1);
ratio2 = -ones(size(matrix1,1),1);
for i = 1: size(matrix1,1)
    if A(B(i))>2
        num1 = sort(arr1(matrix1(i,:)>0));
        num2 = sort(arr2(matrix1(i,:)>0));
        if i == tmp(I)
            num1(end+1) = 0;
            num2(end+1) = 0;
        end 
        ratio1(i) = abs(num1(end-1) - num1(end-2))/(num1(end-1) + num1(end-2)-2);
        if num1(end-1) + num1(end-2)-2 == 0
            ratio1(i) = 0;
        end
        ratio2(i) = abs(num2(end-1) - num2(end-2))/(num2(end-1) + num2(end-2));
    end
end

if isempty(ratio1(ratio1>=0))
    array(1) = 0;
else
array(1)= mean(ratio1(ratio1>=0));

end
if isempty(ratio2(ratio2>=0))
    array(2) = 0;
else
array(2) = mean(ratio2(ratio2>=0));

end

%     B = find(tmp);
%     figure;
%     drawNeuron(M);
%     hold on
%     scatter3(M(I,3), M(I,4), M(I,5), 75, '*', 'LineWidth',10);
%     text(M(B(:),3),M(B(:),4),M(B(:),5), num2str(arr1(:)),'FontSize', 12);
%     hold off
% set(gca, 'XTick',[],'YTick',[],'ZTick',[]);
% xlabel('')
% ylabel('')
% zlabel('')
% title('Partition Asymmetry- Terminal Nodes', 'FontSize', 15);
end

