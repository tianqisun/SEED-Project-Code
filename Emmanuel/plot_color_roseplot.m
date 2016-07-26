function plot_color_roseplot(data, Y, type, supertitle)
%PLOT_COLOR_ROSEPLOT: plots color roseplots
%Input:data-histogram,Y-features.mat, type-neuron type being plotted,
%supertitle- string
%Output: none
G = figure;
set(G, 'Position', [0, 0, 1500, 1000]);
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
    subplot(3,4,i);
   color_roseplot(means);
   color_roseplot(means);       % fix broken first subplot
   title(type {i});
end

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 45 30]);
saveas(G,supertitle, 'png')
end