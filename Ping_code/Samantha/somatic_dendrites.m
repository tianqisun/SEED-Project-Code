function primary_dendrite_count = somatic_dendrites (maximum, data)
  % SOMATIC_DENDRITES uses the single soma circle found in SOMA_ESTIMATION
  % and data from the corresponding swc file to find the total number of
  % nodes outside the soma's in-circle that represent branches connected
  % directly to the soma. 
  % Input: maximum circle from SOMA_ESTIMATION and swc file data
  % Output: total number of dendrites coming directly off the soma
  % http://www.mathworks.com/matlabcentral/fileexchange/10922-matlabbgl

% make a graph
n = size(data,1);
% G = size(n,n);
G = sparse([data(data(:,7)>0,1); data(data(:,7)>0,7)], [data(data(:,7)>0,7); data(data(:,7)>0,1)], 1, n, n);

% for i = 1:n
%     if data(i,7) > 0
%         G(data(i,1),data(i,7)) = 1;
%         G(data(i,7),data(i,1)) = 1;
%     end
% end

centerX = maximum(1);
centerY = maximum(2);
radius = (maximum(3) *2);

dis = (data(:,4) - centerY).^2 + (data(:,3) - centerX).^2;
index = dis <= radius.^2;   % index of points inside circle

newG = G(index,index);
dis = dis(index);
[~,u] = min(dis);

if all(index==0), error('no points in circle'), end

d = bfs(sparse(newG), u);

original_index = find(index);
soma_index = original_index (d ~= -1);

a = ismember (data(data(:,7)>0,[1 7]), soma_index);
D = xor (a(:,1), a(:,2));
primary_dendrite_count = sum (D);

end