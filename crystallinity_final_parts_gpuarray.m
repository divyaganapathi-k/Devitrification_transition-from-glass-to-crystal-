% clearvars -except pos_lst
distance=37.4*1.4;
time=3;
% n1=min(pos_lst(:,time));
% n2=max(pos_lst(:,time));
psi6_all1=[];
l=1;
% max(pos_lst(:,time))
for i=:1:7500
    psi6_frame=[];  %#ok<NASGU>
%     f=(pos_lst(:,time)==i);
%     A=pos_lst(f,:);
    f=psi6_all(:,3)==i;
    A=psi6_all(f,:);
    TRI=delaunay(A(:,1),A(:,2));
%     AA=imread(strcat('E:\Devitrification\Sample5\Sample_5_data\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
%     imshow(AA);
%     hold on
%     triplot(TRI,A(:,2),A(:,1));
%     hold off
    psi6=zeros(length(A(:,1)),1);
    psi6_complex=zeros(length(A(:,1)),1);
    count=zeros(length(A(:,1)),1);
%     A1=gpuArray(A);
%     TRI=gpuArray(TRI);
    for j=1:1:length(A1(:,1))
        f1=(any((TRI==j),2));
        B=unique(TRI(f1,:)); %contains indices of neighbours
        C=A(B,1:2); %#ok<*PFBNS>
        D=A(j,1:2);
        C(:,3)=C(:,1)-D(1,1);
        C(:,4)=C(:,2)-D(1,2);
        C(:,5)=(C(:,3).^2+C(:,4).^2).^(0.5);
        C(:,6)=atan((C(:,3))./(C(:,4)));
        C(:,6)=C(:,6)+(pi/2);
        %distance cutoff
        f2=(C(:,5)~=0 & C(:,5)<=distance);
        E=[];
        E(:,1)=(exp(6i.*C(f2,6)));
%         F= isnan(E)==0;
%         G=E(F,1);
%         G=E;
        g=mean(E);
        psi6_complex(j,1)=g;
        psi6(j,1)=abs(g);
        count(j,1)=sum(f2);
    end
    F1=(isnan(psi6)==0);
    G1=psi6(F1,1);
    psi6_time(l,1)=i;
    psi6_time(l,2)=mean(G1,1);
    l=l+1;
    psi6_frame=horzcat(A(:,[1 2 3]),psi6,count,psi6_complex);
%     psi6_frame(:,6)=i;
    psi6_all1=vertcat(psi6_all1,psi6_frame);
end