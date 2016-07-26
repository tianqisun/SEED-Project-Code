% CURVATURE_PATH calculates the curvature of a line and the minimum
% curvature that occurs between a pair of leafnodes in a data plot
% PURUPOSE: allowing for the angle change between edges to be seen; will
% allow for the path with the least change in degree to be chosen
% Input: neuron data file (swc file format)
% Output: table of curvature values of the leafnode pairs' edges, sum of
% the curvatures of the whole data file are given when "C" is typed in;
% "min_curvature" represents the minimum curvature value

function [curvature_table, min_curvature] = curvature_path (data, s, thr)

ds = bsxfun(@minus, data(:,3:4), s);
dslen = sqrt(sum(ds.^2,2))';
soma = dslen < thr;

result = leafnode(data)&~soma;
n = size(data,1);
t = inf(n,n);
idx = data(:,7) > 0;
G = sparse([data(idx,1); data(idx,7)],[data(idx,7); data(idx,1)],1,n,n);
for m = find(result);
    [~, ~, pred] = bfs(G,m);
    for f = find(result); 
        path = path_from_pred(pred,f);
        if length(path)>1
            
            D = data(path(1:end-1),3:5) - data(path(2:end),3:5);
            dist = sqrt(sum(D.^2,2));
            D(dist==0,:) = [];
            dist(dist == 0) = [];
%             if dist > 0
%                 
% %                 C = 0;
% %                 for i = 1:size(A,1)-1
% %                     C = C + real(acos(A(i,:)*A(i+1,:)'))^2;
% %                 
% %                 end
%             end
            if sum(dist) == 0
                t(m,f) = 0;
            else
                A = bsxfun(@rdivide, D, dist);
                C = sum(real(acos(sum(A(1:end-1,:).*A(2:end,:),2))).^2);
                t(m,f) = C/sum(dist);
            end
        end
    end
end
curvature_table = t(result,result);
min_curvature = min(curvature_table(:));
end