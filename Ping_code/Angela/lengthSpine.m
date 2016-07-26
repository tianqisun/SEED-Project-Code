function [final_dist] = lengthSpine(M)
%input: swc file
% finds all path lengths from leaf node to soma, + picks the longest two with
% no common branch point
%output: total length of the spine of the matrix based on maximum path
%length, indices of the leaf nodes of the spine
%%
[~,p1,p2] = EucDistance(M);
G = adjacencyMatrixFunction( M );
[~,~,pred] = bfs(G,p1);
P = path_from_pred(pred,p2);
final_dist = sum(sqrt(sum((M(P(1:end-1),3:5) - M(P(2:end),3:5)).^2,2)));
% 
% plot_neuron(M);
% hold on;
% plot3(M(P,3),M(P,4),M(P,5), 'color', 'LineWidth',2);
% hold off;
% axis equal
% 
% set(gca, 'XTick',[],'YTick',[],'ZTick',[]);
% xlabel('')
% ylabel('')
% zlabel('')
% title('Neuron Spine', 'FontSize', 30,'FontWeight','bold');
end