%NO_OVERLAP_TORTUOUSITY finds the average tortuousity of the neuron branches
%coming off the main branches with the leafnodes and the standard deviation of the tortuosity.
%Input: neuron data file (swc file format)
%Output: calculated values of the tortuousity of the path between the
%branch point node and the end of that branch giving the average
%tortuosity, standard deviation of the tortuosity
%Purpose: allows for quantification of the neuron branches while also
%providing a possible way to classify different types of neurons based on
%their branch tortuousity

function [tort_answer, tort_std] = no_overlap_tortuousity (data, s, thr)

    ds = bsxfun(@minus, data(:,3:4), s);
    dslen = sqrt(sum(ds.^2,2))';
    soma = dslen < thr;

    p = [];
    % do BFS with any point as root node
    n = size(data,1);
    idx = data(:,7) > 0;
    G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);
    [~, ~, pred] = bfs(G,1);
    result = leafnode(data)&~soma;
    visit = false(n,1);
    for index = find(result)
        % find path from leaf node to root node or branch point
        path = path_from_pred(pred,index);
        t = find(visit(path), 1, 'last');
        if ~isempty(t)
            path = path(t:end);
        end
        k = data (path, 3:5);
        geo = sqrt(sum((k(1:end-1,:) - k(2:end,:)).^2,2));
        sumgeo = sum(geo);
        j = k(1,:) - k(end,:);
        eucl = sqrt(sum(j.^2, 2));
        if ~(sumgeo == 0 || eucl == 0) 
            p = [p sumgeo/eucl];
        
            visit(path) = true;
        end
    end
    tort_answer = mean(p);
    tort_std = std(p);
end