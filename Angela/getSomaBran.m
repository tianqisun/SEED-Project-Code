function [soma_point1,soma_find] = getSomaBran(M)
%input: adjacent file, SWC file
% get possible soma: closest branch to the center
% output: index of soma
% center = mean(M(:,3:5));
% point = M(:,3:5);
% array = bsxfun(@minus, point, center);
% distance = sqrt(sum(array(:,1:3).^2,2));
% H = degree(M);
% distance(H<3) = inf;
% [m,I] = min(distance);
% if isinf(m)
%     distance = sqrt(sum(array(:,1:3).^2,2));
%     [~,I] = min(distance);
%     warning('No Soma')
% end
%half = lengthSpine(M)/2;
 [~,p1,p2] = EucDistance(M);
 G = adjacencyMatrixFunction(M);
%[~,~,pred] = bfs(G,Coord(1));
%P = path_from_pred(pred,Coord(2));
[~,~,pred] = bfs(G,p1);
P = path_from_pred(pred,p2);
dista = sqrt(sum((M(P(1:end-1),3:5) - M(P(2:end),3:5)).^2,2));
X = [0; cumsum(dista)];
[~, soma_find] = min(abs((X(end)/2) - X));
soma_find = P(soma_find);
soma_point1 = M(soma_find,3:5);

% 
% center = mean(M([p1 p2],3:5));
% n = length(M);
% soma_find = zeros(n,1);
% for i = 1:n;
%    soma_find(i) = sqrt(sum(bsxfun(@minus,center,M(i,3:5)).^2,2));
% end
% soma_find = abs(soma_find);
% [~,idx] = min(soma_find(:));
% soma_point = M(idx,3:5);
% 
% figure(1); clf;
% plot_neuron(M);
% hold on
% plot3(M(P,3), M(P,4), M(P,5))
% scatter3(soma_point1(1), soma_point1(2), soma_point1(3), 500, '*', 'LineWidth', 5)
% plot3(M([p1 p2], 3), M([p1 p2], 4), M([p1 p2], 5));
% text(center(1), center(2), center(3), num2str(EucDist));
% scatter3(soma_point(1),soma_point(2),soma_point(3), 500, '+', 'LineWidth', 5);
% hold off
% axis equal
end



