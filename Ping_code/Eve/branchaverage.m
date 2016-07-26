function result = branchaverage(data, issoma)
%BRANCHAVERAGE finds the average branch length
%Input = data - n-by-7 matrix data from neuron file (.swc file)
%Output = result - the length of neuron divided by the number of edges
A = lengthofneuron(data);
B = branches(data);
C = leafnodefunction(data, issoma);
if B == 0
	result = 0;
else
    if issoma
        result = A/(B+C);
    else
        result = A/((B+C)-1);
    end
end
end

