for i=170:10:4000  
    A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i ,'%04d'),'.tif'));
%     A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Set1\',num2str(i,'%04d'),'.tif'));
%     figure
    imshow(A);
    hold on
    f=find(coor(:,6)==i);
    f1=find(coor1(:,6)==i);
    scatter(coor(f,1),coor(f,2),10,'r','filled');
    scatter(coor1(f1,1),coor1(f1,2),20,'b');
    hold off
%     h=gcf;
%     saveas(h,strcat('E:\Devitrification\Coordinates\phi2_Set2\',num2str(i),'.tif'));
end