% f=psi6_count(:,7)>2;
% psi6_count=psi6_count(f,:);
% f=psi6_count(:,3)<=2000;
% psi6_count=psi6_count(f,:);
% boxsiz=37.4;
% Prob=zeros(110,110,500);
% k=1;
% % max(psi6_count(:,3))
% for i=1:1:1000
%     f=psi6_count(:,3)==k;
%     A=psi6_count(f,:);
%     Prob(:,:,k)=hist3(A(:,1:2),'Edges',{(0:(boxsiz):4096) (0:(boxsiz):4096)});
%     k=k+1;
% end
% % hard=hard_particles_all;
% boxsiz=38;
% Prob=zeros(114,114,2000);
% % max(soft(:,3))
% for i=1:1:2000
%     f=soft_particles_all(:,3)==i;
%     A=soft_particles_all(f,:);
%     Prob(:,:,i)=hist3(A(:,1:2),'Edges',{(0:(boxsiz):4300) (0:(boxsiz):4300)});
% end
% B=mean(Prob,3);
% figure
% pcolor(B)
% colormap(jet)
% axis equal
% caxis([0 0.4])

% % boxsiz=38;
% % Prob=zeros(114,114,2000);
% % % max(soft(:,3))
% % for i=10000:1:12235
% %     f=psi6_count(:,3)==i;
% %     A=psi6_count(f,:);
% %     Prob(:,:,i)=hist3(A(:,7:8),'Edges',{(0:(boxsiz):4300) (0:(boxsiz):4300)});
% % end
% % B=mean(Prob,3);
% % figure
% pcolor(B2)
% colormap(jet)
% axis equal
% caxis([0 1])

% pos_lst=pos_lst(:,[1 2 5]);
% pos_lst=horzcat(pos_lst,pos_lst1(:,1:2));
% clear pos_lst1
[~,ia,ib]=intersect(pos_lst11(:,1:3),soft_particles_all(:,1:3),'rows');
soft=horzcat(soft_particles_all(ib,:),pos_lst11(ia,4:5));
% [~,ia,ib]=intersect(pos_lst(:,1:3),soft(:,[1 2 4]),'rows');
% soft=horzcat(soft(ib,:),pos_lst(ia,4:5));
boxsiz=38;
Prob=zeros(114,114,2000);
% max(soft(:,3))
for i=1:1:2000
    f=soft(:,3)==i;
    A=soft(f,5:6);
    Prob(:,:,i)=hist3(A(:,1:2),'Edges',{(0:(boxsiz):4300) (0:(boxsiz):4300)});
end
B1=mean(Prob,3);
figure
pcolor(B1)
colormap(jet)
axis equal
caxis([0 0.4])
% % 
% [~,ia,ib]=intersect(pos_lst(:,1:2),hard_particles_all(:,1:2),'rows');
% hard=horzcat(hard_particles_all(ib,:),pos_lst(ia,4:5));
% % [~,ia,ib]=intersect(pos_lst(:,1:3),hard(:,[1 2 4]),'rows');
% % hard=horzcat(hard(ib,:),pos_lst(ia,4:5));
% boxsiz=38;
% Prob=zeros(114,114,2000);
% for i=1:1:2000
%     f=hard(:,4)==i;
%     A=hard(f,5:6);
%     Prob(:,:,i)=hist3(A(:,1:2),'Edges',{(0:(boxsiz):4300) (0:(boxsiz):4300)});
% end
% B2=mean(Prob,3);
% figure
% pcolor(B2)
% colormap(jet)
% axis equal
% caxis([0 0.1])
% CC=corr2(B1,B2);

boxsiz=38;
Prob=zeros(114,114,35);
k=12201;
for i=1:1:35
    f=psi6(:,3)==k;
    A=psi6(f,:);
    Prob(:,:,i)=hist3(A(:,4:5),'Edges',{(0:(boxsiz):4300) (0:(boxsiz):4300)});
    k=k+1;
end
f=(Prob>1);
Prob(f)=1;
B3=mean(Prob,3);
figure
pcolor(B3)
colormap(jet)
axis equal
caxis([0 1])
CC=corr2(B1,B3);

boxsiz=38;
Prob=zeros(114,114,100);
% max(soft(:,3))
for i=1:1:100
    f=psi61(:,3)==i;
    A=psi61(f,4:5);
    Prob(:,:,i)=hist3(A(:,1:2),'Edges',{(0:(boxsiz):4300) (0:(boxsiz):4300)});
end
B4=mean(Prob,3);
figure
pcolor(B4)
colormap(jet)
axis equal
caxis([0 0.4])