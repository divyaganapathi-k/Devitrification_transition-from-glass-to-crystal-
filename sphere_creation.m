% A=imread('D:\Sample5_2D_data\Sample5_xyplane_dedrift_imagej\00007.tif');
% C(:,:,1)=A;
% C(:,:,2)=A;
% C(:,:,3)=A;
% f=psi6_count(:,3)==8 & psi6_count(:,7)>2;
% B=psi6_count(f,:);
% imshow(C);
% hold on
% [x,y,z]=sphere(100);
% for i=1:1:length(B(:,1))
%     hSurface=surf((x*15)+B(i,1),(y*15)+B(i,2),(z*15)+1);
%     set(hSurface,'FaceColor',[0 1 0],'FaceAlpha',0.7,'FaceLighting','gouraud','EdgeColor','none');
% end
%  camlight('right')
% colormap(autumn)

% AA=imread('D:\Sample5_2D_data\Sample5_xyplane_dedrift_imagej\00007.tif');
% % AA=A(1381:2425,812:1856);
% imshow(AA);
% patch([0 4300 4300 0], [0 0 4300 4300],'k');
patch([2300+150 3050+150 3050+150 2300+150],[2000+75 2000+75 2700+75 2700+75],'k');
hold on
% CC(:,:,1)=AA;
% CC(:,:,2)=AA;
% CC(:,:,3)=AA;
[x,y,z]=sphere(50);
f=psi6_count(:,3)==8 & psi6_count(:,7)>2;
B=psi6_count(f,:);
f=B(:,1)>(2330+150) & B(:,1)<(3003+150) & B(:,2)>(2030+75) & B(:,2)<(2670+75);
B=B(f,:);
% clear psi6_count
% f=(B(:,1)>812 & B(:,1)<1856 & B(:,2)>1381 & B(:,2)<2425);
% BB=B(f,:);
BB=B;
% BB(:,1)=BB(:,1)-812;
% BB(:,2)=BB(:,2)-1381;
f=psi6_all(:,3)==8;
D=psi6_all(f,:);
f=D(:,1)>(2330+150) & D(:,1)<(3003+150) & D(:,2)>(2030+75) & D(:,2)<(2670+75);
D=D(f,:);
Lia=ismember(D(:,1:3),B(:,1:3),'rows');
Lia=~Lia;
D=D(Lia,:);
% D(:,1)=D(:,1)-812;
% D(:,2)=D(:,2)-1381;
f=D(:,4)>0.5;
D1=D(f,:);
f=D(:,4)<=0.5;
D2=D(f,:);
for i=1:1:length(BB(:,1))
hSurface=surf((x*15)+BB(i,1),(y*15)+BB(i,2),(z*15)+1);
set(hSurface,'FaceColor',[0 1 0], ...
'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
end
for i=1:1:length(D1(:,1))
hSurface=surf((x*15)+D1(i,1),(y*15)+D1(i,2),(z*15)+1);
set(hSurface,'FaceColor',[1 0 0], ...
'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
end
for i=1:1:length(D2(:,1))
hSurface=surf((x*15)+D2(i,1),(y*15)+D2(i,2),(z*15)+1);
set(hSurface,'FaceColor',[0 0 1], ...
'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
end
camlight
material shiny
set(gcf,'WindowStyle','docked')
brighten(0.7)
hold off
axis equal
axis off
axis tight
light
% axis([50 4100 50 4100])
% axis([200 4250 125 4175])
print('final2','-depsc','-r500')
% print('final1','-depsc','-r500')
% ax = gca;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];
% saveas(gcf,'initial1.fig');