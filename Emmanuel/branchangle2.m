function [meanresult,tornado,STD]= branchangle2(data)
% BRANCHANGLE2: the angle measure of the branchpoints
% Input: data - n-by-7 matrix from neuron file (swc file)
% Output: result- mean value of the smallest angle measures, tornado- mean
% angle measure for each branchpoint
%find center of mass, find closest coordinate, convert to index, std-
%standard deviation of the result
% s = mean(data(:,3:5)); 
% t = bsxfun(@minus, data(:, 3:5), s);
% m = sqrt(sum(t.^2, 2));
% [~, u] = min(m);
u = 1;
[~, b]= branches(data);
n = size(data, 1);
idx = data(:,7) > 0;
S = sparse([data(idx,1);data(idx,7)],[data(idx,7);data(idx,1)],1,n,n);
[~, ~, pred] = bfs(S,u);
result=[];
tornado = zeros(n,1);
for i = find(b)'
    ni= full(S(i,:));
    if pred(i)>0
        ni(pred(i))=0;
    end
    a= data(logical(ni),3:5);
%     r= a-data(i,3:5);
    C = bsxfun(@minus,a,data(i,3:5));
    q=[];
 
    for k= 1:size(C,1)
        
        for j= k+1:size(C,1)
            nk = norm(C(k,:));
            nj =  norm(C(j,:)); 
%             (C(k,:)*C(j,:)')/(nk*nj);
            if nk~=0 && nj~=0
               q = [q real(acos((C(k,:)*C(j,:)')/(nk*nj)))];
            end
        end
    end
   if ~isempty(q)
        q= sort(q);
        pizza=sum(ni);
        tornado(i) = mean(q(1:pizza-1));
        result = [result mean(q(1:pizza-1))];
   end
end
if isempty(result)
    meanresult=0;
    STD=0;
else
    meanresult= mean(result);
    STD= std(result);
end
end