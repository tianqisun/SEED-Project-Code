function viewBarCode(x,y)
load('swcfilenames.mat');

classA = x;
classB = y;

class_nameA = typename{1}{classA};
class_nameB = typename{1}{classB};

class_idxA = find(typenum(:,1) == classA);
class_idxB = find(typenum(:,1) == classB);

orderA = randperm(length(class_idxA));
orderB = randperm(length(class_idxB));

figure(20);
for i = 1:90,
    num = class_idxA(orderA(i));
    A = readswc(swcfiles{num});
    subplot(2,5,mod(i-1,5)+1); 
    barCodeRad(A);
    
    num = class_idxB(orderB(i));
    B = readswc(swcfiles{num});
    subplot(2,5,mod(i-1,5)+6); 
    barCodeRad(B);
    if mod(i,5) == 0
        pause
    end
end
end

