%SHAPEHISTOGRAM creates a histogram of the number of nodes in each section
%Input: neuron data file
%Output: shape histogram in table form

function answer = shapehistogram2 (data, s, nrad, nang)
% data = interpolation(data);

ds = bsxfun(@minus, data(:,3:4), s);
dist = sqrt(sum(ds.^2,2));
A = bsxfun(@rdivide, ds, dist);
B = [1,0];
C = acos(A*B');
C(data(:,4) - s(2) > 0) = -C(data(:,4) - s(2) > 0);
n = max(dist);
r = 0:n/nrad:n;
r(end) = r(end)+1;
a = -pi:2*pi/nang:pi;
answer = zeros(nrad,nang);
%goes through all the node points and finds which nodes are in a specific
%radius and angle of the plane. If a point is in overlapping angles and
%radii of the plane, the shape histogram counts that point as part of that
%specific section and counts it in the visual table representation
for i = 1:nrad
    for m = 1:nang
        M = a(m)<= C & C < a(m+1) ;
        R = r(i)<= dist & dist < r(i+1);
        answer(i,m) = sum(M&R);
    end
end
end