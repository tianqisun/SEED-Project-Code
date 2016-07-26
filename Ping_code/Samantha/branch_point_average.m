% BRANCH_POINT_AVERAGE finds the average number of branch points per dendrite in a neuron
% data file by finding the branch points in each primary branch of a neuron
% then finding the average branch point number of all the dendrites
% considered together; also finds the standard deviation of the branch
% points per dendrite in a neuron
% Input: neuron data file (swc format)
% Output: average of the number of branch points in the neuron data file,
% standard deviation of the number of branch points in the neuron data file

function [average, SD] = branch_point_average (data, s, thr)

    ds = bsxfun(@minus, data(:,3:4), s);
    dslen = sqrt(sum(ds.^2,2))';
    soma = dslen < thr;

    % do DFS with any point as root node
    n = size(data,1);
    idx = data(:,7) > 0;
    G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);
    [~, ~, ~, pred] = dfs(G,1);
    result = leafnode(data);
    % result gives an array of node reference points of all the nodes that 
    % were found to be leafnodes 
    visit = false(n,1);
    [~, b]= branches(data);
    b = b&~soma';
    m = zeros(n,1);
    for index = find(result&~soma)
        % in the for loop, "index" references each individual node point in
        % the result array
        % find path from leaf node to root node or branch point
        % determines depth of each leaf node from the chosen reference
        % point
        path = path_from_pred(pred,index);
        c = b(path);
        m(index) = sum(c)+1;
    end
     % find the average number of branch points in the result array 
     % represents the average number of branch points per primary dendrite
     % of the neuron
    average = mean(m(result&~soma));
    SD = std (m(result&~soma));
end
    