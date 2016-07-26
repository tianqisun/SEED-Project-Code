function [ array ] = primSecTert( M )
% Input: SWC file
% Output: Number of primary secondary and tertiary branches. Primary defined
% as the paths with the longest euclidean distance from the neighboring 
% points of the soma; secondary as the paths with the longest
% euclidean distance from points neighboring the primary branch... same for
% tertiary.
% output: number of primary secondary and tertiary branches.
%%
% M = OrientNeuronsPCA(M);
array = zeros(3,1);
[~,I] = getSomaBran(M);
matrix = getAdjacencyMatrix(M);
A = getDegree(M)';

start_pnt = I;
matrixNoPt = matrix;
act = false(1, size(matrix,1));
% 
% figure;
% drawNeuron(M);
% axis equal;
% hold on
% scatter3(M(I,3), M(I,4), M(I,5), 75, '*', 'LineWidth',10);
% hs = zeros(1,3);
% % color = ['m' 'c' 'g'];
% color = [0.4940    0.1840    0.5560; ...
%       0.8500    0.3250    0.0980; ...
%      0.4660    0.6740    0.1880];

for counter = 1:3
    act(start_pnt) = true;
    neigh = find(sum(matrix(start_pnt, :),1));
    for i = 1:length(neigh)
        if act(neigh(i)), continue, end
        idx = find(matrix(neigh(i),:));
        ne = find(act(idx));
%         plot3(M([idx(ne), neigh(i)],3), M([idx(ne), neigh(i)],4),M([idx(ne), neigh(i)],5),'color',color(counter,:),'LineWidth',3);
    end
    matrixNoPt(:, start_pnt) = 0;
    matrixNoPt(start_pnt, :) = 0;

    [cc, ~] = components(matrixNoPt);

    array(counter) = length(neigh);
    branch = cell(length(neigh), 1);
    for i = 1:length(neigh)
        
        len = zeros(size(matrix,1), 1);
        neigh_leaf = A==1 & cc == cc(neigh(i));
        len(neigh_leaf) = getLength(M, neigh(i), find(neigh_leaf));

        [maxlen, idx] = max(len);
        if maxlen <= 0
            continue
        end
        [~,~,pred]=bfs(matrixNoPt,neigh(i));
        branch{i} = path_from_pred(pred, idx);
%         hs(counter) = plot3(M(branch{i},3),M(branch{i},4),M(branch{i},5),'color',color(counter,:),'LineWidth',3);
    end
    start_pnt = [branch{:}];
%     hs(counter) = scatter3(M(start_pnt,3), M(start_pnt,4), M(start_pnt,5), 'LineWidth', 3);
end
%   
% hold off;
% legend(hs, {'Primary', 'Secondary', 'Tertiary'},'FontSize', 20);
% 
% set(gca, 'XTick',[],'YTick',[],'ZTick',[]);
% xlabel('')
% ylabel('')
% zlabel('')
% title('Primary Secondary Tertiary Branches', 'FontSize', 30,'FontWeight','bold');

% for i = 1: length(matrixNoSoma)
%     if i ~= tmp(I)
%         if pred(pred(i)) == 0
%             array(1) = array(1) + 1;
% %                 text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(1));
%         elseif pred(pred(pred(i))) == 0
%             array(2) = array(2) + 1;
% %                 text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(2));
%         elseif pred(pred(pred(pred(i)))) == 0
%             array(3) = array(3) + 1;
% %                 text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(3));
%         end
%     end
% end
% end
% 
