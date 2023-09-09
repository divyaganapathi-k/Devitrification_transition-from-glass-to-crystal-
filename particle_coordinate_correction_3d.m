clearvars -except pos_lst
pos_lst_final=[];
for i=1:1:max(pos_lst(:,6))
    pos_lst1=[]; I1=[]; I2=[];
    f=pos_lst(:,6)==i;
    pos1=pos_lst(f,:);
    [D,I]=pdist2(pos1(:,1:3),pos1(:,1:3),'euclidean','Smallest',2);
    f=D(2,:)<=11;
    I1(1,:)=I(1,:).*f;
    I1(2,:)=I(2,:).*f;
    I2(:,1)=nonzeros(I1(1,:));
    I2(:,2)=nonzeros(I1(2,:));
    I2=sort(I2,2);
    I2=unique(I2,'rows');
    f=~f;
    II=I(1,:).*f;
    II=nonzeros(II);
    pos_lst1=pos1(II,:);
    A=pos_lst(I2(:,1),:);
    B=pos_lst(I2(:,2),:);
    pos=[];
    pos(:,1)=(A(:,1)+B(:,1))/2;
    pos(:,2)=(A(:,2)+B(:,2))/2;
    pos(:,3)=(A(:,3)+B(:,3))/2;
    pos(:,4:6)=pos1(I2(:,1),4:6);
    pos_lst1=vertcat(pos_lst1,pos);
    pos_lst_final=vertcat(pos_lst_final,pos_lst1);
end