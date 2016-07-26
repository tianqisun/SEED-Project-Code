function [ V,K] = ConvexHull(A)
%ConvexHull: Returns volume bounded by convex hull and plots convex hull
%Input: x,  y, and z values of points to be graphed (from array A)
%Output: Volume bounded by convex hull of neuron from Array A

if length(A)<3
    V = 0;
else
    try
    [K, V] = convhull(A(:,3), A(:,4), A(:,5));
    catch
        if length(unique(A(:,5))) ~= 1
            keyboard;
        end
        try
        coeff = pca(A(:,3:5));
        Anew = A(:,3:5) * coeff(:,1:2);
        [K, V] = convhull(Anew(:,1), Anew(:,2));
        catch
            V = 0;
            K = [];
        end
    end
%     k = unique(K);
%     x = A(k,3);
%     y = A(k,4);
%     z = A(k,5);
%     tri = delaunayTriangulation(x,y,z);
%     tr = triangulation(tri, x,y,z);
%     trisurf(tr);
end
