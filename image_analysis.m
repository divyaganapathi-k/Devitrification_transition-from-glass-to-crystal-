clearvars
coor=[];
for i=1:1:1200
    A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i,'%04d'),'.tif'));
%     imshow(A);
    w=fspecial('gaussian',13);
    B=imfilter(A,w);
    B1=histeq(A);
    SE=strel('disk',7,0);
%     B1=imerode(A,SE);
% %     B1=imcomplement(B1);
    B1=imtophat(B1,SE);
    B1=imadjust(B1);
    B1= adapthisteq(B1,'clipLimit',0.02,'Distribution','rayleigh');
%     imshow(A);
    C=bpass(B1,2,9);
    D=feature2D(C,4,9,900,2,2);
    D(:,6)=i;
%     hold on
%     scatter(D(:,1),D(:,2),20,'b');
%     hold off
    coor=vertcat(coor,D);
end