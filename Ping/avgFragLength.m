function [ avgLength ] = avgFragLength( M )
%input: adjacency Matrix
% total length of neuron / number of fragments
%output: average length of fragments
% totLength = 0;
% A = getDegree(one);
% branch_arr= A==1| A>2;
% root = find(branch_arr,1);
% [d,dt,pred]=bfs(one,root);
% 
% for i = 1:length(one)
%     if A(i)==1 || A(i)>2 || i ~= root
%         mypath = path_from_pred(pred, i);
%         idx = find(branch_arr(mypath));
%         array = mypath(idx(end-1):idx(end));
%         totLength = totLength + getLength([M(array(1), 3),M(array(1), 4),M(array(1), 5)],[M(array(2), 3),M(array(2), 4),M(array(2), 5)]);
%     end
% end
% avgLength = totLength/sum(array);
degree = getDegree(M);
avgLength = getDistance(M)/(sum(degree~=2) -1);
end

