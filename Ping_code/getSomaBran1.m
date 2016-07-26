function [ I ] = getSomaBran1(M )
%input: adjacent file, SWC file
% get possible soma: closest branch to the center
% output: index of soma
% M1 = M;
% for i = 1:3
%     newind = full(cumsum(getDegree(M1) ~=1));
%     newind(newind<1) = -1;
%     F = find(getDegree(M1) ==1)';
%     M1(F,:) = [];
%     M1(:,1) = newind(M1(:,1));
%     M1(:,7) = newind(M1(:,7));
% end
%removing endpoints three times...
B = M(:, [1,7]);
edge = B(all(B >=1,2),:);
coord = (M(edge(:,1), 3:5)+M(edge(:,2),3:5))/2;
len = getLength(M, edge(:,1), edge(:,2));
center = coord'*len;
center = center'/getDistance(M);
%center = mean(M(:,3:5));
point = M(:,3:5);
array = bsxfun(@minus, point, center);
distance = sqrt(sum(array(:,1:3).^2,2));
H = getDegree(M);
distance(H<3) = inf;
[m,I] = min(distance);
if isinf(m)
    distance = sqrt(sum(array(:,1:3).^2,2));
    [~,I] = min(distance);
    warning('No Soma')
end

% drawNeuron(M);
% hold on
% %scatter3(M1(:,3),M1(:,4),M1(:,5),'LineWidth',3,'MarkerEdgeColor','g');
% scatter3(center(1),center(2),center(3),'LineWidth',3,'MarkerEdgeColor','r');
% scatter3(M(I,3),M(I,4),M(I,5),'LineWidth',8,'MarkerEdgeColor','m');
% hold off
% drawing neuron with center and soma...among other things
end

