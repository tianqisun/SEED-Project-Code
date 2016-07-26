function [ avgAng ] = avgAngle2( M )
%input: SWC file -M
% calculates all possible angles between neighboring branch points or leaf 
% nodes and branching point, and picks degree-2 min angles.
%output: average angles(in radians) between branches
%%

% M = OrientNeuronsPCA(M);

% figure;
% drawNeuron(M);
% axis equal;
% hold on


one = getAdjacencyMatrix(M);
[matrix,tmp] = fragAdjacencyMatrix(M);
[~,I] = getSomaBran(M);
% scatter3(M(I,3), M(I,4), M(I,5), 75, '*', 'LineWidth',10);
[~,~,pred]=bfs(matrix,tmp(I));
child_node = cell(size(matrix,1),1);
ang = zeros(length(one),1);
A = getDegree(M);
B = find(tmp);
for i = 1: size(matrix,1)
    if pred(i) > 0
        child_node{pred(i)} = [child_node{pred(i)}, i];
    end
end
for i = 1: size(matrix,1)
    if A(B(i))~= 1 && i ~= tmp(I)
        angles = [];
        P1 = M(B(i),3:5);
        nb_node = child_node{i};
        for j = 1:length(nb_node)
            P2 = M(B(nb_node(j)),3:5);
            for k = j+1:length(nb_node)
                P3 = M(B(nb_node(k)),3:5);
                V12 = P2 - P1;
                V13 = P3 - P1;
                angles = vertcat(angles, acos(sum(V12.*V13)/(sqrt(sum(V12.^2))*sqrt(sum(V13.^2)))));
%                 plot3([P1(1) P2(1) nan P1(1) P3(1)], [P1(2) P2(2) nan P1(2) P3(2)], [P1(3) P2(3) nan P1(3) P3(3)],'LineWidth',2)
            end
        end

        if length(angles)> 1
            angles = sort(angles);
            angles = angles(1:A(B(i))-2);
            ang(i) = mean(angles);
        end
        
%         text(M(B(i),3),M(B(i),4),M(B(i),5), num2str(mean(angles)), 'FontSize', 16,'FontWeight','bold');
    end
end
if isempty(find(ang, 1))
    avgAng = 0;
else
    avgAng = sum(ang)/length(find(ang));
end
%     set(gca, 'XTick',[],'YTick',[],'ZTick',[]);
%     xlabel('')
%     ylabel('')
%     zlabel('')
%     title('Average Angle- Branch Nodes', 'FontSize', 30,'FontWeight','bold');
end

