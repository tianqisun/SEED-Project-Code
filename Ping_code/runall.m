addpath('Emmanuel')
addpath('Eve')
addpath('Samantha')
addpath('Angela')
addpath('MinBoundSuite')
addpath('Ping-Pong')
addpath(genpath('matlab_bgl'))
% [swcfiles, typenum, typename] = getfileandtype('C:\Users\research\Desktop\NeuroMorpho Data\');
% save('swcfilenames.mat','swcfiles','typenum', 'typename');
% clearvars swcfiles typenum typename
load('swcfilenames.mat' )
array1 = cell(length(swcfiles),1);
parfor i= 1: length(swcfiles)
    
    M = readswc(swcfiles{i});
    X = [];
%     Barcode
%     X.rad = barCodeRad(M);

    [V, ~] = ConvexHull(M);
    try
        [~,R] = minboundsphere(M(:,3:5));
    catch
        [~,R] = minboundcircle(M(:,3),M(:,4));
    end

%     ours?
    X.spine = lengthSpine(M);
    X.avgAngle2 = avgAngle2(M);
    X.leafsoma = AvLeaftoSomaLength(M);
    X.circum = Circum(R);
    X.neucluster = NeuriteCluster(M);
    X.neudens = NeuronDensity(M,V);
    X.spinedens = SpineDensity(M,R);
    X.brandens = BranchDensity(M,R);
    X.neuronsize = NeuronSize(R);
    X.neuritendpt = neuriteEndptRatio(M);
    X.fraglength = avgFragLength(M);

%     papers
    X.avgAngle = avgAngle(M);
    X.primsectert = primSecTert(M)';
    X.numfrag = numFrag(M);
    X.highestdegree = highestDegreeBranch(M);
    X.dist = getDistance(M);
    degree = getDegree(M);
    X.leaf = sum(degree==1);
    X.branch = sum(degree>2);
    X.parentdaug = avgParentDaug(M);
    X.asym = partitionAsymmetry(M);
    X.tortuosity = tortuosity(M);
    X.eucdis = EucDistance(M);
    X.convolume = V;
    X.heightwidthdepth = heightandwidth(M);
    X.branchorder = maxBranchOrder(M);
    X.node2soma = avgNode2Soma( M );

%     Previous SEED
    X.nodehisto = interpolationhistogram (M,{'X','Y'}, 4, 8);
    X.shapehisto = shapehistogram3(M,{'X','Y'}, 4, 8);
    X.symmetry = neuronsymmetry(M, {'X','Y'});

    array1{i} = X;
%     drawNeuron(M);
%     hold on
%     scatter3(M(I,3),M(I,4),M(I,5),'LineWidth',3,'MarkerEdgeColor','r')
%     axis equal
%     %for plotting stuff
end
array1 = [array1{:}];
save('feature_all_Expt_Bar_OrientRangePrev4-8_test', 'array1'); 

% load('feature_all_Expt_Bar_OrientRangePrev4-8_test.mat')
% [ D ] = mergestruct( array, array1 );
% [ data2, attr_name2 ] = struct2array( array1 );
% arffwrite('feature_all_Expt_Bar_OrientRangePrev4-8_test', [data2, typenum(:,1)], attr_name2, typename{1});