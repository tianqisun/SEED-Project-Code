function result = spinedensity(data)
%SPINEDENSITY finds the denisty of branches by dividing the length of
%neuron by the size of neuron
%Input = data - n-by-7 matrix data from neuron file (.swc file)
%Output = result - denisty of branches

A = Length(data);
B = circumference(data);
result = A/B;

end

