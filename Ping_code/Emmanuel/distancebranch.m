function [Mean,STD] = distancebranch(data)
%DISTANCEBRANCH find the distance between branch points
%Input:data-table from swc file
%Output: Mean- geodesic distance between branch points, STD- standard
%deviation of the result

Mean = 0;
STD=0;

[~, result] = branches(data);

n=size(data,1);

idx = data(:,7)>0;
G = sparse([data(idx,1);data(idx,7)],[data(idx,7);data(idx,1)],1,n,n);
rootnode = find(result,1);
if isempty(rootnode)
    return;
end
[~, ~, pred] = bfs(sparse(G),rootnode);
a = zeros(1,sum(result));
counter = 1;
for i=find(result)'
    index = i;
    len = 0;
    while (~result(index) || index == i) && index ~= rootnode 
        p1 = data(index,3:5);
        p2 = data(pred(index),3:5);
        len=len+sqrt(sum((p1-p2).^2));
        index = pred(index);
    end
    a(counter)=len;
    counter = counter + 1;
end
if size(a,2)>=2
    Mean = mean(a(2:end));
    STD= std(a(2:end));
end

end

