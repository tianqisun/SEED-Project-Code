% SOMA_ESTIMATION calculates the edges of the neuron branches and soma
% while also drawing in-circles around four areas with the strongest
% intensity within each layer. Then it calculates the sum of all the 
% intensities within the circles. then the circle with the highest total intensity is found and used as the soma.
% Input: image file, intensity threshold
% Output: circle with maximum intensity --> soma

function maximum = soma_estimation (V, thr)
B = V > thr;
p = [];
circles = [];
for i = 1:(size (B,3))
    % figure out how i fits into the rest of the script so that the function
    % reads layer by layer and makes 5 circles for each layer
    e = edge(B(:,:,i), 'canny');
    radii = 15:4:40;
    
    h = circle_hough(e, radii, 'same', 'normalise');
    peaks = circle_houghpeaks(h, radii, 'nhoodxy', 55, 'nhoodr', 17, 'npeaks', 4);
    
    for peak = peaks
        [x, y] = circlepoints(peak(3));
        plot(x+peak(1), y+peak(2), 'g-');

        %   Create a logical image of a circle with specified
        %   diameter, center, and image size.
        %   First create the image.
        imageSizeX = size(V,2);
        imageSizeY = size(V,1);
        [columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);

        %   Next create the circle in the image.
        centerX = peak(1);
        centerY = peak(2);
        radius = peak(3);
        circlePixels = (rowsInImage - centerY).^2 ...
            + (columnsInImage - centerX).^2 <= radius.^2;
        %   circlePixels is a 2D "logical" array.
        %   Now, display it.
        %                     image(circlePixels) ;
        %                     colormap([0 0 0; 1 1 1]);
        %                     title('Binary image of a circle');

        %   I is a matrix containing the four circles that have
        %   intensities with values > 125. p represents the sum of the
        %   intensity inside each individual circle over the total area
        %   of the circle. "circles" is the matrix containing all the
        %   values of p.
        I = B(:,:,i);
        p = [p sum(I(circlePixels)) / (pi*(radius^2))];
        circles = [circles peak];
    end
%         hold off
%         title(i);
    %pause
end
% "maximum" finds the circle that has the highest intensity of the circles
% drawn in each layer. The maximum circle is the soma.
[~,I] = max(p);
maximum = circles(:,I);

figure(1), clf, imshow(mean(V,3),[]);
hold on
ang=0:0.01:2*pi; 
xp=maximum(3)*cos(ang);
yp=maximum(3)*sin(ang);
plot(maximum(1)+xp,maximum(2)+yp);
hold off

end