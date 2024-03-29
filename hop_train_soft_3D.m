% load('E:\Devitrification\Sample5\Sample5_analysis\Sample5_phop_all_t_36.mat');
% load('E:\Devitrification\Sample5\Sample5_analysis\Sample5_track(28).mat');
deltat=10;
% f=(phop_all(:,5)>00 & phop_all(:,5)<=2000);
% phop_all=phop_all(f,:);
phop_all1=sortrows(phop_all,[6 5]);
% phop_all=sortrows(phop,-1);
% hops=phop_all(1:2000,:);
% [pks(:,1),pks(:,2)]=findpeaks(phop_all(:,1));
% phop_all1=phop_all(pks(:,2),:);
f=phop_all1(:,1)>0.25;
hops=phop_all1(f,:);
hops=sortrows(hops,-1);
hops(:,7)=hops(:,5)-(deltat);
f=hops(:,7)<0;
hops(f,:)=[];
% [~,ia,ib]=intersect(hops(:,[6 5]),phop_all(:,4:5),'rows');
% hops=horzcat(hops(ia,:),phop_all(ib,1));
% f=hops(:,7)<0.01;
% hops=hops(f,1:end-1);
[~,ia,ib]=intersect(hops(:,[7 6]),H(:,4:5),'rows'); % to get deltat
% prior coordinates
% A1=hops(ia,:);
% A2=H1(ib,:);
B1=hops(ia,:);
B2=H(ib,:);
p_soft=horzcat(B1,B2);
p_soft=sortrows(p_soft,1);
% B=horzcat(ia,ib);
% D=sortrows(B,1);
% D1=hops(D(:,1),:);
% D2=H1(D(:,2),:);
% DD=horzcat(D1,D2);
p_soft1=p_soft(1:600,:);
% % DD contains dedrifted coordinates of the particles that hopped deltat
% % prior to hop peak
% clearvars -except DD p_soft deltat H1 R
[~,ia,ib]=intersect(p_soft1(:,11:12),R(:,6:7),'rows');
A1=p_soft1(ia,:);
A2=R(ib,:);
soft=horzcat(A1,A2(:,[1 2 3 6 7]));
%soft contains hopping value, time and coordinates at which hopping
%happened (first four columns), dedrifted coordinates for deltat prior hopping, coordinates
%prior hopping deltat(R)(last four columns)
req_coord_soft1=A2(:,[1 2 3 6 7]);
%just attach radial density coordinates now
% clear H1 R
% load('E:\Devitrification\Sample5\Sample5_analysis\Sample5_radial_density_set1_part1.mat');
[~,ia,ib]=intersect(req_coord_soft1(:,1:4),radial_density(:,1:4),'rows');
req_coord_soft=horzcat(req_coord_soft1(ia,:),radial_density(ib,5:end));
req_coord_soft(:,53)=1;