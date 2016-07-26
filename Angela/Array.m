
% have an n by 3 array that includes the length of each neuron,
% number of branches (degree >= 2) in each neuron, and 
% the number of leaf nodes (degree = 1) in each neuron
load('swcfilenames.mat')
A = zeros(length(swcfiles),30);
for i=1:length(swcfiles)
    B = readswc(swcfiles{i});
    A(i,1)= Length(B);%total length of neuron
    A(i,2) = sum(degree(B)>2);%number of branches
    A(i,3) = sum(degree(B) == 1);%number of leaf nodes
    v = heightandwidth(B);
    A(i,4) = v(1);
    A(i,5) = v(2);
    A(i,6) = v(3);%height and width and depth of neuron
    [C,R] = minboundsphere(A(:,3:5));
    A(i,7) = NeuronSize(R);%Area of MinBoundCircle
   %A(i,8) = Neuron Symmetry;
   %A(i,9) = No Overlap Tortousity;
    A(i,10) = BranchDensity(B,R);%ratio of number of branches/estimated area 
    A(i,11) = lengthSpine(B);
    A(i,12) = SpineDensity(B,R);%POSSIBLE CHANGE, ratio of total length over estimated size
    
    [V,K] = ConvexHull(B);
    
    A(i,13) = V;
   %A(i,13) = Average Branch Angle Measures;
    %A(i,14) = Maximum Branch Order;
    %A(i,15:17) = primary, secondary, tertiary branches;
    %A(i,18) = Average Parent Daughter Ratio;
    %A(i,19) = Number of Symmetric Partitions;
    %A(i,20) = Highest Branch  Degree;
    %A(i,21:22) = NodeCoordinates(B);
    A(i,23) = EucDistance(B);
    %A(i,24) = Average Neurite to Soma Length;
    %A(i,25) = Neurites to endpoints ratio
    A(i,26) = NeuronDensity(B,V);
   %A(i,27) = number of fragments;
    %A(i,28) = average fragmentation length;
    A(i,29) = NeuriteCluster(B,K);
    A(i,30) = Circum(R);
    A(i,31) = AvLeaftoSomaLength(B);
end

save('feature2.mat', 'A');
