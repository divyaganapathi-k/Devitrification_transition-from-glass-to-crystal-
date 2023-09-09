% pos_lst=[];
for k=108:1:2000
    A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Set10\',num2str(k,'%04d'),'.tif'));
    A=A(1:320,:);
    imshow(A);
    hold on
    f=(pos_lst_corrected(:,5)==k);
    scatter(pos_lst_corrected(f,1),pos_lst_corrected(f,2),10,'g','filled');
    add=[];
    [add(:,1),add(:,2)]=getpts;
    add(:,3)=k;
    center=pos_lst_corrected(f,[1 2 5]);
    center=vertcat(center,add);
    pos_lst=vertcat(pos_lst,center);
end