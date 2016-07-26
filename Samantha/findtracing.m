% creates an image with a highlighted path that has the smallest curvature,
% typing in C will provide the curvature at the leafnode with the smalles
% curvature
addpath('./circle_hough');
addpath(genpath('./matlab_bgl'));

%%
fid=fopen('./Olfactory Projection Fibers/Gold Standard Reconstructions/OP_3.swc', 'r');
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
% t is a table of all the leafnodes, the numbers in the table represent the
% distances between leafnode pairs
t = curvature(data);
% result is an array of all the leafnodes
result = leafnode(data);
% A is an array of the points of the leafnodes
A = find(result);

[C,I] = min(t(:));
% I represents the linear index of the maximum point in t
[st nd] = ind2sub(size(t), I);
% line 31 returns the coordinate values of the two leafnodes that are
% furthest apart from one another
tracing (V, data, A(st), A(nd), [1 0 0]);