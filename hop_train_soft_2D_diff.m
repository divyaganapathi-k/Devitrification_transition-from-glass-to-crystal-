deltat=300;
% a=600;
phop_all1=sortrows(phop_all,[5 4]);
phop_all1(:,6)=smooth(phop_all1(:,1),15);
% [pks(:,1),pks(:,2)]=findpeaks(phop_all1(:,6));
% phop_all2=phop_all1(pks(:,2),:);
f=phop_all1(:,6)>0.175;
hops=phop_all1(f,:);
hops=sortrows(hops,-1);
hops(:,7)=hops(:,4)-(deltat);
% -(deltat)
f=hops(:,7)<0;
hops(f,:)=[];
% [~,ia,ib]=intersect(hops(:,[6 5]),phop_all(:,4:5),'rows');
% hops=horzcat(hops(ia,:),phop_all(ib,1));
% f=hops(:,7)<0.01;
% hops=hops(f,1:end-1);
[~,ia,ib]=intersect(hops(:,[7 5]),H(:,3:4),'rows'); % to get deltat
% prior coordinates
% A1=hops(ia,:);
% A2=H1(ib,:);
B1=hops(ia,:);
B2=H(ib,:);
p_soft=horzcat(B1,B2);
p_soft=sortrows(p_soft,[5 6]);
% B=horzcat(ia,ib);
% D=sortrows(B,1);
% D1=hops(D(:,1),:);
% D2=H1(D(:,2),:);
% DD=horzcat(D1,D2);
[~,ia,~]=unique(p_soft(:,5));
p_soft2=p_soft(ia,:);
Lia=ismember(p_soft,p_soft2,'rows');
Lia=~Lia;
p_soft1=p_soft(Lia,:);
p_soft1=sortrows(p_soft1,6);
p_soft1=p_soft1(1:600-length(p_soft2(:,1)),:); %(a+20)
p_soft1=vertcat(p_soft2,p_soft1);
% % DD contains dedrifted coordinates of the particles that hopped deltat
% % prior to hop peak
% clearvars -except DD p_soft deltat H1 R
[~,ia,ib]=intersect(p_soft1(:,8:11),H(:,1:4),'rows');
A1=p_soft1(ia,:);
A2=R(ib,:);
soft=horzcat(A1,A2(:,[1 2 5 6]));
%soft contains hopping value, time and coordinates at which hopping
%happened (first four columns), dedrifted coordinates for deltat prior hopping, coordinates
%prior hopping deltat(R)(last four columns)
req_coord_soft1=A2(:,[1 2 5 6]);
%just attach radial density coordinates now
% clear H1 R
% load('E:\Devitrification\Sample5\Sample5_analysis\Sample5_radial_density_set1_part1.mat');
[~,ia,ib]=intersect(req_coord_soft1(:,1:3),radial_density(:,1:3),'rows');
req_coord_soft=horzcat(req_coord_soft1(ia,:),radial_density(ib,4:end));
req_coord_soft(:,end+1)=1;
% f=req_coord_soft(:,1)>110 & req_coord_soft(:,2)>110 & req_coord_soft(:,1)<900 & req_coord_soft(:,2)<900;
% req_coord_soft=req_coord_soft(f,:);
% req_coord_soft=req_coord_soft(1:a,:);