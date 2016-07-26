function d= diametersoma(data)
%DIAMETERSOMA find the diameter of the soma
%Input:data - 3D image stack
%Output:result- diameter of soma
%http://www.mathworks.com/matlabcentral/fileexchange/34767-a-suite-of-minimal-bounding-objects/content/MinBoundSuite/minboundcircle.m
[~, somapixel, IM3] = eroding(data);
[y,x,~] = ind2sub(size(IM3),somapixel);
[C,radius] = minboundcircle(x,y);
d = radius*2;

figure
imshow(mean(IM3,3), []);
hold on;
ang=0:0.01:2*pi; 
xp=radius*cos(ang);
yp=radius*sin(ang);
plot(C(1)+xp,C(2)+yp);
hold off;

end
