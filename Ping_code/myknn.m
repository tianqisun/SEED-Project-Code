load('feature.mat');
load('swcfilenames.mat')

K = 5;
indices = crossvalind('Kfold',typenum(:,1),K);
preds = zeros(size(typenum,1),1);
for i = 1: K
    model = fitcknn(array(indices~=i,:), typenum(indices~=i,1), 'NumNeighbors', 10);

    preds(indices==i) = predict(model, array(indices==i,:));

    ncor = sum(preds(indices==i) == typenum(indices==i,1));
    n = sum(indices==i);
    acc = ncor/n;
    fprintf('Fold %d: Accuracy = %f [%d/%d]\n', i, acc, ncor, n);
end
ncor = sum(preds == typenum(:,1));
fprintf('Total: Accuracy = %f [%d/%d]\n', ncor/size(typenum,1), ncor, size(typenum,1));

conmat = confusionmat(typenum(:,1), preds);

