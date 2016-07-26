function [dis, m] = distancesoma(data)
%DISTANCESOMA finds the geodesic and euclidean distance between the root node and the other
%nodes
%Input = data - n-by-7 matrix data from neuron file (.swc file), V - image
%stack
%Output = result - distance between the center of mass and other nodes

%find center of mass, find closest coordinate, convert to index
t = bsxfun(@minus, data(:, 3:5), data(1,3:5));
m = sqrt(sum(t.^2, 2));
% [~, I] = min(m);
% s = I;
s = 1; 
n = size(data,1);
idx = data(:,7) > 0;
G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);

% compute length
dis = zeros(1,n);
[~, dt, pred] = bfs(G,s);
[~,IX] = sort(dt);
for i = IX'
    if pred(i) > 0
        x = data(pred(i),3) - data(i,3);
        y = data(pred(i),4) - data(i,4);
        z = data(pred(i),5) - data(i,5);
        dis(i) = dis(pred(i)) + sqrt(x^2 + y^2 + z^2);
    end
end

end

