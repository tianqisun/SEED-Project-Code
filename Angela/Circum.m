function [circumference] = Circum(R)
%Circum:outputs the circumference of the Min Bound Circle of the neuron,
% the radius comes from the minboundsphere or circle depending on the
% dimensions of the neuron, this is a VERY rough estimate of neuron size
circumference = 2*pi*R;
end

