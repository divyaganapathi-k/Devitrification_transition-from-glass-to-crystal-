H=sortrows(H,[3 4]);
R=sortrows(R,[3 4]);
A=R(:,1:2)-H(:,1:2);
A(:,3:4)=R(:,3:4);
[A1,ia,ib]=unique(A(:,3));
B1=A(ia,:); %dedrift_100
for i=1:1:length(B1)
    f=pos_lst(:,3)==i;
    pos_lst(f,1)=pos_lst(f,1)-B1(i,1);
    pos_lst(f,2)=pos_lst(f,2)-B1(i,2);
end