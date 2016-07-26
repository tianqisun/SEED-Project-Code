function data = readswc( f )
%READSWC converts file f to a n-by-7 matrix data from neuron file (.swc file)
%Input = f - filenmae of neuron (.swc file)
%Output = data - n-by-7 matrix data from neuron file (.swc file)
fid=fopen(f, 'r'); 
if fid == -1 
    error('File could not be opened, check name or path.')
end
% skip comments
tline = '#';
while tline(1) == '#'
    tline = strtrim(fgetl(fid));
end
% get neurite points
vnum = sscanf(tline, '%d %d %f %f %f %f %d');
data = [vnum'; fscanf(fid, '%d %d %f %f %f %f %d', [7 inf])'];
fclose(fid);
end

