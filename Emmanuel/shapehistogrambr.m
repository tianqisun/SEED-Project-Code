function result = shapehistogrambr(data, s, ANG, DIS)
%SHAPEHISTOGRAMBR find the branches for shape histogram
%Input:data - n-by-7 matrix from neuron file (swc file), ANG- slices, DIS-
%radius of unit circle
%Output:result - table of number of branchpoints
[~, b]= branches(data);

ds = bsxfun(@minus, data(:,3:4), s);
dis = sqrt(sum(ds.^2,2));
A = bsxfun(@rdivide, ds, dis);
B = [1,0];
C = acos(A*B');
C(data(:,4) - s(2) > 0) = -C(data(:,4) - s(2) > 0);
n = max(dis);
r = 0:n/DIS:n;
r(end) = r(end)+1;
a = -pi:(2*pi)/ANG:pi;
result = zeros(DIS,ANG);
for i = 1:DIS
    for m = 1:ANG
        M = a(m)<= C & C < a(m+1) ;
        R = r(i)<= dis & dis < r(i+1);
        result(i,m) = sum(M&R&b);
    end
end

end
   


