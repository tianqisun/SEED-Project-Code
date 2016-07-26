function errorplot(features, Y, type, str)
%ERRORPLOT plots neuron features in an error bar graph
%Input = features - type of neuron feature, Y - type of neuron (eg 1-6), type - type
%of neuron, str - title of graph
%Outputs an error bar graph
% h=figure;
for r=1:length(type)
    f = features(Y==r);
    croissant(r)= mean(f);
    stds(r) = std(f);

end 
errorbar(croissant', stds', 's');
set(gca,'Xtick',1:length(type),'XTicklabel',type');
xlabel('neuron type');
title(str);
% saveas(h, str, 'png');
end