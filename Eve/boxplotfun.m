function boxplotfun( features, Y, type, str )
%BOXPLOTFUN plots the neuron features for each type in a box plot graph
%Input = features - type of neuron feature, Y - type of neuron (eg 1-6), type - type
%of neuron, str - title of graph
%Outputs a box plot

% h=figure;

boxplot(features', Y);
set(gca,'Xtick',1:length(type),'XTicklabel',type');
xlabel('neuron type');
title(str);
% saveas(h, ['b_' str], 'png');

end

