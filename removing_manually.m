% pos_lst=[];
for i=111:1:1200
    A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Set10\',num2str(i,'%04d'),'.tif'));
    A=A(1:320,:);
    imshow(A);
    hold on
    f=(psi6_all(:,3)==i);
    scatter(psi6_all(f,1),psi6_all(f,2),10,'g','filled');
    B=psi6_all(f,[1 2 3]);
    add=[];
    [add(:,1),add(:,2)]=getpts;
    add(:,3)=i;
    B=vertcat(B,add);
    pos_lst=vertcat(pos_lst,B);
    hold off
end