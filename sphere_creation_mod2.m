sigma=35.2*1.4;
f=(psi6_count1(:,3)==961 & psi6_count1(:,4)>=0.7);
psi61=psi6_count1(f,1:4);
L=linkage(psi61(:,1:2)); % Links the particles
C=cluster(L,'cutoff',sigma,'criterion','distance'); 
psi61=horzcat(psi61,C);
A=accumarray(C,1);
A(:,2)=1:1:max(C);
B=nonzeros((A(:,1)>9).*A(:,2)); %cluster numbers in which the size is more than 10
f=ismember(psi61(:,5),B);
psi61=psi61(f,:);
BB=psi61;
figure
% patch([0 4300 4300 0], [0 0 4300 4300],'k');
% hold on
% [x,y,z]=sphere(50);
f=psi6(:,3)==961;
D=psi6(f,:);
Lia=ismember(D(:,1:3),BB(:,1:3),'rows');
Lia=~Lia;
D=D(Lia,:);
f=D(:,4)>0.5;
D1=D(f,:);
f=D(:,4)<=0.5;
D2=D(f,:);
% for i=1:1:length(BB(:,1))
% hSurface=surf((x*15)+BB(i,1),(y*15)+BB(i,2),(z*15)+1);
% set(hSurface,'FaceColor',[0 1 0], ...
% 'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
% end
scatter(BB(:,1),BB(:,2),70,'g','filled');
hold on
% for i=1:1:length(D1(:,1))
% hSurface=surf((x*15)+D1(i,1),(y*15)+D1(i,2),(z*15)+1);
% set(hSurface,'FaceColor',[1 0 0], ...
% 'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
% end
scatter(D1(:,1),D1(:,2),70,'r','filled');
% for i=1:1:length(D2(:,1))
% hSurface=surf((x*15)+D2(i,1),(y*15)+D2(i,2),(z*15)+1);
% set(hSurface,'FaceColor',[0 0 1], ...
% 'FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
% end
scatter(D2(:,1),D2(:,2),70,'b','filled');
% camlight
% material shiny
% set(gcf,'WindowStyle','docked')
% brighten(0.7)
hold off
axis equal
axis off
axis tight
% light
% light
% axis([50 4100 50 4100])
% axis([200 4250 125 4175])
% print('E:\final_eps_files\initial7','-depsc','-r500')
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