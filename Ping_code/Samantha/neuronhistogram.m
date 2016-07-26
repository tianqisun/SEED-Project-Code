function h = neuronhistogram (data, s, nrad, nang)
% NEURONHISTOGRAM plots a shape histogram on top of the neuron image
% Input: V - image stack, data - n-by-7 matrix of neuron file, nrad -
% number of radii, nang - number of angles
% Outputs a shape histogram on top of the neuron

% s = mean(data(:,3:4));

ds = bsxfun(@minus, data(:,3:4), s);
dist = sqrt(sum(ds.^2,2));
n = max(dist);
r = 0:n/nrad:n;
drawNeuron(data);
hold on
z = 100;
ang = 0:2*pi/(nang*z):2*pi;
for i = r
    x = i*cos(ang);
    y = i*sin(ang);
    plot(x+s(1),y+s(2),'LineWidth',1,'Color',[0 1 0])
end
for m = 1:z:length(x)
    plot([s(1),x(m)+s(1)], [s(2),y(m)+s(2)],'LineWidth',1,'Color',[1 0 0])
    
end
hold off
end