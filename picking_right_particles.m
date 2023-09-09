final_coordinates=[];
for i=1:1:2000
    f1=(pos_lst(:,3)==i);
    f2=(pos_lst1(:,5)==i);
    A=pos_lst(f1,:);
    B=pos_lst1(f2,[1 2 5]);
    %values required are in B
    [C,I]=pdist2(B(:,1:2),A(:,1:2),'euclidean','Smallest',1);
    f=(C<=12);
    I=I.*f;
    I=nonzeros(I);
    D=B(I,:);
%     f=~f;
%     D2=A(f,:);
%     D=vertcat(D1,D2);
    final_coordinates=vertcat(final_coordinates,D);
end