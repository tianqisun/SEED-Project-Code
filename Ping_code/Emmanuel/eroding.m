function [C, somapixel, IM3, center]= eroding(s,threshold,R)
%ERODING find the size of the soma by thresholding, eroding, and dilation
%Input: s - 3D image stack, R- distance from origin(how far you are
%eroding), threshold- intensity threshold
%Output: C - size of soma, somapixel- linear index of soma pixel, IM3-3D
%image stack after dilation, center- the mean of  soma points
a = s > threshold;
se = strel('square', R);
for i = 1:size(a,3)
    IM2 = imerode(a(:,:,i),se);
    IM3(:,:,i) = imdilate(IM2,se);
end
CC = bwconncomp(IM3);

if CC.NumObjects==0, error('soma not found'), end

lenCC = cellfun(@length,CC.PixelIdxList);
[C,idx] = max(lenCC);

somapixel = CC.PixelIdxList{idx};
[y,x,z] = ind2sub(size(IM3),somapixel);
center= mean([x,y,z]);

% figure(1), clf, imshow(mean(s,3),[]);
% hold on
% plot(center(1),center(2),'+','MarkerSize',10);
% hold off
end