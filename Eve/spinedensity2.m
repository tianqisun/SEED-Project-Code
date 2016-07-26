function result = spinedensity2(data)
%SPINEDENSITY2 finds the density of branches by dividing number of branches
%by size of neuron
%Input = data - n-by-7 matrix data from neuron file (.swc file)
%Output = result = density of branches

A = branches(data);
B = circumference(data);
result = A/B;

end

