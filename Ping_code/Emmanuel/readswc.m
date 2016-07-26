function [ data ] = readswc( p )
%READSWC read the data to help find the height and width
%Input:p-.swc filename
%Output: data-readswc
%   Detailed explanation goes here
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

end

