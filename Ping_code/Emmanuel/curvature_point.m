function spline = curvature_point(data)
%CURVATUREHISTOGRAM: find curvature of two adjacent edges
%Input: data- n-by-7 matrix from neuron file (swc file)
%Output:spline- angle measure of the curvature
result = leafnode(data);
[~, b]= branches(data);
a = b' | result ;
v = ~(a);
b= find(v);
n = size(data, 1);
idx = data(:,7) > 0;
S = sparse([data(idx,1);data(idx,7)],[data(idx,7);data(idx,1)],1,n,n);
spline=zeros(n,1);
for i=b
    d= find(S(i,:));
    line1 = data(d(1),3:5) - data(i,3:5);
    line2= data(i,3:5) - data(d(2),3:5);
    length1= sqrt(sum(line1.^2));
    length2= sqrt(sum(line2.^2));
    if length1~=0 && length2~=0 
        spline(i) =real(acos((line1*line2')/(length1*length2)))^2;
    end
end
end

