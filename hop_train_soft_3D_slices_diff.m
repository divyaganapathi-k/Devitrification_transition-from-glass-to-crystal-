deltat=100;
p_soft_all=[];
for i=min(phops(:,6)):1:max(phops(:,6))
    f=phops(:,6)==i;
    phop_all=phops(f,:);
    phop_all1=sortrows(phop_all,[5 4]);
    phop_all1(:,7)=smooth(phop_all1(:,1),15);
    % [pks(:,1),pks(:,2)]=findpeaks(phop_all1(:,6));
    % phop_all2=phop_all1(pks(:,2),:);
    f=phop_all1(:,7)>0.03;
    hops=phop_all1(f,:);
    hops=sortrows(hops,-7);
    hops(:,8)=hops(:,4)-(deltat);
    % -(deltat)
    f=hops(:,8)<=0;
    hops(f,:)=[];
    % [~,ia,ib]=intersect(hops(:,[6 5]),phop_all(:,4:5),'rows');
    % hops=horzcat(hops(ia,:),phop_all(ib,1));
    % f=hops(:,7)<0.01;
    % hops=hops(f,1:end-1);
    [~,ia,ib]=intersect(hops(:,[8 5 6]),H(:,3:5),'rows'); % to get deltat
    % prior coordinates
    % A1=hops(ia,:);
    % A2=H1(ib,:);
    B1=hops(ia,:);
    B2=H(ib,:);
    p_soft=horzcat(B1,B2);
    p_soft_all=vertcat(p_soft_all,p_soft);
end
p_soft_all=sortrows(p_soft_all,-7);
[~,ia,~]=unique(p_soft_all(:,[6 5]),'rows');
p_soft2=p_soft_all(ia,:);
Lia=ismember(p_soft_all,p_soft2,'rows');
Lia=~Lia;
p_soft1=p_soft_all(Lia,:);
p_soft1=sortrows(p_soft1,-7);
p_soft1=p_soft1(1:600-length(p_soft2(:,1)),:);
p_soft1=vertcat(p_soft2,p_soft1);
% % DD contains dedrifted coordinates of the particles that hopped deltat
% % prior to hop peak
% clearvars -except DD p_soft deltat H1 R
[~,ia,ib]=intersect(p_soft1(:,9:13),H,'rows');
A1=p_soft1(ia,:);
A2=R(ib,:);
soft=horzcat(A1,A2(:,[1 2 5 6 7]));
%soft contains hopping value, time and coordinates at which hopping
%happened (first four columns), dedrifted coordinates for deltat prior hopping, coordinates
%prior hopping deltat(R)(last four columns)
req_coord_soft1=A2(:,[1 2 5 6 7]);
[~,ia,ib]=intersect(req_coord_soft1(:,[1 2 3 5]),radial_density(:,1:4),'rows');
req_coord_soft=horzcat(req_coord_soft1(ia,:),radial_density(ib,5:end));
req_coord_soft(:,end+1)=1;