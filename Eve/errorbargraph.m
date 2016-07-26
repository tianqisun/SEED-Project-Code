function errorbargraph(features, Y, type, str)
%ERRORBARGRAPH takes the results from the shape histogram and plots the
%radius values for each neuron type
%URL = <http://www.mathworks.com/help/matlab/ref/errorbar.html |errorbar|>
%Input = features - cell array of maxtrix values from neurons, Y - neuron
%type (e.g. 1-11), type - type of neuron (title of graph), str - title of subplot
%Output = errorbar graphs for each neuron type
h = figure;
for r = 1:length(type)
    f = features(Y==r);
    n = zeros(4,length(f));
    for i = 1:length(f)
        n(:,i) = sum(f{i},2);
    end

    m = mean(n,2);
    s = std(n, 0, 2);
    subplot(3,4,r);
    errorbar(m, s, 's');
    xlabel('Radius Measures');
    label = strcat({'R'},int2str((1:size(f{1},1))'));
    set(gca,'Xtick',1:size(f{1},1),'XTickLabel',label);
    title(type(r));
end
suplabel(str ,'t');
set(h, 'Position', [0, 0, 800, 600]);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 30 20]);
saveas(h, str, 'png');
end

