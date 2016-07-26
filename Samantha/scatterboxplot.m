function scatterboxplot(features,Y, type, str)
% SCATTERBOXPLOT plots features
% Input: features- type of neuron feature, Y- number assigned to type of neuron  ,type- type of neuron sample
% str- title
% Sources: http://www.mathworks.com/matlabcentral/fileexchange/26508-notboxplot-alternative-to-box-plots

% G = figure;

notBoxPlot(features,Y);

set(gca,'Xtick',1:length(type),'XTicklabel',type');
title(str);
% saveas(G,str, 'png')
end