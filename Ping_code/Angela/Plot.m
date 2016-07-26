% load('swcfilenames.mat')
% 
% figure(2);
% class_idx = find(typenum(:,1) == 1);
% for i = 1
%     num = class_idx(randi(length(class_idx)));
%     M = readswc(swcfiles{num});
%     subplot(2,3,i);
%     drawNeuron(OrientNeurons(M));
%     view([0 90]);
%     title(num2str(num));
%     
%     shapehistogram3(M,{'X','Y'}, 8, 16);
%     subplot(2,3,i+3);
%     color_roseplot(shapehistogram3(M,{'X','Y'}, 8, 16));
% end

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
%         figure(i);
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

% 
% figure(10); clf; hold on;
% plot_ID = zeros(1,9);
% class_nums = [1, 3];
% col = zeros(9, 3);
% col(class_nums,:) = lines(length(class_nums));
% for class_num = class_nums%1:9
%     class_name = typename{1}{class_num};
%     class_idx = find(typenum(:,1) == class_num);
% 
%     order = randperm(length(class_idx));
% 
%     N = min(20, length(class_idx));
%     for i = 1:N
%         num = class_idx(order(i));
%         A = readswc(swcfiles{num});
%         A(:,3:5) = bsxfun(@minus, A(:,3:5), mean(A(:,3:5)));
% 
%         h = plot_neuron( A, col(class_num,:));
%         if i == 1,
%             plot_ID(class_num) = h;
%         end
%         
%     end
%     drawnow 
% end
% hold off
% title('All neurons')
% legend(plot_ID(class_nums), typename{1}(class_nums))
% axis equal
% xlabel('X')
% ylabel('Y')
% zlabel('Z')


% classA = 1;
% classB = 4;
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
% for i = 1:50,
%     num = class_idxA(orderA(i));
%     A = readswc(swcfiles{num});
%     subplot(2,5,mod(i-1,5)+1), 
%     barCodePath(A);
%     
%     num = class_idxB(orderB(i));
%     B = readswc(swcfiles{num});
%     subplot(2,5,mod(i-1,5)+6),
%     barCodePath(B);
%     if mod(i,5) == 0,
%         pause
%     end
% end


