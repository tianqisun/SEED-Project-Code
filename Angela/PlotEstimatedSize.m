A = readswc(swcfiles{20});
%estimated area
%A = OrientNeurons(A);
figure;
hold on;
[C,R] = minboundsphere (A(:,3:5));
tic;
[ M ] = adjacencyMatrixFunction(A);
[ni, nj] = find(M);
X = [A(ni,3), A(nj,3), nan(length(ni),1)]';
Y = [A(ni,4), A(nj,4), nan(length(ni),1)]';
Z = [A(ni,5), A(nj,5), nan(length(ni),1)]';
plot3(X(:), Y(:), Z(:), 'linewidth', 5);
[x,y,z] = sphere(30);
surf(R*x+C(1),R*y+C(2),R*z+C(3),'facealpha',.15,'edgealpha',0.25);
title('Min Bound Sphere','FontSize',40);

hold off;
box on;
set(gca, 'XTick', [], 'YTick', [], 'ZTick', []);
xlabel('')
ylabel('')
zlabel('')
toc;

%estimated convex hull volume
tic;
figure;
hold on;
A = OrientNeurons(A);
[K,V] = convhull(A(:,3),A(:,4), A(:,5));
trisurf(K, A(:,3), A(:,4), A(:,5),'facealpha',.15,'edgealpha',0.25);
X = [A(ni,3), A(nj,3), nan(length(ni),1)]';
Y = [A(ni,4), A(nj,4), nan(length(ni),1)]';
Z = [A(ni,5), A(nj,5), nan(length(ni),1)]';
plot3(X(:), Y(:), Z(:), 'linewidth', 5);
title('Convex Hull','FontSize',40);

hold off;
box on;
set(gca, 'XTick', [], 'YTick', [], 'ZTick', []);
xlabel('')
ylabel('')
zlabel('')
toc;