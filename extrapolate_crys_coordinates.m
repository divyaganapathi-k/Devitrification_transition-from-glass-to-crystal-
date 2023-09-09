f=(psi6_time(:,2)<0.7);
time=psi6_time(f(:,1));
for i=2:1:length(time)
    f=(psi6_all(:,3)==time(i) & psi6_all(:,4)>=0.7);
    A=psi6_all(f,:);
    f1=(psi6_all(:,3)==(time(i)-1) & psi6_all(:,4)>=0.7);
    B=psi6_all(f1,:);
    [C, I]=pdist2(A(:,1:2),B(:,1:2),'euclidean','Smallest',1);
%     D=pdist2(A(:,1:2),B(:,1:2));
    C=C';
    C(:,2)=A(I,4);
    C(:,3)=C(:,2)-B(:,4);
    f2=(C(:,1)<=5 & abs(C(:,3))<=0.05);
end