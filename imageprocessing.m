for i=360:1:360
    I=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i ,'%04d'),'.tif'));  
%     imshow(I);
    I = mat2gray(I);%convert to gray scale image
    I= imadjust(I);%enhance contrast of the image
    I= histeq(I);%it also enhance contrast in somewhat different way
    se = strel('disk',17);
    I = imtophat(I,se);%performs morphological bottom-hat filtering on the grayscale image 
    I= adapthisteq(I);%enhances the contrast of the grayscale image
    I = wiener2(I,[2 2]);%low pass filtering of images
    I = bpass(I,0.3,17);%mexican hat type convolution to get bandpassed images
    background = imopen(I,se);
    I = I - background;%substract background
    imshow(I);
end