function result = dendritedensity(data, s)
%DENDRITEDENSITY finds the number of nodes in four different areas in
%relation to the center of mass
%input = data - n-by-7 matrix data from neuron file (.swc file)
%Output = result - number of nodes to the right, up, to the left, and down
%on the graph with the canter of mass as the origin

ds = bsxfun(@minus, data(:,3:4), s);

A = bsxfun(@rdivide, ds, sqrt(sum(ds.^2,2)));
B = [1,0];
C = acos(A*B');
C(data(:,4) - s(2) > 0) = -C(data(:,4) - s(2) > 0);

R = sum((-pi/4 < C) & (C <= pi/4));
U = sum((pi/4 < C) & (C <= 3*pi/4));
L = sum((3*pi/4 < C) | (C <= -3*pi/4));
D = sum((-3*pi/4 < C) & (C <= -pi/4));

result = [R, U, L, D];

end

