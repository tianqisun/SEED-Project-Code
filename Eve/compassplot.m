function compassplot( features, Y, type, str )
%COMPASSPLOT plots the dendrite density in a compass graph based on the
%means of each neuron type
%Input = features - cell array of maxtrix values from neurons, Y - neuron
%type (e.g. 1-11), type - type of neuron (title of graph), str - title of subplot
%Output = compass graphs for each neuron type
h = figure;
for r = 1:length(type)
    f = features(Y==r);
    n = length(f);

    wdir = [0 90 180 270];
    c = features(Y==r);
    knots = mean(vertcat(c{:}));
    rdir = wdir * pi/180;
    [x,y] = pol2cart(rdir,knots);
    subplot(3,4,r);
    compass(x,y) 
    title(type(r));
end
set(h, 'Position', [0, 0, 800, 600]);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 30 20]);
saveas(h, ['c_' str], 'png');
end

