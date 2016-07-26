% this script auromatically opens the image file selected then runs the
% file through the SOMA_ESTIMATION function and the SOMATIC_DENDRITES
% function to find the total number of primary dendrites that come directly
% off the soma

addpath('./circle_hough');
addpath(genpath('./matlab_bgl'));
%%
V = opfunction();

%%
fid=fopen('./swc/myn72413_h0.swc', 'r');
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
%%
maximum = soma_estimation (V, 251);
%%
primary_dendrite_count = somatic_dendrites (maximum, data);