function result= somaorientation2(s)
% SOMAORIENTAION finds the orientation of the soma by circumscribing an
% ellipse around the soma and adding the major and minor axis
% Input = s - image stack
% Output = result - ratio of distances between the ellipse's major and minor
% axis
[~, somapixel, IM3] = eroding(s);
[y,x,~] = ind2sub(size(IM3),somapixel);

  stdev = 2;           %# 2 standard deviations, 95% of population
  [ ellipseX , ellipseY, VV ] = ellipsate( x , y , stdev );
mu = mean([x,y]);
ellipse_axis1 = [mu; mu+VV(:,1)'];
ellipse_axis2 = [mu; mu+VV(:,2)'];

plot(ellipse_axis1(:,1) , ellipse_axis1(:,2), 'm')
plot(ellipse_axis2(:,1) , ellipse_axis2(:,2), 'm')

% x = ellipseX(dataX) - ellipseY(data);
% y = S(2) - C(2);
% result = sqrt(x^2 + y^2);

xy1 = ellipse_axis1(1,:) - ellipse_axis1(2,:);
xy2 = ellipse_axis2(1,:) - ellipse_axis2(2,:);
dis1 = sqrt(xy1(1)^2 + xy1(2)^2);
dis2 = sqrt(xy2(1)^2 + xy2(2)^2);
result = dis1/dis2;

figure(2), clf, imshow(mean(s,3),[]);
hold on
plot(ellipseX , ellipseY, 'r')
plot(ellipse_axis1(:,1) , ellipse_axis1(:,2), 'm')
plot(ellipse_axis2(:,1) , ellipse_axis2(:,2), 'm')
hold off