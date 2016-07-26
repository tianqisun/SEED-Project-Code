function circumference = circumference (data)
%NEURON_CIRCUMFERENCE calculates a 2D in-circle, with the smallest radius
%possible, that bounds all node data points provided in a swc file and
%calculates the circumference of the in-circle
%URL: http://www.mathworks.com/matlabcentral/fileexchange/34767-a-suite-of-minim
%al-bounding-objects
%input: swc data file
%output: calculated circumference of bounding circle 
% C = (x,y) coordinate of the center of the drawn-in circle
% R = radius of the drawn-in circle
%     data = dir ([pathname '*.swc']);
    [C,R] = minboundcircle(data (:,3), data (:,4));
    circumference = 2*pi*R;
end