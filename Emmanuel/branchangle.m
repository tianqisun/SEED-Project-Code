function [meanresult,tornado,STD]= branchangle(data,s)
% BRANCHANGLE: the angle measure of the branchpoints
% Input: s - 3D image stack,data - n-by-7 matrix from neuron file (swc file)
% Output: result- mean value of the smallest angle measures, tornado- mean
% angle measure for each branchpoint, std- standard deviation of the result
[~, b]= branches(data);
n = size(data, 1);
idx = data(:,7) > 0;
[~, somapixel, IM3]= eroding(s);
[y,x,z] = ind2sub(size(IM3),somapixel);
e= mean([x,y,z]);
vectordist= bsxfun(@minus,data(:,3:5),e);
len= sqrt(sum(vectordist.^2,2));
[~,u] = min(len);

S = sparse([data(idx,1);data(idx,7)],[data(idx,7);data(idx,1)],1,n,n);
[~, ~, pred] = bfs(S,u);
result=[];
tornado = zeros(n,1);
for i = find(b)'
    ni= S(i,:);
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
            q = [q real(acos((C(k,:)*C(j,:)')/(nk*nj)))];
        end
    end
    q= sort(q);
    pizza=sum(ni);
    tornado(i) = mean(q(1:pizza-1));
    result = [result mean(q(1:pizza-1))];
end
 meanresult= mean(result);
 STD= std(result);
 
end