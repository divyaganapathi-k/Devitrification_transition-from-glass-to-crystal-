% hard1=[];
% psi61=[];
% psi6=psi6_count;
% max(hard(:,3))
for i=1:1:2000
%     f1=(hard(:,3)==i);
%     A=hard(f1,:);
    f2=B(:,3)==i;
    D=B(f2,:);
%     A(:,1)=A(:,1)-D(1,1);
%     A(:,2)=A(:,2)-D(1,2);
%     hard1=vertcat(hard1,A);
    f3=(psi6(:,3)==i);
    C=psi6(f3,:);
    C(:,1)=C(:,1)-D(1,1);
    C(:,2)=C(:,2)-D(1,2);
    psi61=vertcat(psi6,C);
end