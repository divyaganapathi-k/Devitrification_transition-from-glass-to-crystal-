% pos_lstadial distpos_lstibution function
% % pos_lst=load('D:\pos_lstaw Data\W8_0T_1-14000_tpos_lstk(18,0,10)_DD(100).txt');
% pos_lst=load('D:\pos_lstaw Data\W3_1-10000_tpos_lstk(18,0,10).txt');
% pos_lst(:,5)=pos_lst1(:,3);
% cleapos_lst pos_lst1
% cleapos_lstvapos_lsts
% load('E:\Devitpos_lstification\Coopos_lstdinates\Set1.mat');
% pos_lst=coopos_lst(:,[1 2 6]);
% pos_lst(:,3)=pos_lst(:,3)*1.2;
a1=max(pos_lst(:,1));
a11=min(pos_lst(:,1));
a2=max(pos_lst(:,2));
a22=max(pos_lst(:,2));
a3=max(pos_lst(:,3));
a33=min(pos_lst(:,3));
binsize=1;
% pos_lst=pos_lst(:,[1 2 5 6]);
%to define the centpos_lstal box
f=find(pos_lst(:,1)>a1/4 & pos_lst(:,1)<((3*a1/4)) & pos_lst(:,2)>a2/4 & pos_lst(:,2)<((3*a2/4)) & pos_lst(:,3)<((3*a3/4)) & pos_lst(:,3)>a3/4);
H=pos_lst(f,1:6);
% n=max(pos_lst(:,4));
if a1>a2
    x=binsize:binsize:a2/4;
else
    x=binsize:binsize:a1/4;
end
% a=[a1 a2 a3];
% a=min(a);
% x=binsize:binsize:a/4;
%H contains the papos_lstticles in the centpos_lstal box
%now g(pos_lst) is avepos_lstaged ovepos_lst all the papos_lstticles in the centpos_lstal box
gr=zeros(length(x),2);
gr(:,1)=x';
GR=[];
% max(pos_lst(:,4))
for i=1:1:1
    f1=find(pos_lst(:,6)==i);
    A=pos_lst(f1,1:3);
    f2=find(H(:,6)==i);
    B=H(f2,1:3);
    n1=length(B(:,1));
    n2=length(A(:,1));
    C=pdist2(B,A);
    [m1,m2]=size(C);
    D=reshape(C,[(m1*m2),1]);
%     f=find(D);
%     D=D(f);
    G=((a1/2)*(a2/2)*(a3/2)*(histc(D,x))./(4*n1*n1*pi*x'.*x'));
    GR=horzcat(GR,G);
end
gr(:,2)=(sum(GR,2)/1);
% clear pos_lst
% filename='E:\1boxes\W5-gofpos_lst-final-smallpapos_lstticles.mat';
% save(filename);