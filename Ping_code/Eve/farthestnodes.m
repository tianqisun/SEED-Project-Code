function result = farthestnodes(data)
%FARTHESTNODES finds the distance between the two nodes that are the
%farthest apart in the tree
%Input = data - n-by-7 matrix data from neuron file (.swc file)
%Output = result - length between two farthest nodes
try
    k = convhull(data(:,3), data(:,4), data(:,5));
catch
    k = convhull(data(:,3), data(:,4));
end
n = size(unique(k),1);
newpoints = data(unique(k),3:5);
    
% compute length
dis = zeros(n,n);
for i = 1:n;
    for j = i+1:n
        x = newpoints(i,1) - newpoints(j,1);
        y = newpoints(i,2) - newpoints(j,2);
        z = newpoints(i,3) - newpoints(j,3);
        dis(i,j) = sqrt(x^2 + y^2 + z^2);
    end
end

result = max(dis(:));

end






