addpath('Emmanuel')
addpath('Eve')
addpath('Samantha')
addpath(genpath('matlab_bgl'))
% M = readswc('easy.swc');
% one = getAdjacencyMatrix(M);
% degree = getDegree(one);
% dis = getDistance(one, M)
% getLines(one, M)
%n by 3 array that includes (length of each neuron, number of branches,
%number of leaf nodes)
% [swcfiles, typenum, typename] = getfileandtype('C:\Users\research\Desktop\NeuroMorpho Data\');
% 
% save('swcfilenames.mat','swcfiles','typenum', 'typename');
% clearvars swcfiles typenum typename
load('swcfilenames.mat')
array = zeros(10, 30);%length(swcfiles),30);
for i= 1:10 %length(swcfiles)
    M = readswc(swcfiles{i});
    array(i,1) = getDistance(M);
    degree = getDegree(M);
    array(i,2) = sum(degree==1);
    array(i,3) = sum(degree>2);
    array(i,4:5) = heightandwidth(M);
    array(i,6) = NeuronSize(M);
    array(i,7) = neuronsymmetry(M, [mean(M(:,3)),mean(M(:,4))]);
    array(i,8) = tortuosity(M);
    array(i,10) = lengthSpine(M);
    array(i,12) = ConvexHull(M);
    array(i,13) = avgAngle(M);
    array(i,14) = maxBranchOrder(M);
    array(i,15:17) = primSecTert(M);
    array(i,18) = avgParentDaug(M);
    array(i,20) = highestDegreeBranch(M);
    array(i, 23) = avgNode2Soma( M );
    array(i,24) = neuriteEndptRatio(M);
    array(i,26) = numFrag(M);
    array(i, 27) = avgFragLength(M);
end
save('feature2.mat', 'array');
