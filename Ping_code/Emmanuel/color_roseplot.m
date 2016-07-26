function color_roseplot(shapehistogram)
% COLOR_ROSEPLOT: color roseplot
%Input: shapehistogram- histogram
%Output: none
DIS=size(shapehistogram,1);
ANG=size(shapehistogram,2);

colormap jet
cmap = jet(255);
cmin= min(shapehistogram(:));
cmax= max(shapehistogram(:));
shapehistogram= shapehistogram-min(shapehistogram(:));
shapehistogram= shapehistogram/max(shapehistogram(:));
shapehistogram= floor(shapehistogram*254+1);
n = 10;
rdir = -pi:(2*pi)/(ANG*n):pi;
for i = DIS:-1:1
    for m = 1:ANG
        theta= [rdir((m-1)*n+1:m*n+1),rdir(m*n+1:-1:(m-1)*n+1)] ;
        rho= [repmat(-1, [1, n+1]) zeros([1,n+1]) ] +i;
        h = polar(theta,rho);
        hold on
        x = get(h, 'XData') ;
        y = get(h, 'YData') ;
        p = patch(x, y, 'r') ;
        alpha(0.7);
        set(p,'FaceColor',cmap(shapehistogram(i,m),:));
    end
end
hold off
caxis([cmin, cmax]);
colorbar
end
