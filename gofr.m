% radial distribution function
% % R=load('D:\Raw Data\W8_0T_1-14000_trk(18,0,10)_DD(100).txt');
% R=load('D:\Raw Data\W3_1-10000_trk(18,0,10).txt');
% R(:,5)=R1(:,3);
% clear R1
% clearvars
% load('E:\Devitrification\Coordinates\Set1.mat');
% R=coor(:,[1 2 6]);
% a1=max(pos_lst(:,1));
% a11=min(pos_lst(:,1));
% a2=max(pos_lst(:,2));
% a22=min(pos_lst(:,2));
a1=max(pos_lst(:,1));
a11=0;
a2=max(pos_lst(:,2));
a22=0;
binsize=0.2;
% f=(pos_lst1(:,1)>a11 & pos_lst1(:,2)>a22 & pos_lst1(:,1)<a1 & pos_lst1(:,2)<a2);
% pos_lst=pos_lst1(f,:);
% R=R(:,[1 2 5 6]);
%to define the central box
f=(pos_lst(:,1)>a1/4 & pos_lst(:,1)<((3*a1/4)) & pos_lst(:,2)>a2/4 & pos_lst(:,2)<((3*a2/4)));
H=pos_lst(f,[1 2 5]);
n=max(pos_lst(:,5));
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
BB=unique(pos_lst(:,5));
for i=1:1:20
    f1=(pos_lst(:,5)==BB(i)); %(i)
    A=pos_lst(f1,1:2);
    f2=(H(:,3)==BB(i)); %(i)
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
gr(:,2)=((5)*(sum(GR,2)))/20;
% clear R
% filename='E:\1boxes\W5-gofr-final-smallparticles.mat';
% save(filename);
% A=zeros(200,2);
% for i=1:1:200
%     f=R(:,3)==i;
%     A(i,1)=mean(R(f,1));
%     A(i,2)=mean(R(f,2));
% end