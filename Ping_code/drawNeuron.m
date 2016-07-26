function drawNeuron(M)
%input:SWC File
%draws neuron in 3D plot
one = getAdjacencyMatrix(M);
[a,b] = find(tril(one));
% box on;
% figure(1); clf;
% hold on
% for i = 1: length(a)
%     if M(i,2)== 2
%         plot3([M(a(i),3),M(b(i),3)], [M(a(i),4),M(b(i),4)],[M(a(i),5),M(b(i),5)])
%     else
%         plot3([M(a(i),3),M(b(i),3)], [M(a(i),4),M(b(i),4)],[M(a(i),5),M(b(i),5)],'r')
%     end
% end
% hold off
x=[M(a,3),M(b,3), nan(length(a),1)]';
y=[M(a,4),M(b,4), nan(length(a),1)]';
z=[M(a,5),M(b,5), nan(length(a),1)]';
plot3(x(:), y(:), z(:),'b','LineWidth',2)
box on;
axis equal
xlabel('x')
ylabel('y')
zlabel('z')

end

