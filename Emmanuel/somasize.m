function v = somasize(p, radius_range)
% result = [1,3;2,4;3,5];
% n=4
% ind = (rand(3,1)*n)
% p = 'test.swc';
fid=fopen(p, 'r'); 
if fid == -1 
    error('File could not be opened, check name or path.')
end
data = [];
tline = fgetl(fid);
while ischar(tline) 
    vnum = sscanf(tline, '%d %d %f %f %f %f %d');
    data = [data; vnum'];
    tline = fgetl(fid);
end
fclose(fid);

n = size(data,1);
result = [0, 0, 0];
highestscore = -Inf;
for i = 1:1000
    circle = [NaN NaN NaN];
    while any(isnan(circle)) || circle(3) > radius_range
        ind = ceil(rand(3,1)*n);
        circle = CircleFitByPratt(data(ind,3:4));
    end

    ds = bsxfun(@minus, data(:,3:4), circle(1:2));
    d = sqrt(sum(ds.^2,2));
    r=circle(3);
    c1 = sum(d<0.75*r);
    c2 = sum(d>=0.75*r & d<=1.25*r);
    score = c2 - c1;
    if highestscore < score
        result = circle;
        highestscore = score;
    end
end

v = (4/3)*pi*result(3)^3;

figure
plot(data(:,3), data(:,4), 'ko');
hold on
ang=0:0.01:2*pi; 
xp=result(3)*cos(ang);
yp=result(3)*sin(ang);
plot(result(1)+xp,result(2)+yp);
hold off





