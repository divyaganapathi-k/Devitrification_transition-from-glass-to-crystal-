f=R(:,4)>2000 & R(:,4)<2500;
H=R(f,[1 2 3 4]);
for i=1:1:69
%     A=imread(strcat('E:\Devitrification\Sample5\Sample_5_data\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
%     A=imread(strcat('D:\Sample5_2D_data\Sample5_xyplane_dedrift_imagej\',num2str(i-1,'%05d'),'.tif'));
    A=imread(strcat('H:\Sample5_2\t',num2str(i,'%03d'),'_z100_c1.tif'));
    f=(H(:,3)==i);
    A(:,:,2)=A(:,:,1);
    A(:,:,3)=A(:,:,1);
    imshow(A);
    hold on
    scatter(H(f,1),H(f,2),5,H(f,4),'filled');
    caxis([2000 2500])
    colormap(hot)
    hold off
    saveas(gcf,strcat('F:\test\',num2str(i),'.tif'));
end

% for i=1:50:2000
%     A=imread(strcat('E:\Devitrification\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
%     f=(pos_lst(:,3)==i);
%     f1=(pos_lst1(:,5)==i);
%     A(:,:,2)=A(:,:,1);
%     A(:,:,3)=A(:,:,1);
%     imshow(A);
%     hold on
%     scatter(pos_lst1(f1,1),pos_lst1(f1,2),1,'r','filled');
%     scatter(pos_lst(f,1),pos_lst(f,2),1,'g','filled'); 
%     hold off
% %     saveas(gcf,strcat('F:\particle_scatter\',num2str(i),'.tif'));
%     print(strcat('F:\particle_scatter\',num2str(i)),'-dtiff','-r300');
% end

% for i=1:50:2000
%     A=imread(strcat('E:\Devitrification\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
%     f=(final_coordinates(:,3)==i);
%     A(:,:,2)=A(:,:,1);
%     A(:,:,3)=A(:,:,1);
%     imshow(A);
%     hold on
%     scatter(final_coordinates(f,1),final_coordinates(f,2),1,'g','filled'); 
%     hold off
% %     saveas(gcf,strcat('F:\particle_scatter\',num2str(i),'.tif'));
%     print(strcat('F:\particle_scatter1\',num2str(i)),'-dtiff','-r300');
% end