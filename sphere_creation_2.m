patch([0 4300 4300 0], [0 0 4300 4300],[0 0 0]);
hold on
[x,y,z]=sphere(50);
f=psi6_all(:,3)==12233;
D=psi6_all(f,:);
D(isnan(D(:,4)),4)=0.05;
D(:,7)=ceil(D(:,4)/0.1);
A=hot(10);
A=flip(A);
% a=[1 1 1];length(D(:,1))
% (D(i,4)).^(0.5)
for i=1:1:length(D(:,1))
    hSurface=surf((x*15)+D(i,1),(y*15)+D(i,2),(z*15)+1);
    set(hSurface,'FaceColor',A((D(i,7)),:),'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
end
camlight
colormap(hot);
colorbar
caxis([0 1])
material shiny
brighten(1)
light
hold off
axis equal
% saveas(gcf,'initial1.fig');