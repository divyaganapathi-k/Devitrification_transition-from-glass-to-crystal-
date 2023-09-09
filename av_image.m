B=uint8(zeros(4218,4297));
for i=1101:1:3101
    A=imread(strcat('D:\Sample5_2D_data\Sample5_xyplane_dedrift_imagej\',num2str(i,'%05d'),'.tif'));
    B=imadd(B,A);
    B=B/2;
end
imshow(B);
j=1;
print(strcat('C:\Users\Divya\Desktop\',num2str(j)),'-dtiff','-r1000');