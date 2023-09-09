% clearvars
% load('E:\Devitrification\Coordinates\Set1.mat');
clearvars -except coor
% coor=coor(:,[1 2 6]);
sigma=17.6;
distance=1.4*sigma;
% n=max(coor(:,3));
n=200;
psi6_time=zeros(n,2);
for i=1:1:n
    f=find(coor(:,3)==i);
    A=coor(f,:);
    aa=length(A(:,1));
    TRI=delaunay(A(:,1),A(:,2));
    %     %visualizing delaunay
    %     AA=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i,'%04d'),'.tif'));
    %     imshow(AA);
    %     hold on
    %     triplot(TRI,A(:,1),A(:,2));
    %     hold off
    psi6=zeros(length(A(:,1)),1);
    for j=1:1:aa
        f1=(any((TRI==j),2));
        B=unique(TRI(f1,:)); %contains indices of neighbours
        C=A(B,1:2); %#ok<*PFBNS>
        D=A(j,1:2); % A vertex also (x1,y1) in perpendicular distance calculation
        C(:,3)=C(:,1)-D(1,1);
        C(:,4)=C(:,2)-D(1,2);
        C(:,5)=(C(:,3).^2+C(:,4).^2).^(0.5);
        %distance cutoff
        f2=find(C(:,5)~=0 & C(:,5)<=distance);
        E=C(f2,1:2);
        %cosine formula: a2=c2+b2-2abcos(A), C angle opposite to c
        %A will be the vertex under consideration
        %B will be the first coordinate in the entry of E which has 0
        %radians with A
        %E(1,1:2) vertex B and(x2,y2)
        E(:,3)=E(:,1)-E(1,1);
        E(:,4)=E(:,2)-E(1,2);
        E(:,5)=(E(:,3).^2+E(:,4).^2).^(0.5); %contains a
        E(:,6)=E(:,1)-D(1,1);
        E(:,7)=E(:,2)-D(1,2);
        E(:,8)=(E(:,6).^2+E(:,7).^2).^(0.5); %contains b
        c2=((D(1,1)-E(1,1)).^2+(D(1,2)-E(1,2)).^2); % is c2 the baseline distance
        %calculating angles (E(:,12) will contain all the angles)
        E(:,9)=(E(:,8).^2)-(E(:,5).^2)+c2;
        E(:,10)=2.*(c2)^(0.5).*(E(:,8));
        E(:,11)=E(:,9)./E(:,10);
        E(:,12)=acos(E(:,11));
%         ang = atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0));
%         P2=[D(1,1),D(1,2)];
%         P1=[E(1,1),E(1,2)];
%         E(1,12)=0;
%         for k=2:1:length(E(:,1))
%             P0=[E(k,1),E(k,2)];
%             E(k,12)=atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0));
%         end
%         Equation of the line
        m=(E(1,2)-D(1,2))/(E(1,1)-D(1,1));  %slope of the line between vertex A and B
        F1=zeros(length(E(:,1)),1);
        F1(1,1)=0;
        for k=2:1:length(E(:,1))
            num=(m*(E(k,1)))-E(k,2)-(m*D(1,1))+D(1,2);
            den=(m^2+1).^(0.5);
            F1(k,1)=num/den;
        end
        E(1,12)==0;
        f=find(F1<0);
        E(f,12)=(2*pi)-E(f,12);
%         F=acos(E(:,12));
        G=(exp(6i.*E(:,12)));
        e=mean(G);
        psi6(j,1)=abs(e);
    end
    F=find(isnan(psi6)==0);
    G=psi6(F,1);
    psi6_time(i,1)=i;
    psi6_time(i,2)=mean(G);
end
