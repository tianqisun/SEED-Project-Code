function angleplot(features,Y,type,str)
%ANGLEPLOT: plots angles
%Input: features, Y- neuron type, type- displays contents in file, str-
%string
%Output:none
h= figure;
for b=1:length(type)
    e = features (Y==b);
    N = size(e{1},2);
    a= zeros(length(e),N);
    for n=1:length(e)
        a(n,:) = sum(e{n});
    end
    rho= mean(a);
    
    r = -pi:2*pi/N:pi;
    r(r<0) = 2*pi + r(r<0);
    x = [];
    for i = 1:8
        x = [x repmat(r(i),1,round(rho(i)))];
    end
    subplot(3,4,b);
    rose(x);
    title(type {b});
end
set(h, 'Position', [0, 0, 1024, 720]);
set(h, 'PaperUnits', 'centimeters');
set(h, 'PaperPosition', [0 0 30 20]);
saveas(h,str, 'png');
end



