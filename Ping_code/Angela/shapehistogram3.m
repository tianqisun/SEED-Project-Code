%SHAPEHISTOGRAM creates a histogram of the number of nodes in each section
%Input: neuron data file
%Output: shape histogram in table form

function answer = shapehistogram3 (data, ax, nrad, nang)
data = OrientNeuronsRange(data);
%data = interpolation(data);

ax_idx = cellfun(@int8, ax) - 85;
s = mean(data(:,ax_idx));
ds = bsxfun(@minus, data(:,ax_idx), s);
dist = sqrt(sum(ds.^2,2));
A = bsxfun(@rdivide, ds, dist);
B = [1,0];
C = acos(A*B');
C(data(:,4) < s(2)) = -C(data(:,4) < s(2));
n = max(dist);
sqrt_list = sqrt(0:nrad);
r = 0:n/nrad:n;
% r = [0, cumsum((sqrt_list(2:end) - sqrt_list(1:end-1)) * n / sqrt(nrad))];
r(end) = r(end)+1;
a = -pi:2*pi/nang:pi;
answer = zeros(nrad,nang);
%goes through all the node points and finds which nodes are in a specific
%radius and angle of the plane. If a point is in overlapping angles and
%radii of the plane, the shape histogram counts that point as part of that
%specific section and counts it in the visual table representation

% cx = [cos(a)'*r, nan(nang+1,1); nan(1,nrad+2)]; cxt = cx';
% cy = [sin(a)'*r, nan(nang+1,1); nan(1,nrad+2)]; cyt = cy';
% plot(cx(:), cy(:), 'r', cxt(:), cyt(:), 'r')
% hold on
% box on
% drawNeuron(data)
for i = 1:nrad
    for m = 1:nang
        M = a(m)<= C & C < a(m+1) ;
        R = r(i)<= dist & dist < r(i+1);
        answer(i,m) = sum(M&R);
        
%         scatter3(data(M&R,3),data(M&R,4),data(M&R,5),'LineWidth',3)
    end
end
% hold off
% set(gca, 'XTick',[],'YTick',[],'ZTick',[]);
%     xlabel('')
%     ylabel('')
%     zlabel('')
%     title('Shape Histogram', 'FontSize', 30);

end