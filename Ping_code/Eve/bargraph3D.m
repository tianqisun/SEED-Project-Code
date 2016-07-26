function bargraph3D(data, str)
%BARGRAPH3D plots one shape histogram in a 3D bar graph
%Input = data - n-by-7 matrix of neuron file, str - title of graph

bar3(data)
label = strcat({'R'},int2str((1:size(data,1))'));
set(gca,'Ytick',1:size(data,1),'YTickLabel',label);
label = int2str([180:45:315, 0:45:135]');
set(gca,'Xtick',1:size(data,2),'XTickLabel',label);
title(str);

end

