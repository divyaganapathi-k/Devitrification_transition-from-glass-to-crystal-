% pos_lst_mod=[];
dia=38;
for i=381:1:2000
    f=pos_lst(:,5)==i;
    A=pos_lst(f,:);
    a1=min(A(:,1)); a2=max(A(:,1)); b1=min(A(:,2)); b2=max(A(:,2));
    f=(A(:,1)>a1+dia & A(:,1)<a2+dia & A(:,2)>b1+dia & A(:,2)<b2+dia);
    A=A(f,:);
    pos_lst_mod=vertcat(pos_lst_mod,A);
end