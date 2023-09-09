%static structure factor as a function of time
clearvars -except psi6_all
i=1; j=5;
sz=512;
f=(psi6_all(:,1)>=((i-1)*sz) & psi6_all(:,1)<(i*sz) & psi6_all(:,2)>=((j-1)*sz) & psi6_all(:,2)<(j*sz));
coor=psi6_all(f,:);
a1=max(coor(:,1));
a11=min(coor(:,1));
a2=max(coor(:,2));
a22=max(coor(:,2));
binsize=0.2;
%to define the central box
f=find(coor(:,1)>a1/4 & coor(:,1)<((3*a1/4)) & coor(:,2)>a2/4 & coor(:,2)<((3*a2/4)));
H=coor(f,:);
n=max(coor(:,5));
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
% 
for i=1:1:max(pos_lst(:,5))
    f1=find(coor(:,5)==i);
    A=coor(f1,1:2);
    f2=find(H(:,5)==i);
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
% 
gr(:,2)=(5)*(sum(GR,2)/max(pos_lst(:,5)));


for i=1:1:100
%     F:\Devitrification\Crystal1\Grid_calculations\g_r\1,5
end