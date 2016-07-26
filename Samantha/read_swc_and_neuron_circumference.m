% Input: swc file with correct pathname
% Output: circumference of bounding circle
addpath('./MinBoundSuite/MinBoundSuite')
fid=fopen('./Gold_Standard/OP_2.swc', 'r');
if fid == -1 
    error('File could not be opened, check name or path.')
end

data = [];
tline = fgetl(fid);
while tline(1) == '#'
    tline = fgetl(fid);
end
while ischar(tline) 
    vnum = sscanf(tline, '%d %d %f %f %f %f %d');
    data = [data; vnum'];
    tline = fgetl(fid);
end
fclose(fid);

circumference = neuron_circumference (data);