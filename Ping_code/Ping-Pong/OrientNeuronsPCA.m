function [ M ] = OrientNeuronsPCA( M )
% input: SWC file
% Orients Neurons by largest variance using PCA, flip the axis so that the
% largest difference in coordinates are positive.
% Output: SWC file
[~, coord, latent] = pca(M(:,3:5));
[~,I] = sort(latent, 'descend');

A = abs(max(coord));
B = abs(min(coord));
coord(:,A < B)= -coord(:,A < B);
M(:,3:5) = coord(:,I);
end

 