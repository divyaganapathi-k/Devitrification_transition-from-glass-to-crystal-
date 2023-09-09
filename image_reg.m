for i=1:1:100
%     fixed=imread(strcat('E:\Crystal2_bp1\',num2str(i-1,'%04d'),'.tif'));
%     moving=imread(strcat('E:\Crystal2_bp1\',num2str(i,'%04d'),'.tif'));
fixed=rgb2gray(fixed);
moving=rgb2gray(moving);
    movingRegistered = imregister(moving(:,:,1), fixed(:,:,1), 'translation',optimizer,metric);
end