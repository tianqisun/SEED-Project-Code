function [data] = readdata(f)
%READDATA reads the filename and converts it to a n-by-7 matrix data from neuron file (.swc file)
%Input = f - filenmae of neuron (.swc file)
%Output = data - n-by-7 matrix data from neuron file (.swc file)
%% read swc
fid=fopen(f, 'r'); 
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

