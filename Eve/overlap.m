function [t,attr] = overlap(features, Y, type, t1, t2)
%OVERLAP finds the percent of overlap for all of the features
%Input = features - type of neuron feature, Y - type of neuron (eg 1-6), type - type
%of neuron, t1 and t2 - type being compared
%Output = t - percent of overlap (low number (0) indicates a good feature),
%attr - which attribute corresponds with the percent
attr = fieldnames(features);
t = zeros(length(attr),1);
num = true(length(attr),1);
for n = 1:length(attr)
    i = zeros(size(numel(features(1).(attr{n}))));
    x = cat(3,features(Y==t1).(attr{n}));
    y = cat(3,features(Y==t2).(attr{n}));
    for k = 1:size(numel(features(1).(attr{n})), 1)
        for l = 1:size(numel(features(1).(attr{n})), 2)
           z = max(x(k,l,:)) - min(x(k,l,:));
           a = max(y(k,l,:)) - min(y(k,l,:));
           yo = cat(3, x(k,l,:), y(k,l,:));
           b = max(yo) - min(yo);
           i(k,l) = (z + a - b) / (z + a);
        end
    end
    t(n) = max(0,mean(i(:)));
    if numel(features(1).(attr{n})) ~= 1
        num(n) = false;
    end 
end
% attr = attr(num);
% t = t(num);
end

