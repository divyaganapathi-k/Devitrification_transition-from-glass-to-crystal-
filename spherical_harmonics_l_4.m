clearvars -except Local_bond_ord
Local_bond_ord_4=Local_bond_ord(:,[1 2 3 4 7 8 9 10 11 12 13 14 15]);
absolute_values1=(abs(Local_bond_ord_4(:,5:13))).^2;
Local_bond_ord_4(:,14)=(((4*pi)/9)*sum(absolute_values1,2)).^(0.5);
clearvars -except Local_bond_ord_4
sigmadip=1.4*18;
Global_bond_ord_4=[];
for i=min(Local_bond_ord_4(:,4)):1:max(Local_bond_ord_4(:,4))
    f=Local_bond_ord_4(:,4)==i;
    coor=Local_bond_ord_4(f,:);
    [dist,I]=pdist2(coor(:,1:3),coor(:,1:3),'euclidean','Smallest',25);
    f=dist<=sigmadip;
    I=I.*f;
    global_bond_ord_4=zeros(length(coor(:,1)),13);
    for j=1:1:length(coor(:,1))
        JJ=nonzeros(I(:,j));
        R=coor(JJ,:);
        global_bond_ord_4(j,1:4)=coor(j,1:4);
        global_bond_ord_4(j,5:13)=mean(R(:,(5:end-1)),1);
    end
    Global_bond_ord_4=vertcat(Global_bond_ord_4,global_bond_ord_4);
end
