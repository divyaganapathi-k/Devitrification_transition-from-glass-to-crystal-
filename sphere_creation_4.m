% patch([0 4300 4300 0], [0 0 4300 4300],[1 1 1]);
% hold on
figure
[x,y,z]=sphere(50);
f=psi6(:,3)==1;
D=psi6(f,:);
f=psi6_count1(:,3)==1 & psi6_count1(:,7)>3 & psi6_count1(:,4)>=0.85;
E=psi6_count1(f,:);
Lia=ismember(D,E(:,1:7),'rows');
Lia=~Lia;
D=D(Lia,:);
for i=1:1:length(E(:,1))
    hSurface=surf(((x*5)+E(i,1)),((y*5)+E(i,2)),((z*5)+(E(i,7)*18)));
    set(hSurface,'FaceColor',[0 1 0],'FaceAlpha',0.9,'FaceLighting','gouraud','EdgeColor','none');
    hold on
end
camlight
for i=1:1:length(D(:,1))
    hSurface=surf(((x*2)+D(i,1)),((y*2)+D(i,2)),((z*2)+(D(i,7)*18)));
    set(hSurface,'FaceColor',[0 0.75 1],'FaceAlpha',0.9,'FaceLighting','gouraud','EdgeColor','none');
    hold on
end
% 0 0.75 1
material shiny
set(gca,'Color','k')
% set(gcf,'color','w');
% light
brighten(0.5)
hold off
axis equal
set(gca,'YTick',[]);
set(gca,'XTick',[]);
set(gca,'ZTick',[]);
set(gca,'linewidth',0.1)
set(gca,'ycolor',[0.7 0.7 0.7]) 
set(gca,'xcolor',[0.7 0.7 0.7])
set(gca,'zcolor',[0.7 0.7 0.7])
plotcube1([1061 1061 234],[0 0 0],0,[1 1 1]);
% fig.InvertHardcopy = 'off';
fig = gcf;
fig.Color = 'white';
view([50 30])
set(gcf, 'WindowStyle','docked')
set(gcf, 'InvertHardcopy', 'off')
set(gcf, 'PaperUnits', 'normalized')
set(gcf, 'PaperPosition', [0 0 1 1])
print('test_3D_4_2','-depsc','-r100')
% print(strcat('D:\test',num2str(j)),'-dtiff','-r1000');
% saveas(gcf,'initial1.fig');