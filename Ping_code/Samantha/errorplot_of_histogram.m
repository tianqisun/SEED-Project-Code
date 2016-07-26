%ERRORPLOT_OF_HISTOGRAM creates an errorplot graph using data about the features of and
%the histogram of any neuron's data file
%Sources: http://www.mathworks.com/matlabcentral/fileexchange/7772-suplabel
%http://www.mathworks.com/matlabcentral/newsreader/view_thread/292303
%http://www.mathworks.com/matlabcentral/answers/46214-print-to-file-saveas-
%maintaining-figure-dimensions
%Input: neuron data file, Y value from features.mat, preferred overall
%title of all errorplots, and type of features being plotted
%Output: visual representation of the different features' histograms

function histogram = errorplot_of_histogram (data, Y, type, supertitle)
G = figure;
for i = 1:length(type)
    A = data(Y==i);
    
    % Calculate the means and standard deviations for each variety
    means = zeros(size(A{1}));
    stds = zeros(size(A{1}));
    for I = 1:size(A{1},1)
        for C = 1:size(A{1},2)
            M = zeros(length(A),1);
            for S = 1:length(A)
                M(S) = A{S}(I,C);
            end
            means(I,C) = mean(M);
            stds (I,C) = std(M);
        end
        
    end

    % Draw error bar chart with means and standard deviations
    subplot(3,4,i);
    histogram = errorbar(means', stds', 's');
    title(type(i));
    x = strcat({'A'},int2str((1:size(A{1},2))'));
    label = strcat({'R'},int2str((1:size(A{1},1))'));
%     legend(label, 'Location', 'Northeast');
    set(gca,'Xtick',1:size(A{1},2),'XTicklabel',x');
end
[ax4,h3]=suplabel(supertitle  ,'t');
set(G, 'Position', [0, 0, 1500, 1000]);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 45 30]);
saveas(G,supertitle, 'png')
end