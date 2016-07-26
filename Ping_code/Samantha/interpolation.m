%INTERPOLATION interpolates the neuron file data points so that there is a
%unit vector of distance 1 between each node
%Purpose: allows MATLAB to go through the data quickly and more efficiently
%while still calculating a reasonably accurate prediction of the data 
%points to be used for nodes
%Input: swc neuron file
%Output: interpolated neuron node points

function newdata = interpolation(data)
    p = [];
    % do BFS with any point as root node
    n = size(data,1);
    idx = data(:,7) > 0;
    G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);
    [~, ~, pred] = bfs(G,1);
    result = leafnode(data);
    visit = false(n,1);
    for index = find(result)
        % find path from leaf node to root node or branch point
        path = path_from_pred(pred,index);
        t = find(visit(path), 1, 'last');
        if ~isempty(t)
            path = path(t:end);
        end
        % interpolate it, so distance between nodes is one
        k = data (path, 3:5);
        v = sqrt(sum((k(1:end-1,:) - k(2:end,:)).^2,2));
        k(v==0,:) = [];
        v(v==0) = [];
        f = [0; cumsum(v)];
        xi = linspace(0,sum(v),round(sum(v))+1);
        if length(path) > 1
            points = zeros(round(sum(v))+1,3);
            for h = 1:3
                points(:,h) = interp1(f,k(:,h),xi);
            end
            
            if ~isempty(t)
                % if it is branch point, ignore it.
                p = [p; points(2:end,:)];
            else
                % if it is rootnode, include it.
                p = [p; points];
            end
            visit(path) = true;
        end        
    end
    newdata = zeros(size(p,1),7);
    newdata(:,3:5) = p;
end