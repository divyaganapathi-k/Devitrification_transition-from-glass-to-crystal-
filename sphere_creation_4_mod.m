% patch([0 4300 4300 0], [0 0 4300 4300],[1 1 1]);
% hold on
sigma=19*1.4;
E=[];
for i=1:1:12
    f=(psi6_count1(:,3)==794 & psi6_count1(:,4)>=0.7 & psi6_count1(:,7)==i & psi6_count1(:,8)>0);
    psi61=psi6_count1(f,:);
    L=linkage(psi61(:,1:2)); % Links the particles
    C=cluster(L,'cutoff',sigma,'criterion','distance'); 
    psi61=horzcat(psi61,C);
    A=accumarray(C,1);
    A(:,2)=1:1:max(C);
    B=nonzeros((A(:,1)>5).*A(:,2)); %cluster numbers in which the size is more than 10
    f=ismember(psi61(:,5),B);
    E=vertcat(E,psi61(f,:));
end
figure
[x,y,z]=sphere(20);
f=psi6(:,3)==794;
D=psi6(f,:);
Lia=ismember(D,E(:,1:7),'rows');
Lia=~Lia;
D=D(Lia,:);
f=D(:,7)>1 & D(:,7)<12;
D=D(f,:);
% d=D(:,7)==1 & D(:,1)<100 & D(:,2)<200;
% D=D(d,:);
% d=E(:,7)==1 & E(:,1)<100 & E(:,2)<200;
% E=E(d,:);
for i=1:1:length(E(:,1))
    hSurface=surf(((x*5)+E(i,1)),((y*5)+E(i,2)),((z*5)+(E(i,7)*18)));
    set(hSurface,'FaceColor',[0 1 0],'FaceLighting','gouraud','EdgeColor','none');
    hold on
end
% 'FaceAlpha',0.9
% camlight
% for i=1:1:length(D(:,1))
%     hSurface=surf(((x*2)+D(i,1)),((y*2)+D(i,2)),((z*2)+(D(i,7)*18)));
%     set(hSurface,'FaceColor',[0 0.75 1],'FaceAlpha',0.9,'FaceLighting','gouraud','EdgeColor','none');
%     hold on
% end
% 0 0.75 1
% s=scatter3(D(:,1),D(:,2),(D(:,7)*18),3,[0 0.75 1],'filled');
s=scatter(D(:,1),D(:,2),3,[0 0.75 1],'filled');
% s.MarkerFaceAlpha=0.5;
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
% plotcube1([1061 1061 234],[0 0 0],0,[1 1 1]);
% fig.InvertHardcopy = 'off';
% fig = gcf;
% fig.Color = 'white';
% view([50 10])
% set(gcf, 'WindowStyle','docked')
set(gcf, 'InvertHardcopy', 'off')
% set(gcf, 'PaperUnits', 'normalized')
% set(gcf, 'PaperPosition', [0 0 1 1])
% print('E:\final_eps_files\final_3D_12','-painters','-depsc','-r500')
% print(strcat('D:\test',num2str(j)),'-dtiff','-r1000');
% saveas(gcf,'initial1.fig');