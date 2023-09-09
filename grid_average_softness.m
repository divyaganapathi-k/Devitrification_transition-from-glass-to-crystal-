% H=sortrows(H,[3 4]);
% R=sortrows(R,[4 5]);
% A=R(:,1:2)-H(:,1:2);
% A(:,3:4)=R(:,4:5);
% [A1,ia,ib]=unique(A(:,3));
% B1=A(ia,:); %dedrift_100
% length(B1)
% for i=1:1:1000
%     f=req_coor(:,3)==i;
%     req_coor(f,1)=req_coor(f,1)-B1(i,1);
%     req_coor(f,2)=req_coor(f,2)-B1(i,2);
% end
% Xedges=0:38:4300;
% Yedges=0:38:4300;
% XY=(1:1:length(Xedges))';
% [A,B,C,xbin,ybin]=histcounts2(req_coor(:,1),req_coor(:,2),Xedges,Yedges);
% xbin=xbin+1;
% ybin=ybin+1;
% xy=sub2ind([length(Xedges),length(Yedges)],xbin,ybin);
% req_coor(:,6:8)=horzcat(xbin,ybin,xy);
% Res=accumarray(req_coor(:,8),req_coor(:,5),[],@mean);
% F1=zeros(((length(C)*length(C))-max(req_coor(:,8))),1);
% Res=vertcat(Res,F1);
% Res(:,2)=1:1:length(Res(:,1));
% Res(:,3)=repmat(XY,length(XY),1);
% Res(:,4)=repelem(XY,length(XY));
% Res1=reshape(Res(:,1),length(XY),length(XY));
% pcolor(Res1);
% colormap(jet);
% caxis([-0.8 0.8]);
% axis equal

%mostmobile particle grid distribution
% H=sortrows(H,[3 4]);
% R=sortrows(R,[3 4]);
% A=R(:,1:2)-H(:,1:2);
% A(:,3:4)=R(:,3:4);
% [A1,ia,ib]=unique(A(:,3));
% B1=A(ia,:); %dedrift_100
% for i=1:1:length(B1)
%     f=mostmobile(:,3)==i;
%     mostmobile(f,1)=mostmobile(f,1)-B1(i,1);
%     mostmobile(f,2)=mostmobile(f,2)-B1(i,2);
% end
% Xedges=0:38:4300;
% Yedges=0:38:4300;
% XY=(1:1:length(Xedges))';
% [A,B,C,xbin,ybin]=histcounts2(mostmobile(:,1),mostmobile(:,2),Xedges,Yedges);
% xbin=xbin+1;
% ybin=ybin+1;
% xy=sub2ind([length(Xedges),length(Yedges)],xbin,ybin);
% mostmobile(:,5:7)=horzcat(xbin,ybin,xy);
% Res=accumarray(mostmobile(:,7),1);
% F1=zeros(((length(C)*length(C))-max(mostmobile(:,7))),1);
% Res=vertcat(Res,F1);
% Res=Res/2000;
% Res(:,2)=1:1:length(Res(:,1));
% Res(:,3)=repmat(XY,length(XY),1);
% Res(:,4)=repelem(XY,length(XY));
% Res1=reshape(Res(:,1),length(XY),length(XY));
% pcolor(Res1);
% colormap(jet);
% % caxis([-0.8 0.8]);
% axis equal


Xedges=0:38:4300;
Yedges=0:38:4300;
XY=(1:1:length(Xedges))';
[A,B,C,xbin,ybin]=histcounts2(req_coor(:,1),req_coor(:,2),Xedges,Yedges);
xbin=xbin+1;
ybin=ybin+1;
xy=sub2ind([length(Xedges),length(Yedges)],xbin,ybin);
req_coor(:,5:7)=horzcat(xbin,ybin,xy);
Res=accumarray(req_coor(:,7),req_coor(:,4),[],@mean);
F1=zeros(((length(C)*length(C))-max(req_coor(:,7))),1);
Res=vertcat(Res,F1);
Res(:,2)=1:1:length(Res(:,1));
Res(:,3)=repmat(XY,length(XY),1);
Res(:,4)=repelem(XY,length(XY));
Res1=reshape(Res(:,1),length(XY),length(XY));
figure
pcolor(Res1);
colormap(jet);
caxis([-0.8 0.8]);
axis equal

