Local_bond_ord1=Local_bond_ord;
absolute_values1=(abs(Local_bond_ord(:,5:17))).^2;
Local_bond_ord1(:,18)=sum(absolute_values1,2);
Local_bond_ord1(:,5:17)=bsxfun(@rdivide,Local_bond_ord1(:,5:17),Local_bond_ord1(:,18));
clearvars -except Local_bond_ord1
% %to compute d6 from q6 defined in cates' paper
sigmadip=18*1.4;
D6=[];
for i=1:1:max(Local_bond_ord1(:,4))
    f=Local_bond_ord1(:,4)==i;
    A=Local_bond_ord1(f,:);
    [dist,I]=pdist2(A(:,1:3),A(:,1:3),'euclidean','Smallest',25);
    f=dist<=sigmadip;
    I=I.*f;
    B=zeros(length(A(:,1)),31);
    for j=1:1:length(A(:,1))
        JJ=nonzeros(I(:,j));
        R=A(JJ,:);
        R1=conj(R);
        R=bsxfun(@times,R1(:,5:end-1),R(1,5:end-1));
        R=R(2:end,:);
        R2=sum(R,2);
        R2(:,2)=abs(R(:,1));
        f1=sum(R2(:,2)>0.7);
        f2=sum(R2(:,2)>0.5);
        B(j,:)=horzcat(A(j,1:4),(R2(:,1)'),zeros(1,25-length(R2(:,1))),f1,f2);
    end
    D6=vertcat(D6,B);
end