function result = neuronsymmetry(data, soma)
%NEURONSYMMETRY finds the symmetry of the neuron by converting the data to
%a shape histogram and then subtracting the number of nodes in the sections opposite each other in all possible lines of symmetry
%Input = data - n-by-7 matrix of neuron data
%Output = result - number representing how symetrical the neuron is
a = 16;
answer = interpolationhistogram(data, soma, 8, a);
f = zeros(a/2,1);
for q = 1:a/2
    s = q:q+3;
    d = q-1:-1:q-4;
    d(d<1) = d(d<1) + a;
    s(s>a) = s(s>a) - a;
    W = (answer(:,s) - answer(:,d)).^2;
    f(q) = sum(W(:));
end
result = min((f./(a*4))/lengthofneuron(data));
end

