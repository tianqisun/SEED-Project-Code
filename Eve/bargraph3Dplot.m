%BARGRAPH3DPLOT plots a 3D bar graph of the shape histogram for every
%neuron type
%Sources: http://www.mathworks.com/matlabcentral/fileexchange/7772-suplabel
%http://www.mathworks.com/matlabcentral/newsreader/view_thread/292303
%http://www.mathworks.com/matlabcentral/answers/46214-print-to-file-saveas-
%maintaining-figure-dimensions
%Input: neuron data file, Y value from features.mat, preferred overall
%title of all bargraphs, and type of features being plotted
%Output: visual representation of the different features' histograms

function bargraph3Dplot (data, Y, type, str)
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
    bargraph3D(means, type(i))
end
[ax4,h3]=suplabel(str  ,'t');
set(G, 'Position', [0, 0, 1500, 1000]);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 45 30]);
saveas(G, str, 'png')
end