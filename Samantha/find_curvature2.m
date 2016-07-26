% runs the CURVATURE_PATH function. to see the output in the command window type
% in "curvature_table" and a table of all the curvature values for each
% leafnode pair will be given, C gives the total of the curvatures
addpath('./circle_hough');
addpath(genpath('./matlab_bgl'));
%%
% V = opfunction();

%%
fid=fopen('./Olfactory Projection Fibers/Gold Standard Reconstructions/OP_1.swc', 'r');
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
t = trianglematrix(data);
result = leafnode(data);
A = find(result);
[C,I] = max(t(:));
[st nd] = ind2sub(size(t), I);

curvature_path (data); 