% clearvars
% load('E:\Devitrification\Coordinates\Set1.mat');
clearvars -except coor 
% coor=coor(:,[1 2 6]);
sigma=17.6;
distance=1.4*sigma;
n=max(coor(:,3));
% n=200;
psi6_time=zeros(n,2);
for i=1:1:n
    f=find(coor(:,3)==i);
%     A=R(f,[1 2 6 7]);
    A=coor(f,:);
    TRI=delaunay(A(:,1),A(:,2));
%     %visualizing delaunay
%     AA=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i,'%04d'),'.tif'));
%     imshow(AA);
%     hold on
%     triplot(TRI,A(:,1),A(:,2));
%     hold off
    psi6=zeros(length(A(:,1)),1);
    parfor j=1:1:length(A(:,1))
        f1=(any((TRI==j),2));
        B=unique(TRI(f1,:)); %contains indices of neighbours
        C=A(B,1:2); %#ok<*PFBNS>
        D=A(j,1:2);
        C(:,1)=C(:,1)-D(1,1);
        C(:,2)=C(:,2)-D(1,2);
        C(:,3)=(C(:,1).^2+C(:,2).^2).^(0.5);
        C(:,4)=atan2((C(:,1)),(C(:,2)));
        %distance cutoff
        f2=find(C(:,3)~=0 & C(:,3)<=distance);
        E=[];
        E(:,1)=(exp(6i.*C(f2,4)));
        F= isnan(E)==0;
        G=E(F,1);
        g=mean(G);
        psi6(j,1)=abs(g); 
    end
    F=find(isnan(psi6)==0);
    G1=psi6(F,1);
    psi6_time(i,1)=i;
    psi6_time(i,2)=mean(G1);
end