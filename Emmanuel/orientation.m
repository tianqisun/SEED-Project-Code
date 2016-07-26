function v = orientation(data,ANG)
% ORIENTATION find the orientation of edges
% Input: data- from swc file, ANG- slices of unit circle
% Output: v- sum of the dot product
angle = 0:(2*pi)/ANG:2*pi;
b= [cos(angle(1: end-1));-sin(angle(1: end-1));zeros(1,ANG)];
v= zeros(1,8);
for i = 1: size(data,1)
    if data(i,7) > 0
        X = data(data(i,1),3) - data(data(i,7),3);
        Y = data(data(i,1),4) - data(data(i,7),4);
        Z = data(data(i,1),5) - data(data(i,7),5);
        a= [X,Y,Z];
        v= v+a*b;
    end
end
end

    