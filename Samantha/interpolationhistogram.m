%INTERPOLATIONHISTOGRAM creates a histogram that contains all the
%interpolation values calculated in the interpolation function in a table
%Purpose of the function: provides a clearer visual representation of the
%interpolated node points while also showing the number of interpolated
%nodes in a certain section of the neuron's plane, also finds the mean and
%standard deviation of the values in the histogram
%Input: neuron data file
%Output: shape histogram in table form, mean and standard deviation of the
%histogram's values

function [answer, histMean, histSD] = interpolationhistogram (data, axis, nrad, nang)
%data = OrientNeurons(data);
data = interpolation(data);

axis_idx = cellfun(@int8, axis) - 85;
s = mean(data(:,axis_idx));
ds = bsxfun(@minus, data(:,axis_idx), s);
dist = sqrt(sum(ds.^2,2));
A = bsxfun(@rdivide, ds, dist);
B = [1,0];
C = acos(A*B');
C(data(:,4) - s(2) > 0) = -C(data(:,4) - s(2) > 0);

n = max(dist);
sqrt_list = sqrt(0:nrad);
r = [0, cumsum((sqrt_list(2:end) - sqrt_list(1:end-1)) * n / sqrt(nrad))];
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
histMean = mean(answer(:));
histSD = std (answer(:));
end