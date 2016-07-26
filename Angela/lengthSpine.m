function [final_dist] = lengthSpine(M)
%input: swc file
% output:finds the path distance of the path between the two endpoints of the 
%longest euclidean distance of the neuron, NOT ACTUAL LONGEST PATH
 [~,p1,p2] = EucDistance(M);
G = adjacencyMatrixFunction( M );
[~,~,pred] = bfs(G,p1);
P = path_from_pred(pred,p2);
final_dist = sum(sqrt(sum((M(P(1:end-1),3:5) - M(P(2:end),3:5)).^2,2)));


% hold on;
% %figure;
% plot_neuron(M);
% %[soma,~] = getSomaBran(M);
% title('Neuron Spine','FontSize',40)
% plot3(M(P,3),M(P,4),M(P,5),'linewidth',5);
% hold off;
% box on;
% set(gca, 'XTick', [], 'YTick', [], 'ZTick', []);
% xlabel('')
% ylabel('')
% zlabel('')
end