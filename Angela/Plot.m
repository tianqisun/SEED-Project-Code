function Plot(A)
%[A] = OrientNeurons(A);
% [ M ] = adjacencyMatrixFunction(A);
% 
% [ni, nj] = find(M);
% figure; clf;
% hold on;
% for i=1:length(ni)
%     plot3([A(ni(i),3), A(nj(i),3)],[A(ni(i),4), A(nj(i),4)],[A(ni(i),5), A(nj(i),5)], 'r');
%     box on;
% end
% xlabel('X')
% ylabel('Y')
% zlabel('Z')
% X = [A(ni,3), A(nj,3), nan(length(ni),1)]';
% Y = [A(ni,4), A(nj,4), nan(length(ni),1)]';
% Z = [A(ni,5), A(nj,5), nan(length(ni),1)]';
%     plot3(X(:), Y(:), Z(:))
%     scatter3(mean(A(:,3)),mean(A(:,4)),mean(A(:,5)));
%     s = getSomaBran(A);
%     scatter3(s(1),s(2),s(3));
%     hold off;
% 

% close all
% clc
% load('swcfilenames.mat');
% 
% for class_num = 1:9
%     class_name = typename{1}{class_num};
%     class_idx = find(typenum(:,1) == class_num);
%     
%     fprintf('Class %s : %d neurons\n', class_name, length(class_idx));
% 
%     order = randperm(length(class_idx));
% 
%     figure(class_num);
%     N = min(20, length(class_idx));
%     for i = 1:N
%         num = class_idx(order(i));
%         A = readswc(swcfiles{num});
%         A(:,3:5) = bsxfun(@minus, A(:,3:5), mean(A(:,3:5)));
% 
%         plot_neuron( A );
%         axis equal
%         xlabel('X')
%         ylabel('Y')
%         zlabel('Z')
%         drawnow 
%         if i == 1,
%             hold on
%         end
%         
%     end
%     hold off
%     title(class_name)
%     axis equal
%     xlabel('X')
%     ylabel('Y')
%     zlabel('Z')
%     drawnow 
% end
% end


figure; clf; 
plot_ID = zeros(1,9);
class_nums = 1;
col = zeros(9, 3);
col(class_nums,:) = lines(length(class_nums));
for class_num = class_nums
    class_name = typename{1}{class_num};
    class_idx = find(typenum(:,1) == class_num);

    order = randperm(length(class_idx));

    N = min(20, length(class_idx));
    for i = 1:N
        num = class_idx(order(i));
        A = readswc(swcfiles{num});
        A(:,3:5) = bsxfun(@minus, A(:,3:5), mean(A(:,3:5)));
     
        h = plot_neuron(A);
        colormap autumn;
        
        if i == 1,
            plot_ID(class_num) = h;
        end
        
    end
    drawnow 
end
title('Unknown Class','FontSize', 40)
%legend(plot_ID(class_nums), typename{1}(class_nums))
box on;
set(gca, 'XTick', [], 'YTick', [], 'ZTick', []);
xlabel('')
ylabel('')
zlabel('')



% classA = 4;
% classB = 7;
% 
% class_nameA = typename{1}{classA};
% class_nameB = typename{1}{classB};
% 
% class_idxA = find(typenum(:,1) == classA);
% class_idxB = find(typenum(:,1) == classB);
% 
% orderA = randperm(length(class_idxA));
% orderB = randperm(length(class_idxB));
% 
% figure;
% for i = 1:90,
%     num = class_idxA(orderA(i));
%     A = readswc(swcfiles{num});
%     subplot(2,5,mod(i-1,5)+1); 
%     plot_neuron( A,'r');
%     title(class_nameA,'FontSize',20);
%     box on;
%     axis equal;
% 
% 
%     
%     num = class_idxB(orderB(i));
%     B = readswc(swcfiles{num});
%     subplot(2,5,mod(i-1,5)+6); 
%     plot_neuron( B,'b');
%     title(class_nameB,'FontSize',20);
%     box on;
%     axis equal;
% 
% 
%     if mod(i,5) == 0,
%         pause
%     end
% end

