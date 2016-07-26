function [ M ] = OrientNeuronsRange( M )
% Input: SWC file
% flips the y and z coordinates of all the nodes if the range of z is
% greater than the range of x. 
% Output: oriented M
arr = range(M);
if arr(4) < arr(5),
    M = M(:,[1 2 3 5 4 6 7]);
end

end

