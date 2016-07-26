%TORTUOUSITY finds the tortuousity value of a neuron path starting from the
%leafnode and going all the way to the center of mass, which is assumed in
%our case to be the neuron's soma, the average tortuosity, and the standard
%deviation of the tortuosity
%Purpose: finding the tortuousity of the neuron branches will allow for
%clearer computer-generated images of the neuron as well as more precise
%quantification of the neuron branches that connect the soma to the
%leafnodes
%MAIN PURPOSE: tortuousity of neuron branches could be used as features to
%classify different types of neurons and distinguish the different types of
%neurons from one another
%Input: neuron swc file
%Output: tortuousity value, average tortuosity, standard deviation of
%tortuosity

function [tort,avg_tort, std_tort] = tortuousity (data, s, thr)

ds = bsxfun(@minus, data(:,3:4), s);
dslen = sqrt(sum(ds.^2,2))';
soma = dslen < thr;

result = leafnode(data);
[geodesdis, eucldis] = distancesoma(data);
tort = geodesdis(result&~soma)./eucldis(result&~soma)';
tort(eucldis(result&~soma) == 0) = [];
if isempty(tort)
    tort = 0;
end
avg_tort = mean(tort);
std_tort = std(tort);
end