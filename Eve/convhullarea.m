function result = convhullarea(data)
%CONVHULLAREA finds the area of the convex hull drawn around the neuron
%Input = data - n-by-7 matrix data of neuron file
%Output = result = area of convex hull

% try
%     k = convhull(data(:,3), data(:,4), data(:,5));
% catch
k = convhull(data(:,3), data(:,4));
% end
% n = size(unique(k),1);
% newpoints = data(unique(k),3:5);

x = data(k,3:4);
y = [x;x(1,:)];
q = y(1:end - 1,1) .* y(2:end, 2);
w = y(2:end, 1) .*  y(1:end - 1, 2);
e = q - w;
result = abs((sum(e))/2);
end

