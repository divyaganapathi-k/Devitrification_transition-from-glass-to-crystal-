clearvars -except Global_bond_ord
%use global_bond_ord to obtain W6
l=6;
j1=6; j2=6; j3=6;
m1=-l:1:l;
m2=-l:1:l;
m3=-l:1:l;
%to consider only those combinations where m1+m2+m3=0;
A=repmat(m3',169,1);
BB=repelem(m2,13);
BB=BB';
B=repmat(BB,13,1);
C=(repelem(m1,169))';
M=horzcat(C,B,A);
M(:,4)=sum(M(:,1:3),2);
f=M(:,4)==0;
M=M(f,:);
%calculation of 3j symbols using Racah formula
triangle_coefficient=((factorial(l)*factorial(l)*factorial(l))/factorial((3*l)+1))^(0.5);
M(:,5)=(-1).^(j1-j2-M(:,3));
M(:,6)=((factorial(j1-M(:,1))).*(factorial(j1+M(:,1))).*(factorial(j2-M(:,2))).*(factorial(j2+M(:,2))).*(factorial(j3-M(:,3))).*(factorial(j3+M(:,3)))).^(0.5);
M(:,7)=zeros(length(M(:,1)),1);
%computing t the set of integers for all combinations
for i=1:1:length(M(:,1))
    t1 = j2 - M(i,1) - j3;
    t2 = j1 + M(i,2) - j3;
    t3 = j1 + j2 - j3;
    t4 = j1 - M(i,1);
    t5 = j2 + M(i,2);
    tmin = max(0,max(t1,t2));
    tmax = min(t3,min(t4,t5));
    wigner = 0;
    for t = tmin:tmax
        wigner = wigner +( (-1)^t / ( factorial(t) * factorial(t-t1) * factorial(t-t2) * factorial(t3-t) * factorial(t4-t) * factorial(t5-t) ));
    end
    M(i,7)=wigner;
end
%calculating W6 for all the particles in each frame
W6=[];
for i=1:1:max(Global_bond_ord(:,4))
    f=Global_bond_ord(:,4)==i;
    coor=Global_bond_ord(f,:);
    w6=zeros(length(coor(:,1)),1);
    for j=1:1:length(coor(:,1))
        N=zeros(127,4);
        N(:,1)=coor(j,M(:,1)+11);
        N(:,2)=coor(j,M(:,2)+11);
        N(:,3)=coor(j,M(:,3)+11);
        N(:,4)=M(:,5).*triangle_coefficient.*M(:,6).*M(:,7).*N(:,1).*N(:,2).*N(:,3);
        w6(j,1)=sum(N(:,4));
    end
%     w6=w6./((coor(:,end)).^(3/2));
    w61=abs(w6);
    W6=vertcat(W6, horzcat(coor(:,1:4),w6));
end