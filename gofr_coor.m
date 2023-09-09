% radial distribution function
% % R=load('D:\Raw Data\W8_0T_1-14000_trk(18,0,10)_DD(100).txt');
% R=load('D:\Raw Data\W3_1-10000_trk(18,0,10).txt');
% R(:,5)=R1(:,3);
% clear R1
% clearvars
% load('E:\Devitrification\Coordinates\Set1.mat');
% R=coor(:,[1 2 6]);
% f=(pos_lst(:,5)>=6000);
% pos_lst=pos_lst(f,:);
% clearvars -except pos_lst
% coor=pos_lst;
% clearvars -except coor
time=3;
a=unique(coor(:,time));
aa=length(a);
a1=max(coor(:,1));
a11=min(coor(:,1));
a2=max(coor(:,2));
a22=min(coor(:,2));
binsize=0.2;
% coor=coor(:,[1 2 6]);
%to define the central box
f=find(coor(:,1)>a1/4 & coor(:,1)<((3*a1/4)) & coor(:,2)>a2/4 & coor(:,2)<((3*a2/4)));
H=coor(f,:);
n=max(coor(:,time));
if a1>a2
    x=binsize:binsize:a2/4;
else
    x=binsize:binsize:a1/4;
end
%H contains the particles in the central box
%now g(r) is averaged over all the particles in the central box
gr=zeros(length(x),2);
gr(:,1)=x';
GR=[];
% max(coor(:,5))
for i=1:1:1000
    f1=(coor(:,time)==i);
    A=coor(f1,1:2);
    f2=(H(:,time)==i);
    B=H(f2,1:2);
    n1=length(B(:,1));
    n2=length(A(:,1));
    C=pdist2(B,A);
    [m1,m2]=size(C);
    D=reshape(C,[(m1*m2),1]);
%     f=find(D);
%     D=D(f);
    G=((a1/2)*(a2/2)*histc(D,x))./(2*n1*n1*pi*x');
    GR=horzcat(GR,G);
end
% max(pos_lst(:,5)))
gr(:,2)=(5)*(sum(GR,2)/1000);
% clear R
% filename='E:\1boxes\W5-gofr-final-smallparticles.mat';
% save(filename);