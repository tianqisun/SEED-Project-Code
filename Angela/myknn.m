load('feature.mat');
load('swcfilenames.mat')

K = 5;
indices = crossvalind('Kfold',typenum(:,1),K);
preds = zeros(size(typenum,1),1);

for  i = 1: K
    model = fitcknn(array(indices~=i,:), typenum(indices~=i,1), 'NumNeighbors', 10);

    preds(indice) = predict(model, array(indices==i,:));

    ncor = sum(preds == typenum(indices==i,1));
    n = sum(indices==i);
    acc = ncor/n;
    fprintf('Accuracy = %f [%d/%d]\n', acc, ncor, n);
    
end
