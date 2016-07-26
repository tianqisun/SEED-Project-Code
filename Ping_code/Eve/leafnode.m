function result = leafnode(data)
%LEAFNODE finds the leaf nodes in a data set
%Input - data - n-by-7 matrix data from neuron file (.swc file)
%Output - result - shows which nodes are leaf nodes
y = zeros(1, size(data,1));
for i = 1:size(data,1)
    if data(i,7)>0
        y(data(i,1)) = y(data(i,1))+1;
        y(data(i,7)) = y(data(i,7))+1;
    end
end

result = y == 1;


end


