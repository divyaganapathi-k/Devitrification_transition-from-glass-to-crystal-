% clearvars
% load('E:\Devitrification\Coordinates\Set1.mat');
% H=drift_loop(R,60);
clearvars -except R
sigma=11;
distance=12*1.4;
n=max(R(:,6));
psi4_time=zeros(n,2);
for i=1:1:n
    f=find(R(:,6)==i);
    A=R(f,[1 2 6 7]);
    TRI=delaunay(A(:,1),A(:,2));
    psi4=zeros(length(A(:,1)),1);
    for j=1:1:length(A(:,1))
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
        E(:,1)=(exp(4i.*C(f2,6)));
        F=find(isnan(E)==0);
        G=E(F,1);
        psi4(j,1)=mean(G(:,1)); 
    end
    F=find(isnan(psi4)==0);
    G=psi4(F,1);
    psi4_time(i,1)=mean(G);
    psi4_time(i,2)=abs(psi4_time(i,1));
end