% TRACING traces the path between the two leafnodes with the farthest
% distance from each other in a different color from the rest of the neuron
% Input: "V" is the image stack to be traced, "data" is the swc file
% corresponding to the image stack, "st" is the leafnode that is used as
% the starting point of the path that will be traced, "nd" represents the
% leafnode that will be used as the ending point for the path being traced,
% "r" represents the color that will be used for the path that is traced
% over the neuron
% Output: traced image of the inputed neuron image stack
% Purpose: Will allow for a clearer visual of the neuron dendrites and
% branches; only shows the main branch or the branch that is needed for a
% specific feature

function tracing (V, data, st, nd, r)
% line 8 graphs a 3-D image as a 2-D image by finding the average of the
% third dimension throughout all the layers then using that average layer
% as the single the layer that is actually graphed for the image that will
% be traced
imshow(mean(V,3),[]);
hold on
n = size(data,1);
    idx = data(:,7) > 0;
G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);
    [~, ~, pred] = bfs(G,st);
        path = path_from_pred(pred,nd);
%     lines 21 through 26 conducts a BFS of the data set then finds the
%     node points on the path between the two leafnodes using a predecessor
%     function
    X = data(path,3);
%     X values of the node points are stored in X
    Y = data(path,4);
%     Y values of the node points are stored in Y
    plot(X,Y,'LineWidth',3,'Color',r);
    hold off
end