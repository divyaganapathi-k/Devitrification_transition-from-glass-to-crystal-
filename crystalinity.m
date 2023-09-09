% clearvars
% load('E:\Devitrification\Coordinates\Set1.mat');
% H=drift_loop(R,60);
clearvars -except coor coor1
sigma=17.6;
distance=1.4*sigma;
% n=max(R(:,3));
psi6_time=zeros(200,2);
for i=1:1:max(coor(:,6))
    f=find(coor(:,6)==i);
%     A=R(f,[1 2 6 7]);
    A=coor(f,:);
    TRI=delaunay(A(:,1),A(:,2));
    psi6=zeros(length(A(:,1)),1);
    parfor j=1:1:length(A(:,1))
        f1=find(any((TRI==j),2));
        B=[];
        B=unique(TRI(f1,:));
        C=[];
        C=A(B,:);
        D=A(j,:);
        C(:,1)=C(:,1)-D(1,1);
        C(:,2)=C(:,2)-D(1,2);
        C(:,5)=(C(:,1).^2+C(:,2).^2).^(0.5);
        C(:,6)=atan2(abs(C(:,2)),abs(C(:,1)));
        %distance cutoff
        f2=find(C(:,6)~=0 & C(:,5)<=distance);
        E=[];
        E(:,1)=(exp(6i.*C(f2,6)));
        F=find(isnan(E)==0);
        G=E(F,1);
        g=abs(G);
        psi6(j,1)=mean(g); 
    end
    F=find(isnan(psi6)==0);
    G=psi6(F,1);
    psi6_time(i,1)=i;
    psi6_time(i,2)=mean(G);
    psi6_time(i,3)=abs((psi6_time(i,2)));
end