function [ avgAng ] = avgAngle( M )
%input: M
% calculates all possible angles between neighboring points and branching
% point, and picks degree-2 min angles.
%output: average angles(in radians) between branches
one = getAdjacencyMatrix(M);
[~,I] = getSomaBran(M);
[~,~,pred]=bfs(one,I);
child_node = cell(size(one,1),1);
ang = zeros(length(one),1);
A = getDegree(M);
for i = 1: length(one)
    if pred(i) > 0 && A(pred(i)) >2
        child_node{pred(i)} = [child_node{pred(i)}, i];
    end
end
for i = 1: length(one)
    if A(i) > 2 && i ~= I
        angles = [];
        P1 = M(i,3:5);
        nb_node = child_node{i};
        for j = 1:length(nb_node)
            P2 = M(nb_node(j),3:5);
            for k = j+1:length(nb_node)
                P3 = M(nb_node(k),3:5);
                V12 = P2 - P1;
                V13 = P3 - P1;
                angles = vertcat(angles, acos(sum(V12.*V13)/(sqrt(sum(V12.^2))*sqrt(sum(V13.^2)))));
                    
            end
        end

        if length(angles)> 1
            angles = sort(angles);
            angles = angles(1:A(i)-2);
            ang(i) = mean(angles);
        end

%         text(M(i,3),M(i,4),M(i,5), num2str(mean(angles)));
    end
end
if isempty(find(ang, 1))
    avgAng = 0;
else
    avgAng = sum(ang)/length(find(ang));
end
end

