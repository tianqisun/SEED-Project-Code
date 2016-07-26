%loops through every possible pair of neuron types for all the features to
%find their percent of overlap
for i = 1:length(type)
    for j = i+1:length(type)
        [t,attr] = overlap(features, Y, type, i, j);
        [r, f] = min(t);
        idx = find(t == r, 15);
        disp([num2str(i) ',' num2str(j) ' => ' attr{idx(end)}, ',   score: ', num2str(r)]);
    end
        
end 