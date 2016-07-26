function result = soma_position(data, V)
%SOMA_POSITION finds the quadrant number the soma falls in, in relation to
%the center of mass
%Input = data - n-by-7 matrix data from neuron file (.swc file), V - image
%stack
%Output = result - quadrant number soma lies in 

S = soma_estimation (V, 250);
C = mean(data(:,3:4));
d = S(1:2)' - C;

if d(1) >= 0 && d(2) >= 0
    result = 1;
elseif d(1) < 0 && d(2) >= 0
    result = 2;
elseif d(1) < 0 && d(2) < 0
    result = 3;
else
    result = 4;
end

figure(1)
imshow(mean(V,3),[])
hold on
plot(data(:,3), data(:,4), 'bo')
plot(C(1), C(2), 'ro')
plot(S(1), S(2), 'bo')
plot([C(1) C(1)], [C(2)-10 C(2)+10], 'r')
plot([C(1)-10 C(1)+10], [C(2) C(2)], 'r')
hold off
end

