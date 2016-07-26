 [swcfiles, typenum, typename] = getfileandtype('/Users/seedstudent/Desktop/NeuroMorpho Data/');
save 'swcfilenames.mat' 'swcfiles' 'typenum' 'typename'
% 
% addpath(genpath('matlab_bgl'))
% addpath('Ping')


load('swcfilenames.mat')

B = cell(length(swcfiles),1);
tic;
parfor i=1:length(swcfiles)
     M = readswc(swcfiles{i});
    X = [];
   %X.rad = barCodeRad(M);
     [V, ~] = ConvexHull(M);
    try
        [~,R] = minboundsphere(M(:,3:5));
    catch
        [~,R] = minboundcircle(M(:,3),M(:,4));
    end

   %ours?
    X.spine = lengthSpine(M);
    X.avgAngle2 = avgAngle2(M);
    X.node2soma = avgNode2Soma( M );
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
%     X.numfrag = numFrag(M);
%     X.highestdegree = highestDegreeBranch(M);
%     X.dist = getDistance(M);
%     degree = getDegree(M);
%     X.leaf = sum(degree==1);
%     X.branch = sum(degree>2);
%     X.parentdaug = avgParentDaug(M);
%     X.avgAngle = avgAngle(M);
%     X.asym = partitionAsymmetry(M);
%     X.tortuosity = tortuosity(M);
%     X.eucdis = EucDistance(M);
%     X.convolume = V;
%     X.branchorder = maxBranchOrder(M);
%     X.heightwidthdepth = heightandwidth(M);
%     X.primsectert = primSecTert(M)';

   %Previous SEED
   %X.nodehisto = interpolationhistogram (M,{'X','Y'}, 8, 16);
   %X.branhisto = shapehistogrambr(M, mean(M(:,3:4)), 30, 10);
   %X.curvehisto = curvaturehistogram(M, mean(M(:,3:4)), 30, 10);
   %X.shapehisto = shapehistogram3(M,{'X','Y'}, 8, 16);
   %X.symmetry = neuronsymmetry(M, {'X','Y'});

    B{i} = X;
%     drawNeuron(M);
%     hold on
%     scatter3(M(I,3),M(I,4),M(I,5),'LineWidth',3,'MarkerEdgeColor','r')
%     axis equal
%     %for plotting stuff
end
toc; 
array = [B{:}];
save('feature_OursandBar','array');

 load('feature_OursandBar.mat')
 idx = typenum(:,1)==5 | typenum(:,1)==8 | typenum(:,1)==9;
 array(idx) = [];
 array2 = [B{:}];
 [ C ] = mergestruct( array1, array );
 [ data, attr_name ] = struct2array( C);
% % arffwrite('feature_vector_barcodeRemove', [data, typenum(~idx,1)], attr_name, typename{1}(1:7));
 arffwrite('feature_ALL4_no_Orient', [data, typenum(:,1)], attr_name, typename{1});