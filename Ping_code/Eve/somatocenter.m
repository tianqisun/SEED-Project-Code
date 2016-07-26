function result = somatocenter(data, V)
%SOMATOCENTER finds the distance between the soma estimate and the center
%of mass
%Inupt = data - n-by-7 matrix data from neuron file (.swc file), V - image
%stack
%Output = result - distance between soma and center of mass

S = soma_estimation (V, 250);
C = mean(data(:,3:4));

x = S(1) - C(1);
y = S(2) - C(2);
result = sqrt(x^2 + y^2);

end

